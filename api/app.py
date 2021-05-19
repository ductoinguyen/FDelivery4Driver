# import to support flask app
from flask import Flask, request, session
from flask_cors import CORS, cross_origin
from flask_required_args import required_data
from datetime import datetime
import os, json

# import to support connect DB
import pymongo
from pymongo import MongoClient
from bson.objectid import ObjectId

# import internal service files
from service.DriverService import DriverService
from service.OrderService import OrderService

# init flask app
app = Flask(__name__)

# set session secret key
app.secret_key = b'_5#y2L"F4Q8z\n\xec]/'

# enable cross_origin to call API
cors = CORS(app)
app.config['CORS_HEADERS'] = 'Content-Type'

# connect to DB
db = MongoClient("mongodb+srv://hequantri:hequantri@cluster0.q0gxn.gcp.mongodb.net/FDelivery?retryWrites=true&w=majority")["FDelivery"]

# ---------------------------------------------------------------------
# -------------------------- API ACCOUNT ------------------------------
# ---------------------------------------------------------------------
@app.route("/login", methods=["POST"])
@required_data
@cross_origin()
def login(phone_number, password):
    if 'username' in session:
        session.clear()
    global db
    result = DriverService().login(db, phone_number, password)
    if result is None:
        return app.response_class(json.dumps({"message":"fail"}),mimetype='application/json')
    session["id"] = str(result["_id"])
    session["phone_number"] = phone_number
    session["password"] = password
    session["name"] = result["name"]
    session["phone_number"] = result["phone_number"]
    session["birthday"] = result["birthday"]
    session["address"] = result["address"]
    session["balance"] = result["balance"]
    session["license_plates"] = result["license_plates"]
    return app.response_class(json.dumps({"message":"success", "id": str(result["_id"]), "name": result["name"], "phone_number": result["phone_number"], "birthday": result["birthday"], "address": result["address"], "balance": result["balance"], "license_plates": result["license_plates"]}),mimetype='application/json')

@app.route("/info/<driverId>", methods=["GET"])
@cross_origin()
def getInfoDriver(driverId):
    return app.response_class(json.dumps( DriverService().login(db, ObjectId(driverId))),mimetype='application/json')

@app.route("/logout", methods=["GET"])
@cross_origin()
def logout():
    session.clear()
    return app.response_class(json.dumps({"message": "success"}),mimetype='application/json')

@app.route("/change-password", methods=["PUT"])
@required_data
@cross_origin()
def changePassword(driverId, oldPassword, newPassword, reNewPassword):
    if oldPassword != newPassword:
        return app.response_class(json.dumps({"message": "fail", "detail": "Mật khẩu mới không khớp"}),mimetype='application/json')
    global db
    return app.response_class(json.dumps(DriverService().changePassword(db, ObjectId(driverId), oldPassword, newPassword)),mimetype='application/json')

# ---------------------------------------------------------------------
# ---------------------------- API ORDER ------------------------------
# ---------------------------------------------------------------------
@app.route("/delivery/<day>/<driverId>", methods=["GET"])
@cross_origin()
def delivery(day, driverId):
    global db
    return app.response_class(json.dumps(OrderService().registryTransport(db, ObjectId(driverId), day)),mimetype='application/json')

@app.route("/order/list/<day>/<driverId>", methods=["GET"])
@cross_origin()
def listOrders(day, driverId):
    global db
    return app.response_class(json.dumps(OrderService().getAllOrdersInDay(db, ObjectId(driverId), day)),mimetype='application/json')

@app.route("/order/<orderId>", methods=["GET"])
@cross_origin()
def detailOrder(orderId):
    global db
    return app.response_class(json.dumps(OrderService().getDetailOrder(db, ObjectId(orderId))),mimetype='application/json')

@app.route("/order/<orderId>/<status>", methods=["PUT"])
@cross_origin()
def changeStatusOrder(orderId, status):
    return app.response_class(json.dumps(OrderService().changeStatusOrder(db, ObjectId(orderId), status)),mimetype='application/json')

# run
if __name__ == "__main__":
    app.run(debug=True)