import 'package:cloud_firestore/cloud_firestore.dart';

class DriverModel{
  int? index;
  String? driverId;
  String? name;
  String? password;
  String? email;
  String? phone;
  Timestamp? updateAt;
  Timestamp? createdAt;

  DriverModel();
  DriverModel.edit(this.driverId,this.name,this.password,this.email,this.phone,this.createdAt,this.updateAt);
  DriverModel.add(this.index,this.driverId,this.name,this.password,this.email,this.phone,this.createdAt,this.updateAt);

  factory DriverModel.fromSnapshot(int index,DocumentSnapshot snapshot) {
    final data = snapshot.data()! as Map<String, dynamic>;
    return DriverModel.fromJson(index,data);
  }

  DriverModel.fromJson(int id,Map<String, dynamic> json) {
    index = id;
    driverId = json['driver_id'];
    name = json['name'];
    password = json["password"];
    email = json["email"];
    phone = json["phone"];
    updateAt = json["updated_at"];
    createdAt = json["created_at"];
  }

  Map<String, dynamic> toJson() =>
      {
        'driver_id': driverId,
        'name': name,
        'password': password,
        'email': email,
        'phone': phone,
        'created_at': updateAt,
        'updated_at': createdAt,
      };

}