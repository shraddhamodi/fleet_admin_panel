import 'package:cloud_firestore/cloud_firestore.dart';
import 'address_model.dart';

class CustomerModel{
  String? id;
  String? name;
  String? image;
  String? email;
  String? phone;
  String? token;
  List? favouriteStore;
  List<AddressModel>? addressList;
  Timestamp? updateAt;
  Timestamp? createdAt;

  CustomerModel();
  CustomerModel.add(this.id,this.name,this.image,this.email,this.phone,this.token,this.favouriteStore,this.addressList,this.createdAt,this.updateAt);

  factory CustomerModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data()! as Map<String, dynamic>;
    return CustomerModel.fromJson(data);
  }

  List<AddressModel> convertAddressItems(List addressFromDb){
    List<AddressModel> result = [];
    for (var element in addressFromDb) {
      result.add(AddressModel.fromJson(element));
    }
    return result;
  }

  CustomerModel.fromJson(Map<String, dynamic> json) {
    id = json['customer_id'];
    name = json['name'];
    email = json['email'];
    image = json['image'];
    phone = json['phone'];
    token = json['token'];
    favouriteStore = json['favourite_store'];
    addressList = convertAddressItems(json['address_list'] ?? []);
    createdAt = json['created_at'];
    updateAt = json['updated_at'];
  }

  Map<String, dynamic> toMap() {
    return {
      'customer_id': id,
      'name': name,
      'email': email,
      'image': image,
      'phone': phone,
      'token': token,
      'favourite_store': favouriteStore,
      'address_list': addressList!.map<Map>((e)=> e.toMap()).toList(),
      'created_at': createdAt,
      'updated_at': updateAt,
    };
  }
}