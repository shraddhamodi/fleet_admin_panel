import 'package:cloud_firestore/cloud_firestore.dart';

class BannerModel{
  String? bannerId;
  String? image;
  Timestamp? updateAt;
  Timestamp? createdAt;

  BannerModel();
  BannerModel.data(this.bannerId,this.image,this.createdAt,this.updateAt);

  factory BannerModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data()! as Map<String, dynamic>;
    return BannerModel.fromJson(snapshot.id,data);
  }

  BannerModel.fromJson(String id,Map<String, dynamic> json) {
    bannerId = json['banner_id'];
    image = json['image'];
    updateAt = json["updated_at"];
    createdAt = json["created_at"];
  }

  Map<String, dynamic> toJson() =>
      {
        'banner_id': bannerId,
        'image': image,
        'created_at': updateAt,
        'updated_at': createdAt,
      };

}