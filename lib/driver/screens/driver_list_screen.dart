import 'package:flutter/material.dart';
import 'package:ready/ready.dart';

import '../../widgets/fake_data.dart';
import '../controllers/driver_controller.dart';

class DriverListScreen extends StatelessWidget {
  final bool shimmer;
  const DriverListScreen({
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
      buildItem: (FakeItem? item, int index) {
        return _buildItem(item, index);
      },
      controller: DriverListCubit(const ReadyListState.initializing(args: null)),
    );
  }

  Widget _buildItem(FakeItem? item, int index) {
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
                  title: Text(item?.name ?? '...'),
                  trailing: Text('${item?.rate}'),
                  leading: CircleAvatar(child: Text(item?.id ?? '#')),
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
