import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fleet_admin_panel/widgets/fake_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ready/ready.dart';

abstract class DriverController extends Cubit<ReadyListState<FakeItem, dynamic>>
    implements ReadyListController<FakeItem> {
  DriverController(ReadyListState<FakeItem, dynamic> initialState)
      : super(initialState);
}

class DriverListCubit extends DriverController with ReadyRemoteController {
  DriverListCubit(ReadyListState<FakeItem, dynamic> initialState)
      : super(initialState);

  List<FakeItem> list = [];

  @override
  Future<RemoteResult<FakeItem>> loadData(int skip, int? pageSize,
      [ICancelToken? cancelToken]) async {
    list = await asyncList(0, const Duration(seconds: 3));

    return RemoteResult.success(list, 100);
  }

  static Future<List<FakeItem>> asyncList(
      [int skip = 0, Duration duration = const Duration(seconds: 1)]) async {
    await Future.delayed(duration);
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection("drivers").get();
    List<FakeItem> driverList = [];
    for (int i = 0; i < querySnapshot.docs.length; i++) {
      driverList.add(FakeItem("${i + 1}", querySnapshot.docs[i]["name"], 23));
    }
    return driverList;
  }

  @override
  void onChange(Change<ReadyListState<FakeItem, dynamic>> change) {
    super.onChange(change);
  }
}
