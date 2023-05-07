import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../acum_base_controller.dart';

class StoreController extends AcumBaseController {

  RxList<String> storeList = <String>[].obs;
  final selectedStore = "".obs;

  getMainCategoryList() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection("stores").get();
    for (int i = 0; i < querySnapshot.docs.length; i++) {
      storeList.add(querySnapshot.docs[i]["name"]);
    }
    selectedStore.value = storeList.first;
  }
}