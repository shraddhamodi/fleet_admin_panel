import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ready/ready.dart';

import 'fake_data.dart';

class ResponsiveList extends StatelessWidget {
  final controller =
  ReadyListCubit(const ReadyListState.initializing(args: null));
  final bool sub;
  ResponsiveList({
    Key? key,
    this.sub = false,
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
            Text(item.rate.toString()),
          ];
        },
        headers: ['#', ...List.generate(1, (index) => 'Name'), "Rate"]
            .toDataColumns(),
      ),
      list: ListOptions(
        title: (int index, FakeItem item) => Text(item.name),
      ),
      actions: [
        if (!sub)
          IconButton(
              onPressed: () {
                PageInfo.of(context).pushNewPage(
                    builder: (context) => ResponsiveList(sub: true),
                    titleSpans: [const TextSpan(text: 'sub')]);
              },
              icon: const Icon(Icons.add)),
      ],
      filters: [
            (_) => SearchFilter(
          onChange: (String? value) {
            controller.emit(const ReadyListState.requestFirstLoading(
                pageSize: 20, args: null));
          },
        ),
        if (!sub) ...[
              (_) => SingleOptionFilter(
            display: 'Single option',
            value: controller.value,
            items: List.generate(
                10,
                    (index) => OptionFilterItem(
                    display: 'option $index', value: index)),
            onChange: (value) {
              controller.value = value;
              controller.requestFirstLoading();
            },
          ),
              (_) => MultiOptionFilter(
            display: 'Multiple options',
            value: const {1, 8},
            items: List.generate(
                10,
                    (index) => OptionFilterItem(
                    display: 'option $index', value: index)),
            onChange: (value) {},
          ),
          // (_) => DateFilter(
          //       value: DateTime.now(),
          //       onChange: (DateTime? value) {},
          //     ),
              (_) => ToggleFilter(
            onChange: (bool? value) {},
          ),
        ], // ),
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
              (BuildContext context, ReadyListCubit controller, FakeItem item) {
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
            ReadyListCubit controller, FakeItem item) async {
          await Future.delayed(const Duration(seconds: 1));
          controller.remove(item);
        }),
      ],
    );
  }
}

abstract class BaseController extends Cubit<ReadyListState<FakeItem, dynamic>>
    implements ReadyListController<FakeItem> {
  BaseController(ReadyListState<FakeItem, dynamic> initialState)
      : super(initialState);
}

class ReadyListCubit extends BaseController with ReadyRemoteController {
  ReadyListCubit(ReadyListState<FakeItem, dynamic> initialState)
      : super(initialState);
  int value = 1;
  @override
  Future<RemoteResult<FakeItem>> loadData(int skip, int? pageSize,
      [ICancelToken? cancelToken]) async {
    var list = await FakeRepo.asyncList(pageSize ?? 20, skip);
    return RemoteResult.success(list, 100);
  }
}