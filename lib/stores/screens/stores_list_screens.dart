import 'package:fleet_admin_panel/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:ready/ready.dart';

import '../controllers/store_controller.dart';
import '../models/store_model.dart';

class StoreListScreen extends StatelessWidget {
  final bool shimmer;
  const StoreListScreen({
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
      buildItem: (StoreModel? item, int index) {
        return _buildItem(item, index);
      },
      controller: StoreCubit(const ReadyListState.initializing(args: null)),
    );
  }

  Widget _buildItem(StoreModel? item, int index) {
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
                  title: Text(item?.storeName ?? '...'),
                  subtitle: Text('${item?.storeOwnerName}'),
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
