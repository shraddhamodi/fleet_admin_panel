import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ready/ready.dart';

import '../models/store_model.dart';

abstract class StoreController extends Cubit<ReadyListState<StoreModel, dynamic>>
    implements ReadyListController<StoreModel> {
  StoreController(ReadyListState<StoreModel, dynamic> initialState)
      : super(initialState);
}

class StoreCubit extends StoreController with ReadyRemoteController {
  StoreCubit(ReadyListState<StoreModel, dynamic> initialState)
      : super(initialState);

  @override
  Future<RemoteResult<StoreModel>> loadData(int skip, int? pageSize,
      [ICancelToken? cancelToken]) async {

    var list = await asyncList(0, const Duration(seconds: 3));

    return RemoteResult.success(list, 100);
  }

  static Future<List<StoreModel>> asyncList(
      [int skip = 0, Duration duration = const Duration(seconds: 1)]) async {
    await Future.delayed(duration);
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection("stores").get();
    List<StoreModel> storeList = [];
    for (int i = 0; i < querySnapshot.docs.length; i++) {
      storeList.add(StoreModel.fromSnapshot(querySnapshot.docs[i]));
    }
    return storeList;
  }

  @override
  void onChange(Change<ReadyListState<StoreModel, dynamic>> change) {
    super.onChange(change);
  }
}