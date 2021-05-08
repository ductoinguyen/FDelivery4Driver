class ScheduleRepository:
    def hasAvailablePath(self, db, day):
      	return db.schedule.count_documents({"date": day, "paths": {"$elemMatch": {"has_driver": False}}}) > 0
        
    def getPathsInDay(self, db, day):
        return db.schedule.find_one({"date": day}, {"paths": True})
    
    def registryTransport(self, db, day, index, driverId):
        db.schedule.update({"date": day}, {
            "$set": {
                "paths." + str(index) + ".has_driver": True,
                "paths." + str(index) + ".driverId": driverId
			}
		})