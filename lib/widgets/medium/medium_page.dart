import 'package:flutter/material.dart';

import 'animated_positioned.dart';
import 'staggered_animation_implicit.dart';
import 'animated_size.dart';
import 'animated_container.dart';
import 'animated_padding.dart';
import 'staggered_animation.dart';

class MediumAnimations extends StatelessWidget {
  const MediumAnimations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animator demo"),
      ),
      body: const NewHomePage(),
    );
  }
}

class NewHomePage extends StatelessWidget {
  const NewHomePage({Key? key}) : super(key: key);

  void goto(Widget page, BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => page,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          ElevatedButton(
            child: const Text("Animated Container"),
            onPressed: () => goto(const MyAnimatedContainer(), context),
          ),
          ElevatedButton(
            child: const Text("Animated Padding"),
            onPressed: () => goto(const MyAnimatedPadding(), context),
          ),
          ElevatedButton(
            child: const Text("Animated Positioned"),
            onPressed: () => goto(const MyAnimatedPositioned(), context),
          ),
          ElevatedButton(
            child: const Text("Staggered Animation"),
            onPressed: () => goto(const MyStaggeredWidget(), context),
          ),
          ElevatedButton(
            child: const Text("Implicit Staggered Animation"),
            onPressed: () => goto(const MyImplicitStaggeredWidget(), context),
          ),
          ElevatedButton(
            child: const Text("Opacity Animation"),
            onPressed: () => goto(const ImplicitAnimatedSize(), context),
          ),
        ],
      ),
    );
  }
}
