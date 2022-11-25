import 'package:flutter/material.dart';
import 'pages/opacity.dart';
import 'pages/random_flutter_walk.dart';
import 'pages/rotation.dart';
import 'pages/scale.dart';
import 'pages/translation.dart';
import 'pages/multi_tween.dart';
import 'pages/flutter_animation.dart';
import 'pages/animator_key.dart';

class SimpleAnimations extends StatelessWidget {
  const SimpleAnimations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animator demo"),
      ),
      body: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

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
            child: const Text("Opacity Animation"),
            onPressed: () => goto(const OpacityAnimation(), context),
          ),
          ElevatedButton(
            child: const Text("Rotation Animation"),
            onPressed: () => goto(const RotationAnimation(), context),
          ),
          ElevatedButton(
            child: const Text("Scale Animation"),
            onPressed: () => goto(const ScaleAnimation(), context),
          ),
          ElevatedButton(
            child: const Text("Translation Animation"),
            onPressed: () => goto(const TranslateAnimation(), context),
          ),
          ElevatedButton(
            child: const Text("Multi Tween Animation"),
            onPressed: () => goto(const MultiTweenAnimation(), context),
          ),
          ElevatedButton(
            child: const Text("Flutter Animation"),
            onPressed: () => goto(const FlutterAnimation(), context),
          ),
          ElevatedButton(
            child: const Text("Animation with AnimatorKey"),
            onPressed: () => goto(const AnimationWithAnimatorKey(), context),
          ),
          ElevatedButton(
            child: const Text("Random Flutter walk"),
            onPressed: () => goto(const RandomFlutterWalk(), context),
          )
        ],
      ),
    );
  }
}
