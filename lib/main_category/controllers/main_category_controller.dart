import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ready/ready.dart';

import '../models/main_category_model.dart';

abstract class MainCategoryController extends Cubit<ReadyListState<MainCategoryModel, dynamic>>
    implements ReadyListController<MainCategoryModel> {
  MainCategoryController(ReadyListState<MainCategoryModel, dynamic> initialState)
      : super(initialState);
}

class MainCategoryCubit extends MainCategoryController with ReadyRemoteController {
  MainCategoryCubit(ReadyListState<MainCategoryModel, dynamic> initialState)
      : super(initialState);

  @override
  Future<RemoteResult<MainCategoryModel>> loadData(int skip, int? pageSize,
      [ICancelToken? cancelToken]) async {

    var list = await asyncList(0, const Duration(seconds: 3));

    return RemoteResult.success(list, 100);
  }

  static Future<List<MainCategoryModel>> asyncList(
      [int skip = 0, Duration duration = const Duration(seconds: 1)]) async {
    await Future.delayed(duration);
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection("category").get();
    List<MainCategoryModel> categoryList = [];
    for (int i = 0; i < querySnapshot.docs.length; i++) {
      categoryList.add(MainCategoryModel.fromSnapshot(querySnapshot.docs[i]));
    }
    return categoryList;
  }

  @override
  void onChange(Change<ReadyListState<MainCategoryModel, dynamic>> change) {
    super.onChange(change);
  }
}