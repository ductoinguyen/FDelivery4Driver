class Driver {
  Driver({
    this.id,
    this.name,
    this.phoneNumber,
    this.password,
    this.birthday,
    this.address,
    this.balance,
    this.licensePlates,
  });

  String id;
  String name;
  String phoneNumber;
  String password;
  String birthday;
  String address;
  int balance;
  String licensePlates;

  factory Driver.fromJson(Map<String, dynamic> json) => Driver(
    id: json["id"],
    name: json["name"],
    phoneNumber: json["phone_number"],
    password: json["password"],
    birthday: json["birthday"],
    address: json["address"],
    balance: json["balance"],
    licensePlates: json["license_plates"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "phone_number": phoneNumber,
    "password": password,
    "birthday": birthday,
    "address": address,
    "balance": balance,
    "license_plates": licensePlates,
  };
}

Driver driver;
bool hasBooked = false;