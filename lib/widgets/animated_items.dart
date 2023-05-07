import 'package:flutter/material.dart';
import 'package:ready/ready.dart';

class AnimatedScopeItemsExample extends StatelessWidget {
  const AnimatedScopeItemsExample({Key? key}) : super(key: key);

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
            sliver: SliverGrid.count(
              crossAxisCount: 5,
              children: [
                /// this will be run at first
                Animated(
                    transforms: const [ScaleAnimation.y()],
                    child: const Card()),

                /// then this will be run
                Animated(
                    transforms: const [ScaleAnimation.x()],
                    child: const Card()),

                /// then this
                Animated(
                    transforms: const [ScaleAnimation.z()],
                    child: const Card()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AnimatedItemsExample extends StatelessWidget {
  const AnimatedItemsExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.all(20),
      crossAxisCount: 5,
      children: [
        for (var type in FlipType.values)
          Animated(
            transforms: [FlipAnimation(type)],
            duration: const Duration(seconds: 5),
            child: const Card(),
          ),
        Animated(
          transforms: const [ScaleAnimation.scale()],
          duration: const Duration(seconds: 5),
          child: const Card(),
        ),
        Animated(
          transforms: const [ScaleAnimation.y()],
          duration: const Duration(seconds: 5),
          child: const Card(),
        ),
        Animated(
          transforms: const [ScaleAnimation.x()],
          duration: const Duration(seconds: 5),
          child: const Card(),
        ),
        Animated(
          transforms: const [ScaleAnimation.z()],
          duration: const Duration(seconds: 5),
          child: const Card(),
        ),
        Animated(
          transforms: const [TranslateAnimation.y(300)],
          duration: const Duration(seconds: 5),
          child: const Card(),
        ),
        Animated(
          transforms: const [TranslateAnimation.x(300)],
          duration: const Duration(seconds: 5),
          child: const Card(),
        ),
        Animated(
          transforms: const [TranslateAnimation.z(300)],
          duration: const Duration(seconds: 5),
          child: const Card(),
        ),
        Animated(
          fade: const FadeAnimation(),
          duration: const Duration(seconds: 5),
          child: const Card(),
        ),
      ],
    );
  }
}