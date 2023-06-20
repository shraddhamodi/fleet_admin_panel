import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fleet_admin_panel/driver/models/driver_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ready/ready.dart';

abstract class DriverController extends Cubit<ReadyListState<DriverModel, dynamic>>
    implements ReadyListController<DriverModel> {
  DriverController(ReadyListState<DriverModel, dynamic> initialState)
      : super(initialState);
}

class DriverListCubit extends DriverController with ReadyRemoteController {
  DriverListCubit(ReadyListState<DriverModel, dynamic> initialState)
      : super(initialState);

  List<DriverModel> list = [];

  @override
  Future<RemoteResult<DriverModel>> loadData(int skip, int? pageSize,
      [ICancelToken? cancelToken]) async {
    list = await asyncList(0, const Duration(seconds: 3));

    return RemoteResult.success(list, 100);
  }

  static Future<List<DriverModel>> asyncList(
      [int skip = 0, Duration duration = const Duration(seconds: 1)]) async {
    await Future.delayed(duration);
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection("drivers").get();
    List<DriverModel> driverList = [];
    for (int i = 0; i < querySnapshot.docs.length; i++) {
      driverList.add(DriverModel.fromSnapshot(i+1,querySnapshot.docs[i]));
    }
    return driverList;
  }

  deleteDriver(DriverModel item){

    remove(item);
  }

  @override
  void onChange(Change<ReadyListState<DriverModel, dynamic>> change) {
    super.onChange(change);
  }
}
