import 'package:cloud_firestore/cloud_firestore.dart';

class DriverModel{
  String? driverId;
  String? name;
  String? password;
  String? email;
  String? phone;
  Timestamp? updateAt;
  Timestamp? createdAt;

  DriverModel();
  DriverModel.add(this.driverId,this.name,this.password,this.email,this.phone,this.createdAt,this.updateAt);

  factory DriverModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data()! as Map<String, dynamic>;
    return DriverModel.fromJson(snapshot.id,data);
  }

  DriverModel.fromJson(String id,Map<String, dynamic> json) {
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