import pymongo
from pymongo import MongoClient
from bson.objectid import ObjectId
from datetime import datetime
import requests, json
from datetime import datetime

class Node:
    def __init__(self, id, longitude, latitude, weight, days_in_warehouse, priority):
        self.id = id
        self.longitude = longitude
        self.latitude = latitude
        self.weight = weight
        self.days_in_warehouse = days_in_warehouse
        self.priority = priority
        
    def get_id(self):
        return self.id
    
    def get_longitude(self):
        return self.longitude
    
    def get_latitude(self):
        return self.latitude
    
    def get_weight(self):
        return self.weight
    
    def get_days_in_warehouse(self):
        return self.days_in_warehouse
    
    def get_priority(self):
        return self.priority
    
    def h(self, other_node):
        resp = requests.get('https://apis.wemap.asia/route-api/route?point=' + str(self.latitude) + '%2C' + str(self.longitude) + '&point='+ str(other_node.get_latitude()) + '%2C' + str(other_node.get_longitude()) + '&type=json&locale=en-US&vehicle=car&weighting=fastest&elevation=false&key=GqfwrZUEfxbwbnQUhtBMFivEysYIxelQ')
        data = resp.json()["paths"][0]
        distance = data["distance"]/1000
        time = data["time"]/30000
        return ((distance + time + other_node.get_weight() - other_node.get_days_in_warehouse())/other_node.get_priority(), distance, time)
        
    def best_choice(self, candidates):
        candidate = sorted([{"h": self.h(candidate), "candidate": candidate} for candidate in candidates], key=lambda x: x["h"][0])[0]
        return (candidate["candidate"], candidate["h"][1],  candidate["h"][2])

def connectDB():
    myClient = MongoClient("mongodb+srv://hequantri:hequantri@cluster0.q0gxn.gcp.mongodb.net/auctionDB?retryWrites=true&w=majority")
    db = myClient["FDelivery"]
    return db

def prepare_to_start(db):
    db.order.update_many({"status": {'$ne': "ship_success"}}, {'$inc': {'days_in_warehouse': 1}, '$set': {"status": "in_warehouse", "chosen": False}})

def has_product_need_to_delivery(db):
    return db.order.find({"status": "in_warehouse", "chosen": False}).count() > 0

def count_product_need_to_delivery(db):
    return db.order.find({"status": "in_warehouse", "chosen": False}).count()

def find_candidates(db, current_node, limit):
    return [Node(x["_id"], x["longitude"], x["latitude"], x["weight"], x["days_in_warehouse"], x["priority"]) for x in db.order.aggregate([
        {
            "$project": {
                "sosanh": {
                    "$add": [
                        {"$abs": {"$subtract": [current_node.get_longitude(), "$longitude"]}},
                        {"$abs": {"$subtract": [current_node.get_latitude(), "$latitude"]}}
                    ]
                },
                "longitude": True,
                "latitude": True, 
                "weight": True, 
                "days_in_warehouse": True, 
                "priority": True
            }
        },
        {
            "$sort": {"sosanh": 1}
        },
        {
            "$limit": limit
        }
    ])]

# print(find_candidates(connectDB(), Node(None, 105.782708, 21.038238, None, None, None), 10))

def handle_schedule(limit):
    db = connectDB()
    prepare_to_start(db)
    paths = []
    number_products = count_product_need_to_delivery(db)
    while number_products > 0:
        # (105.782708, 21.038238): UET
        path = []
        current_node = Node(None, 105.782708, 21.038238, None, None, None)
        total_hours = 0
        total_weight = 0
        while (total_hours <= 6*60 and total_weight <= 50 and number_products > 0):
            candidates = find_candidates(db, current_node, limit)
            if number_products % 10 == 0:
                print(number_products)
            candidate = current_node.best_choice(candidates)
            current_node = candidate[0]
            path.append(current_node)
            total_hours += candidate[1]
            total_weight += candidate[2]
            number_products -= 1
            
        paths.append(path)
    return paths

paths = (handle_schedule(5))
print([x["_id"] for x in paths])

"""
B?????c 0: Node(id, longitude, latitude, weight, days_in_warehouse, priority)

B?????c 1: C???p nh???t to??n b??? c??c ????n h??ng kh??ng ph???i ???? v???n chuy???n th??nh c??ng (ship_success) v??? trong kho (in_warehouse) 
    & c???ng th??m 1 ng??y v??o bi???n days_in_warehouse

B?????c 2: ?????nh ngh??a h??m ????nh gi??
    h = (time + distance + weight - days_in_warehouse)/priority

B?????c 3: Thu???t to??n
    paths = []
    while(c??n product c???n v???n chuy???n) {
        path = [kho], total_hours = 0, total_weight = 0
        
        while(total_hours <= 6 && total_weight <= 50 && c??n product c???n v???n chuy???n) {
            current_node = path.getLast()
            10_node_candidates = query_from_db_to_find_10_min(
                abs(current_node.latitude - latitude) + 
                abs(current_node.longitude - longitude)
            )
            
            chosen_node = best_of_10_node(current_node, h??m ????nh gi??, 10_nodes)
            path.append(chosen_node)
        }
        
        paths.append(path)
    }
    
B?????c 4: T??? paths chuy???n sang 1 instance schedule trong db 
    (
        id => auto_generated
        date => now()
        paths: [
            {
                has_driver: false,
                // ch??a c?? driver_id,
                shipments: [..order_id..]
            },
            {}
        ]
        full_slots: false
        first_index_empty: 0
    )
"""

# x = [x["price"] for x in db.order.find({"status": "in_warehouse"}, {"price"}) if x["price"] != ""]
# print(x)

# import requests, json

# resp = requests.get('https://apis.wemap.asia/geocode-1/search?text=101&size=10&key=GqfwrZUEfxbwbnQUhtBMFivEysYIxelQ')
# if resp.status_code == 200:
#     print(resp.json())

"""
_id: 608d524be4aac0497c6e8483
order_name: N???i Chi??n Ch??n Kh??ng ??i???n T??? Ranee RN-AF10LH
weight: 3.5
price: 1875
days_in_warehouse: 1
status: in_warehouse
is_paid: true
customer_name: Tr???n ?????c Long
custome_phone: 0957155718
priority: 1
customer_address: 11 Nguy???n Khang, Trung Ho??, C???u Gi???y, H?? N???i
longitude: 105.803835
latitude: 21.015521



"""