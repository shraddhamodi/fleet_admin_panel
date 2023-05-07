import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../acum_base_controller.dart';

class UsersController extends AcumBaseController {

  RxList<String> categoryList = <String>[].obs;
  final selectedCategory = "".obs;

  getMainCategoryList() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection("customer").get();
    for (int i = 0; i < querySnapshot.docs.length; i++) {
      categoryList.add(querySnapshot.docs[i]["name"]);
    }
    selectedCategory.value = categoryList.first;
  }
}