import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fleet_admin_panel/widgets/fake_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ready/ready.dart';

abstract class StoreController extends Cubit<ReadyListState<FakeItem, dynamic>>
    implements ReadyListController<FakeItem> {
  StoreController(ReadyListState<FakeItem, dynamic> initialState)
      : super(initialState);
}

class StoreCubit extends StoreController with ReadyRemoteController {
  StoreCubit(ReadyListState<FakeItem, dynamic> initialState)
      : super(initialState);

  @override
  Future<RemoteResult<FakeItem>> loadData(int skip, int? pageSize,
      [ICancelToken? cancelToken]) async {

    var list = await asyncList(0, const Duration(seconds: 3));

    return RemoteResult.success(list, 100);
  }

  static Future<List<FakeItem>> asyncList(
      [int skip = 0, Duration duration = const Duration(seconds: 1)]) async {
    await Future.delayed(duration);
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection("stores").get();
    List<FakeItem> storeList = [];
    for (int i = 0; i < querySnapshot.docs.length; i++) {
      storeList.add(FakeItem("${i+1}", querySnapshot.docs[i]["store_name"], 23));
    }
    return storeList;
  }

  @override
  void onChange(Change<ReadyListState<FakeItem, dynamic>> change) {
    super.onChange(change);
  }
}