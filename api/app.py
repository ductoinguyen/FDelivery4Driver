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
    return app.response_class(json.dumps({"message":"success", "name": result["name"], "phone_number": result["phone_number"], "birthday": result["birthday"], "address": result["address"], "balance": result["balance"], "license_plates": result["license_plates"]}),mimetype='application/json')

@app.route("/info", methods=["GET"])
@cross_origin()
def getInfoDriver():
    if 'id' not in session:
        return app.response_class(json.dumps({"message": "fail"}),mimetype='application/json')
    return app.response_class(json.dumps({"message":"success", "name": session["name"], "phone_number": session["phone_number"], "birthday": session["birthday"], "address": session["address"], "balance": session["balance"], "license_plates": session["license_plates"]}),mimetype='application/json')

@app.route("/logout", methods=["GET"])
@cross_origin()
def logout():
    session.clear()
    return app.response_class(json.dumps({"message": "success"}),mimetype='application/json')

@app.route("/change-password", methods=["PUT"])
@required_data
@cross_origin()
def changePassword(oldPassword, newPassword, reNewPassword):
    if 'id' not in session:
        return app.response_class(json.dumps({"message": "fail", "detail": "Chưa đăng nhập"}),mimetype='application/json')
    if oldPassword != session["password"]:
        return app.response_class(json.dumps({"message": "fail", "detail": "Sai mật khẩu"}),mimetype='application/json')
    if oldPassword != newPassword:
        return app.response_class(json.dumps({"message": "fail", "detail": "Mật khẩu mới không khớp"}),mimetype='application/json')
    global db
    return app.response_class(json.dumps(DriverService().changePassword(db, ObjectId(session["id"]), newPassword)),mimetype='application/json')


@app.route("/check-password", methods=["POST"])
@required_data
@cross_origin()
def checkPassword(password):
    if 'id' not in session:
        return app.response_class(json.dumps({"message": "fail", "detail": "Chưa đăng nhập"}),mimetype='application/json')
    if password != session["password"]:
        return app.response_class(json.dumps({"message": "fail", "detail": "Sai mật khẩu"}),mimetype='application/json')
    return app.response_class(json.dumps({"message": "success"}),mimetype='application/json')

# ---------------------------------------------------------------------
# ---------------------------- API ORDER ------------------------------
# ---------------------------------------------------------------------
@app.route("/delivery/<day>", methods=["GET"])
@cross_origin()
def delivery(day):
    if 'id' not in session:
        return app.response_class(json.dumps({"message": "Chưa đăng nhập"}),mimetype='application/json')
    global db
    return app.response_class(json.dumps(OrderService().registryTransport(db, ObjectId(session["id"]), day)),mimetype='application/json')

@app.route("/order/list/<day>", methods=["GET"])
@cross_origin()
def listOrders(day):
    if 'id' not in session:
        return app.response_class(json.dumps({"message": "Chưa đăng nhập"}),mimetype='application/json')
    global db
    return app.response_class(json.dumps(OrderService().getAllOrdersInDay(db, ObjectId(session["id"]), day)),mimetype='application/json')

@app.route("/order/<orderId>", methods=["GET"])
@cross_origin()
def detailOrder(orderId):
    global db
    return app.response_class(json.dumps(OrderService().getDetailOrder(db, ObjectId(orderId))),mimetype='application/json')

@app.route("/order/<orderId>/<status>", methods=["PUT"])
@cross_origin()
def changeStatusOrder(orderId, status):
    if 'id' not in session:
        return app.response_class(json.dumps({"message": "Chưa đăng nhập"}),mimetype='application/json')
    return app.response_class(json.dumps(OrderService().changeStatusOrder(db, ObjectId(orderId), status)),mimetype='application/json')

# run
if __name__ == "__main__":
    app.run(debug=True)