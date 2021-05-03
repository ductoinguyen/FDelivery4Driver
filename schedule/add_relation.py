import json
import pymongo
from pymongo import MongoClient
from bson.objectid import ObjectId
from datetime import datetime
import requests, json
from datetime import datetime

def connectDB():
    myClient = MongoClient("mongodb+srv://hequantri:hequantri@cluster0.q0gxn.gcp.mongodb.net/auctionDB?retryWrites=true&w=majority")
    db = myClient["FDelivery"]
    return db

db = connectDB()
f = open('relation.json')
data = json.load(f)

# warehouse = {}

for row in data:
    # if row["id"] in warehouse:
    #     warehouse[row["id"]] = []
    # warehouse["id"]
    db.order.update_one({"_id": ObjectId(row["id"])}, {"$push": {"relation": {
        "_id": ObjectId(row["relation"]["id"]),
        "distance": row["relation"]["distance"],
        "time": row["relation"]["time"]
    }}})
    # pass

f.close()