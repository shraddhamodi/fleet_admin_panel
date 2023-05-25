import 'package:fleet_admin_panel/driver/controllers/driver_controller.dart';
import 'package:flutter/material.dart';
import 'package:ready/ready.dart';

import '../../widgets/fake_data.dart';
import 'add_driver_screen.dart';

class DriverListScreen extends StatelessWidget {
  final controller =
  DriverListCubit(const ReadyListState.initializing(args: null));
  DriverListScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveDataTable(
      controller: controller,
      dataTable: DataTableOptions(
        buildItem: (int index, FakeItem item) {
          return [
            Text(item.id),
            for (var i = 0; i < 1; i++) Text(item.name),
          ];
        },
        headers: ['#', ...List.generate(1, (index) => 'Name'), "Rate"]
            .toDataColumns(),
      ),
      list: ListOptions(
        title: (int index, FakeItem item) => Text(item.name),
      ),
      actions: [
          IconButton(
              onPressed: () {

                PageInfo.of(context).pushNewPage(builder: (context) => AddDriverScreen(), titleSpans: [const TextSpan(text: "Add Driver")]);
                // PageInfo.of(context).pushNewPage(
                //     builder: (context) => DriverListScreen(),
                //     titleSpans: [const TextSpan(text: 'sub')]);
              },
              icon: const Icon(Icons.add)),
      ],
      filters: [
            (_) => SearchFilter(
          onChange: (String? value) {
            controller.emit(const ReadyListState.requestFirstLoading(
                pageSize: 20, args: null));
          },
        ), // ),
      ],
      selectionButton: (type, selected) {
        return IconButton(
          onPressed: () {},
          icon: const Icon(Icons.delete),
        );
      },
      rowActions: [
        IconAction.view(
          action:
              (BuildContext context, DriverListCubit controller, FakeItem item) {
            return showDialog(
              context: context,
              builder: (_) {
                return AlertDialog(
                  title: Text(item.id),
                  content: ListTile(
                    title: Text(item.name),
                    trailing: Text(item.rate.toString()),
                  ),
                );
              },
            );
          },
        ),
        IconAction.delete(action: (BuildContext context,
            DriverListCubit controller, FakeItem item) async {
          await Future.delayed(const Duration(seconds: 1));
          controller.remove(item);
        }),
      ],
    );
  }
}
