import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ready/ready.dart';

import '../models/banner_model.dart';

abstract class BannerController extends Cubit<ReadyListState<BannerModel, dynamic>>
    implements ReadyListController<BannerModel> {
  BannerController(ReadyListState<BannerModel, dynamic> initialState)
      : super(initialState);
}

class BannerListCubit extends BannerController with ReadyRemoteController {
  BannerListCubit(ReadyListState<BannerModel, dynamic> initialState)
      : super(initialState);

  List<BannerModel> list = [];

  @override
  Future<RemoteResult<BannerModel>> loadData(int skip, int? pageSize,
      [ICancelToken? cancelToken]) async {
    list = await asyncList(0, const Duration(seconds: 3));

    return RemoteResult.success(list, 100);
  }

  static Future<List<BannerModel>> asyncList(
      [int skip = 0, Duration duration = const Duration(seconds: 1)]) async {
    await Future.delayed(duration);
    QuerySnapshot querySnapshot =
    await FirebaseFirestore.instance.collection("banners").get();
    List<BannerModel> bannerList = [];
    for (int i = 0; i < querySnapshot.docs.length; i++) {
      bannerList.add(BannerModel.fromSnapshot(querySnapshot.docs[i]));
    }
    return bannerList;
  }

  @override
  void onChange(Change<ReadyListState<BannerModel, dynamic>> change) {
    super.onChange(change);
  }
}
