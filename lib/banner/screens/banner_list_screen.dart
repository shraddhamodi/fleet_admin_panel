import 'package:fleet_admin_panel/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:ready/ready.dart';

import '../controllers/banner_controller.dart';
import '../models/banner_model.dart';

class BannerListScreen extends StatelessWidget {
  final bool shimmer;
  const BannerListScreen({
    Key? key,
    required this.shimmer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ReadyList.list(
      key: Key(DateTime.now().toIso8601String()),
      pageSize: 40,
      padding: const EdgeInsets.all(20),
      allowFakeItems: shimmer,
      buildItem: (BannerModel? item, int index) {
        return _buildItem(item, index);
      },
      controller: BannerListCubit(const ReadyListState.initializing(args: null)),
    );
  }

  Widget _buildItem(BannerModel? item, int index) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Animated.builder(
          transforms: [
            if (item == null) ...[
              const FlipAnimation(FlipType.negativeZ),
              const FlipAnimation(FlipType.x),
            ] else ...[
              const FlipAnimation(FlipType.negativeX),
            ],
          ],
          builder: (value) {
            return Shimmer(
              enabled: item == null,
              child: Card(
                child: ListTile(
                  title: Text(item?.bannerId ?? '...'),
                  trailing: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.edit,color: AppColors.secondaryGreen,),
                      Icon(Icons.delete,color: AppColors.lightRed,),
                    ],
                  ),
                  leading: CircleAvatar(
                      child: Image.asset("assets/common/user.png")),
                ),
              ),
            );
          },
          alignment: FractionalOffset.center,
        );
      },
    );
  }
}

