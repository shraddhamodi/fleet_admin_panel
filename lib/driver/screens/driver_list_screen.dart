import 'package:fleet_admin_panel/driver/controllers/driver_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ready/ready.dart';
import '../models/driver_model.dart';
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
        buildItem: (int index, DriverModel driver) {
          return [
            Text(driver.index.toString()),
            for (var i = 0; i < 1; i++) Text(driver.name.toString().capitalize!),
          ];
        },
        headers: ['#', ...List.generate(1, (index) => 'Name')]
            .toDataColumns(),
      ),
      list: ListOptions(
        title: (int index, DriverModel item) => Text(item.name.toString()),
      ),
      actions: [
          IconButton(
              onPressed: () {

                PageInfo.of(context).pushNewPage(builder: (context) => const AddDriverScreen(driver: null,), titleSpans: [const TextSpan(text: "Add Driver")]);
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
        IconAction.edit(
            color: (t){return Colors.green;},
            action: (BuildContext context,
            DriverListCubit controller, DriverModel driver) async {

              PageInfo.of(context).pushNewPage(builder: (context) => AddDriverScreen(driver: driver,), titleSpans: [const TextSpan(text: "Edit Driver")]);

            }),
        IconAction.view(
          action:
              (BuildContext context, DriverListCubit controller, DriverModel driver) {
            return showDialog(
              context: context,
              builder: (_) {
                return AlertDialog(
                  title: Text(driver.driverId.toString()),
                  content: ListTile(
                    title: Text(driver.name.toString().capitalize!),
                    trailing: Text(driver.email.toString()),
                  ),
                );
              },
            );
          },
        ),
        IconAction.delete(action: (BuildContext context,
            DriverListCubit controller, DriverModel item) async {
          await Future.delayed(const Duration(seconds: 1));
          // controller.remove(item);
          controller.deleteDriver(item);
        }),
      ],
    );
  }
}
