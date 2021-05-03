"""
!pip3 install pymongo[srv]
!pip3 install pymongo
!pip3 install dnspython
!pip install requests
"""

import pymongo
from pymongo import MongoClient
from bson.objectid import ObjectId
from datetime import datetime
import requests, json

def connectDB():
    myClient = MongoClient("mongodb+srv://hequantri:hequantri@cluster0.q0gxn.gcp.mongodb.net/FDelivery?retryWrites=true&w=majority")
    db = myClient["FDelivery"]
    return db

def prepare_to_start(db):
    db.order.update_many({"status": {'$ne': "ship_success"}}, {'$inc': {'days_in_warehouse': 1}, '$set': {"status": "in_warehouse", "is_scheduled": False}})

def has_product_need_to_delivery(db):
    return db.order.count_documents({"status": "in_warehouse", "is_scheduled": False}) > 0

def update_init_path(db, skip):
    (longitude, latitude) = (105.782708, 21.038238) # UET
    return [{"_id": x["_id"], "relation": x["relation"]} for x in db.order.aggregate([
        { "$match": { "is_scheduled" : False } }, 
        {
            "$project": {
                "sosanh": {
                    "$add": [
                        {"$abs": {"$subtract": [longitude, "$longitude"]}},
                        {"$abs": {"$subtract": [latitude, "$latitude"]}}
                    ]
                },
                "relation": True
            }
        },
        {
            "$sort": {"sosanh": 1}
        },
        {
            "$skip": skip
        },
        {
            "$limit": 10
        }
    ])]

def mark_choose_node(db, id):
    db.order.update_one({"_id": id}, {"$set": {"is_scheduled": True}})

def next_node(db, current_node):
    # chỉ dùng khi đã tồn tại init_node
    results = db.order.find({"_id": {"$in": [x["_id"] for x in current_node["relation"]]}, "is_scheduled": False}, {"weight": True, "days_in_warehouse": True, "priority": True, "relation": True})
    candidates = []
    for result in results:
        (time, distance) = [(x["time"], x["distance"]) for x in current_node["relation"] if x["_id"] == result["_id"]][0]
        (weight, days_in_warehouse, priority) = (result["weight"], result["days_in_warehouse"], result["priority"])
        candidates.append({"_id": result["_id"], "h": (time + distance + weight - days_in_warehouse)/priority, "time": time, "weight": weight, "relation": result["relation"]})
    if candidates == []: 
        # không còn list ứng viên tiềm năng (hiếm) => chọn luôn order thứ 11
        (longitude, latitude) = [(x["longitude"], x["latitude"]) for x in db.order.find({"_id": current_node["_id"]}, {"longitude": True, "latitude": True})][0]
        candidate = [{"_id": x["_id"], "relation": x["relation"], "longitude": x["longitude"], "latitude": x["latitude"], "weight": x["weight"]} for x in db.order.aggregate([
            { "$match": { "is_scheduled" : False } }, 
            {
                "$project": {
                    "sosanh": {
                        "$add": [
                            {"$abs": {"$subtract": [longitude, "$longitude"]}},
                            {"$abs": {"$subtract": [latitude, "$latitude"]}}
                        ]
                    },
                    "relation": True,
                    "longitude": True,
                    "latitude": True,
                    "weight": True
                }
            },
            { "$sort": {"sosanh": 1} },
            { "$limit": 1 }
        ])][0]
        resp = requests.get('https://apis.wemap.asia/route-api/route?point=' + str(latitude) + '%2C' + str(longitude) + '&point='+ str(candidate["latitude"]) + '%2C' + str(candidate["longitude"]) + '&type=json&locale=en-US&vehicle=car&weighting=fastest&elevation=false&key=GqfwrZUEfxbwbnQUhtBMFivEysYIxelQ')
        data = resp.json()["paths"][0]
        time = data["time"]/30000
        return ({"_id": candidate["_id"], "relation": candidate["relation"]}, time, candidate["weight"])
    candidate = sorted(candidates, key=lambda x: x["h"])[0]
    return ({"_id": candidate["_id"], "relation": candidate["relation"]}, candidate["time"], candidate["weight"])

def handle_new_schedule():
    db = connectDB()
    prepare_to_start(db)
    paths = []
    init_path = []
    index = 0

    # còn sản phẩm cần vận chuyển thì sẽ lập lịch
    while has_product_need_to_delivery(db):
        # init cho mỗi path
        if index == len(init_path):
            init_path = update_init_path(db, index)
            index = 0
        current_node = init_path[index]
        mark_choose_node(db, current_node["_id"])
        index += 1
        path = [current_node]
        total_time = 0
        total_weight = 0

        # bắt đầu lập lịch từng path
        while (total_time <= 3*60 and total_weight <= 40 and has_product_need_to_delivery(db)):
            (current_node, time, weight) = next_node(db, current_node)
            total_time += time + 5
            total_weight += weight
            path.append(current_node)
            mark_choose_node(db, current_node["_id"])
        print(len(path), path)
        paths.append(path)         
    return paths

paths = handle_new_schedule()

# for path in paths:
#     print("len", len(path))
#     for node in path:
#         print(node["_id"], end=", ")
#     print()
    

db = connectDB()
print(datetime.now().strftime("%Y-%m-%d"))

db.schedule.update({"date": datetime.now().strftime("%Y-%m-%d")}, {"$set": {"paths": [{"has_driver": False, "path": [node["_id"] for node in path]} for path in paths]}}, upsert=True)    