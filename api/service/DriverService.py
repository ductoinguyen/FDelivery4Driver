from repository.DriverRepository import DriverRepository


class DriverService:
    def __init__(self):
        self.driver = DriverRepository()
        
    def login(self, db, phone_number, password):
        return self.driver.getAccount(db, phone_number, password)
    
    def changePassword(self, db, driverId, oldPassword, newPassword):
        self.driver.changePassword(db, driverId, oldPassword, newPassword)
        return {"message": "success"}
    
    def getAccount(self, db, driverId):
        return self.driver.getDriver(db, driverId)
