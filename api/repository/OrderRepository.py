class OrderRepository:
    def registryTransport(self, db, day, ordersList, driverId):
        for i in range(len(ordersList)):
            db.order.update_one({"_id": ordersList[i]}, {
                "$set": {"date": day, "driverId": driverId, "status": "transferring", "index": i}
            })
        
    def getOrdersList(self, db, day, driverId):
        return db.order.find({"date": day, "driverId": driverId}).sort("index")
    
    def getDetailOrder(self, db, orderId):
        return db.order.find_one({"_id": orderId})
    
    def changeStatusOrder(self, db, orderId, status):
        db.order.update_one({"_id": orderId}, {"$set": {"status": status}})