import 'package:cloud_firestore/cloud_firestore.dart';

import '../../customers/models/address_model.dart';

class StoreModel{
  String? storeId;
  String? storeName;
  String? storeOwnerName;
  String? email;
  String? website;
  String? phone;
  String? fcmToken;
  String? paymentUPI;
  bool? isFavourite;
  int? noOfUser;
  num? rating;
  List? images;
  List? banner;
  AddressModel? addressModel;
  Timestamp? updateAt;
  Timestamp? createdAt;

  StoreModel();
  StoreModel.data(this.storeName,this.storeOwnerName,this.email,this.phone,this.images,this.createdAt,this.updateAt);

  factory StoreModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data()! as Map<String, dynamic>;
    return StoreModel.fromJson(snapshot.id,data);
  }

  StoreModel.fromJson(String id,Map<String, dynamic> json) {
    storeId = json['store_id'];
    storeName = json['store_name'];
    storeOwnerName = json['store_owner_name'];
    email = json["email"];
    website = json["website"];
    phone = json["phone"];
    isFavourite = json["is_favourite"];
    noOfUser = json["no_of_user"];
    rating = json["rating"];
    images = json["images"];
    banner = json["banner"];
    fcmToken = json["fcm_token"];
    paymentUPI = json["payment_upi"];
    addressModel = AddressModel.fromJson(json['address']);
    updateAt = json["updated_at"];
    createdAt = json["created_at"];
  }

  Map<String, dynamic> toJson() =>
      {
        'store_id': storeId,
        'store_name': storeName,
        'store_owner_name': storeOwnerName,
        'email': email,
        'website': website,
        'phone': phone,
        'is_favourite': isFavourite,
        'no_of_user': noOfUser,
        'rating': rating,
        'images': images,
        'banner': banner,
        'fcm_token': fcmToken,
        'payment_upi': paymentUPI,
        'address': addressModel!.toMap(),
        'created_at': updateAt,
        'updated_at': createdAt,
      };

}