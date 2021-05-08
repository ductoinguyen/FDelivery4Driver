class OrderRepository:
    def registryTransport(self, db, day, ordersList, driverId):
        db.order.update_many({"_id": {"$in": ordersList}}, {
            "$set": {"date": day, "driverId": driverId}
        })
        
    def getOrdersList(self, db, day, driverId):
        return db.order.find({"date": day, "driverId": driverId})
    
    def getDetailOrder(self, db, orderId):
        return db.order.find_one({"_id": orderId})
    
    def changeStatusOrder(self, db, orderId, status):
        db.order.update_one({"_id": orderId}, {"$set": {"status": status}})