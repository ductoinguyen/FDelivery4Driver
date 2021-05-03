import pymongo
from pymongo import MongoClient
from bson.objectid import ObjectId
from datetime import datetime
import requests, json
from datetime import datetime
from flask import Flask, request, jsonify, render_template
import os
import json
import time
import datetime

def connectDB():
    myClient = MongoClient("mongodb+srv://hequantri:hequantri@cluster0.q0gxn.gcp.mongodb.net/auctionDB?retryWrites=true&w=majority")
    db = myClient["FDelivery"]
    return db

def find_candidates(db, longitude, latitude, limit):
    return [{"id": str(x["_id"]), "longitude": x["longitude"], "latitude": x["latitude"], "chosen": False} for x in db.order.aggregate([
        {
            "$project": {
                "sosanh": {
                    "$add": [
                        {"$abs": {"$subtract": [longitude, "$longitude"]}},
                        {"$abs": {"$subtract": [latitude, "$latitude"]}}
                    ]
                },
                "longitude": True,
                "latitude": True
            }
        },
        {
            "$sort": {"sosanh": 1}
        },
        {
            "$limit": limit
        }
    ])]


from flask_cors import CORS, cross_origin
app = Flask(__name__)
cors = CORS(app)
app.config['CORS_HEADERS'] = 'Content-Type'
db = connectDB()

@app.route("/relations/<longitude>/<latitude>", methods=["GET"])
@cross_origin()
def getRelations(longitude, latitude):
    latitude = float(latitude)
    longitude = float(longitude)
    global db
    results = find_candidates(db, longitude, latitude, 10)
    return app.response_class(json.dumps(results), mimetype='application/json')

@app.route("/all/<int:limit>", methods=["GET"])
@cross_origin()
def all(limit):
    global db
    results = []
    for x in db.order.find({}, {"_id": True, "longitude": True, "latitude": True}):
        result = find_candidates(db, x["longitude"], x["latitude"], limit)
        results.append({"id": str(x["_id"]), "longitude": x["longitude"], "latitude": x["latitude"], "relations": result})
    #     pass
    # results = [{"id": str(x["_id"]), "longitude": x["longitude"], "latitude": x["latitude"]} 
    #     for x in db.order.find({}, {"_id": True, "longitude": True, "latitude": True})]
    return app.response_class(json.dumps(results), mimetype='application/json')


if __name__ == "__main__":
    app.run()