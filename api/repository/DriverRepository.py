class DriverRepository:
    def getAccount(self, db, phone_number, password):
        return db.driver.find_one({"phone_number": phone_number, "password": password}, {"name": True, "phone_number": True, "password": True, "birthday": True, "address": True, "balance": True, "license_plates": True})
    
    def changePassword(self, db, driverId, password):
        db.driver.update_one({"_id": driverId}, {"$set": {"password": password}})