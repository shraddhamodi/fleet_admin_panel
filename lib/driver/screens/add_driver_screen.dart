import 'package:flutter/material.dart';
import 'package:ready/ready.dart';

import '../controllers/driver_controller.dart';
import 'driver_list_screen.dart';

class AddDriverScreen extends StatelessWidget {
  AddDriverScreen({super.key});
  final controller =
      DriverListCubit(const ReadyListState.initializing(args: null));

  @override
  Widget build(BuildContext context) {
    return AnimatedItemsScope(
      delay: const Duration(seconds: 1),
      child: CustomScrollView(
        slivers: [
          SliverOverlapInjector(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context)),
          SliverPadding(
            padding: const EdgeInsets.all(20),
            sliver: SliverList.list(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Driver Name"),
                    const SizedBox(
                      height: 8,
                    ),
                    TextField(
                      controller: controller.nameController,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Text("Email Name"),
                    const SizedBox(
                      height: 8,
                    ),
                    TextField(
                      controller: controller.emailController,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Text("Phone Number"),
                    const SizedBox(
                      height: 8,
                    ),
                    TextField(
                      controller: controller.phoneController,
                      keyboardType: TextInputType.phone,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Align(
                        alignment: Alignment.center,
                        child: TextButton(
                            onPressed: () {
                              controller.addData();
                              PageInfo.of(context).pushNewPage(
                                  builder: (context) => DriverListScreen(),
                                  titleSpans: [const TextSpan(text: 'sub')]);
                            },
                            child: const Text("Submit")))
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
