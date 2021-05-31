from repository.ScheduleRepository import ScheduleRepository
from repository.OrderRepository import OrderRepository

class OrderService:
    def __init__(self):
        self.schedule = ScheduleRepository()
        self.order = OrderRepository()
        
    def registryTransport(self, db, driverId, day):
        paths = self.schedule.getPathsInDay(db, day)["paths"]
        for i in range(len(paths)):
            item = paths[i]
            if not item["has_driver"]:
                path = item["path"]
                self.schedule.registryTransport(db, day, i, driverId)
                self.order.registryTransport(db, day, path, driverId)
                return {"message": "Thành công"}
        return {"message": "Hết đơn hàng"}
    
    def getAllOrdersInDay(self, db, driverId, day):
        return [{
            "id": str(x["_id"]), 
            "order_name": x["order_name"], 
            "weight": x["weight"], 
            "price": x["price"], 
            "days_in_warehouse": x["days_in_warehouse"], 
            "status": x["status"], 
            "is_paid": x["is_paid"], 
            "customer_name": x["customer_name"], 
            "customer_phone": x["custome_phone"], 
            "priority": x["priority"], 
            "customer_address": x["customer_address"], 
            "longitude": x["longitude"], 
            "latitude": x["latitude"]
        } for x in self.order.getOrdersList(db, day, driverId)]
    
    def getDetailOrder(self, db, orderId):
        x = self.order.getDetailOrder(db, orderId)
        return {
            "id": str(x["_id"]), 
            "order_name": x["order_name"], 
            "weight": x["weight"], 
            "price": x["price"], 
            "days_in_warehouse": x["days_in_warehouse"], 
            "status": x["status"], 
            "is_paid": x["is_paid"], 
            "customer_name": x["customer_name"], 
            "customer_phone": x["custome_phone"], 
            "priority": x["priority"], 
            "customer_address": x["customer_address"], 
            "longitude": x["longitude"], 
            "latitude": x["latitude"]
        }
        
    def changeStatusOrder(self, db, orderId, status):
        if status not in ["in_warehouse", "transferring", "storage", "ship_success"]:
            return {"message": "Invalid status"}
        self.order.changeStatusOrder(db, orderId, status)
        return {"message": "Thành công"}