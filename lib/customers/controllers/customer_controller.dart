import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ready/ready.dart';

import '../models/customer_model.dart';

abstract class CustomerController extends Cubit<ReadyListState<CustomerModel, dynamic>>
    implements ReadyListController<CustomerModel> {
  CustomerController(ReadyListState<CustomerModel, dynamic> initialState)
      : super(initialState);
}

class CustomerListCubit extends CustomerController with ReadyRemoteController {
  CustomerListCubit(ReadyListState<CustomerModel, dynamic> initialState)
      : super(initialState);

  @override
  Future<RemoteResult<CustomerModel>> loadData(int skip, int? pageSize,
      [ICancelToken? cancelToken]) async {

    var list = await asyncList(0, const Duration(seconds: 3));

    return RemoteResult.success(list, 100);
  }

  static Future<List<CustomerModel>> asyncList(
      [int skip = 0, Duration duration = const Duration(seconds: 1)]) async {
    await Future.delayed(duration);
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection("customer").get();
    List<CustomerModel> customerList = [];
    for (int i = 0; i < querySnapshot.docs.length; i++) {
      // customerList.add(querySnapshot.docs[i]["name"]);
      customerList.add(CustomerModel.fromSnapshot(querySnapshot.docs[i]));
    }
    return customerList;
  }

  @override
  void onChange(Change<ReadyListState<CustomerModel, dynamic>> change) {
    // print(change.currentState);
    // print(change.nextState);
    super.onChange(change);
  }
}