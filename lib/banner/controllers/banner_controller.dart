import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../acum_base_controller.dart';

class BannerController extends AcumBaseController {

  RxList<String> bannerList = <String>[].obs;
  final selectedBanner = "".obs;

  getMainCategoryList() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection("banners").get();
    for (int i = 0; i < querySnapshot.docs.length; i++) {
      bannerList.add(querySnapshot.docs[i]["name"]);
    }
    selectedBanner.value = bannerList.first;
  }
}