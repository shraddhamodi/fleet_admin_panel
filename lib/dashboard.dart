import 'package:fleet_admin_panel/widgets/ready_grid.dart';
import 'package:fleet_admin_panel/widgets/ready_list.dart';
import 'package:fleet_admin_panel/users/screens/users_list_screens.dart';
import 'package:flutter/material.dart';
import 'package:ready/ready.dart';

import 'widgets/animated_items.dart';

class DashBoardExample extends StatelessWidget {
  final ValueChanged<ThemeMode> onModeChanged;
  const DashBoardExample({Key? key, required this.onModeChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ReadyDashboard(
      currentUser: const CurrentUser.admin(),
      drawerOptions: (phone) => DrawerOptions(
        headers: (ctrl) => [
          const DrawerHeader(child: CircleAvatar()),
          Builder(builder: (context) {
            var isDark = Theme.of(context).brightness == Brightness.dark;
            return CheckboxListTile(
              title: const Text("Fleet"),
              onChanged: (bool? value) {
                onModeChanged(isDark ? ThemeMode.light : ThemeMode.dark);
              },
              value: isDark,
            );
          }),
          const Divider()
        ],
        footer: (ctrl) => [
          const Align(
            alignment: AlignmentDirectional.bottomStart,
            child: ListTile(
              title: Text(''),
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.notification_add),
        ),
      ],
      items: [
        DashboardItem(
          builder: (Map<String, dynamic> parameters) {
            return const AnimatedItemsExample();
          },
          authorization: Authorization(types: [
            AccessType.supervisor(const ['user'])
          ]),
          icon: const Icon(Icons.animation),
          id: 'animated',
          label: 'Animated items',
        ),
        DashboardItem(
          builder: (Map<String, dynamic> parameters) {
            return const AnimatedScopeItemsExample();
          },
          icon: const Icon(Icons.local_cafe),
          id: 'dashboard',
          label: 'Dashboard',
        ),
        DashboardItem(
          builder: (Map<String, dynamic> parameters) {
            return UserListScreen(shimmer: true);
          },
          icon: const Icon(Icons.list),
          id: 'user',
          label: 'Users',
        ),
        DashboardItem(
          builder: (Map<String, dynamic> parameters) {
            return const ReadyListExample(shimmer: true);
          },
          icon: const Icon(Icons.list),
          id: 'store',
          label: 'Stores',
        ),
        DashboardItem(
          builder: (Map<String, dynamic> parameters) {
            return const ReadyListExample(shimmer: true);
          },
          icon: const Icon(Icons.list),
          id: 'category',
          label: 'Store Categories',
        ),
        DashboardItem(
          builder: (Map<String, dynamic> parameters) {
            return ReadyGridExample(gridDelegate: Grids.extent(150));
          },
          icon: const Icon(Icons.list),
          id: 'popular_store',
          label: 'Popular Store',
        ),
        DashboardItem(
          builder: (Map<String, dynamic> parameters) {
            return const ReadyListExample(shimmer: true);
          },
          icon: const Icon(Icons.list),
          id: 'driver',
          label: 'Drivers',
        ),
      ],
    );
  }
}