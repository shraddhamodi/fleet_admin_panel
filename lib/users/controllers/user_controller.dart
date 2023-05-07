import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fleet_admin_panel/widgets/fake_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ready/ready.dart';

abstract class UsersController extends Cubit<ReadyListState<FakeItem, dynamic>>
    implements ReadyListController<FakeItem> {
  UsersController(ReadyListState<FakeItem, dynamic> initialState)
      : super(initialState);
}

class ReadyListCubit extends UsersController with ReadyRemoteController {
  ReadyListCubit(ReadyListState<FakeItem, dynamic> initialState)
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
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection("customer").get();
    List<FakeItem> customerList = [];
    for (int i = 0; i < querySnapshot.docs.length; i++) {
      // customerList.add(querySnapshot.docs[i]["name"]);
      customerList.add(FakeItem("${i+1}", querySnapshot.docs[i]["name"], 23));
    }
    return customerList;
  }

  @override
  void onChange(Change<ReadyListState<FakeItem, dynamic>> change) {
    // print(change.currentState);
    // print(change.nextState);
    super.onChange(change);
  }
}