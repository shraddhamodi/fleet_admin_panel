import 'package:cloud_firestore/cloud_firestore.dart';

class MainCategoryModel{
  String? categoryId;
  String? name;
  String? image;
  Timestamp? updateAt;
  Timestamp? createdAt;

  MainCategoryModel();
  MainCategoryModel.data(this.categoryId,this.name,this.image,this.createdAt,this.updateAt);

  factory MainCategoryModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data()! as Map<String, dynamic>;
    return MainCategoryModel.fromJson(snapshot.id,data);
  }

  MainCategoryModel.fromJson(String id,Map<String, dynamic> json) {
    categoryId = json['category_id'];
    name = json['name'];
    image = json['image'];
    updateAt = json["updated_at"];
    createdAt = json["created_at"];
  }

  Map<String, dynamic> toJson() =>
      {
        'category_id': categoryId,
        'name': name,
        'image': image,
        'created_at': updateAt,
        'updated_at': createdAt,
      };

}