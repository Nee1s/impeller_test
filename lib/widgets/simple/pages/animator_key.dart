import 'dart:math';
import 'package:flutter/material.dart';

import 'package:animator/animator.dart';

class AnimationWithAnimatorKey extends StatelessWidget {
  const AnimationWithAnimatorKey({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Animation"),
      ),
      body: const Padding(
        padding: EdgeInsets.all(20),
        child: MyAnimation(),
      ),
    );
  }
}

class MyAnimation extends StatelessWidget {
  const MyAnimation({
    Key? key,
  }) : super(key: key);

  static const _flutterLog100 = FlutterLogo(size: 150, style: FlutterLogoStyle.horizontal);

  @override
  Widget build(BuildContext context) {
    final animatorKey = AnimatorKey<double>();

    return Center(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Start Animation and you can not restart it until it ends'),
            ElevatedButton(
              child: const Text("Animate"),
              onPressed: () => animatorKey.triggerAnimation(),
            ),
            const SizedBox(height: 5),
            const Text('Start Animation and restart it if it is running'),
            ElevatedButton(
              child: const Text("restart animation"),
              onPressed: () => animatorKey.triggerAnimation(restart: true),
            ),
            const SizedBox(height: 5),
            const Text('Change animation setting and restart it'),
            const Text('Curve is changed from linear to bounceIn'),
            ElevatedButton(
              child: const Text("reset and restart animation using AnimatorKey"),
              onPressed: () => animatorKey
                ..resetAnimation(
                  curve: Curves.bounceIn,
                )
                ..triggerAnimation(restart: true),
            ),
            Animator<double>(
              tweenMap: {
                "opacityAnim": Tween<double>(begin: 0.5, end: 1),
                "rotationAnim": Tween<double>(begin: 0, end: 2 * pi),
                "translateAnim": Tween<Offset>(begin: Offset.zero, end: const Offset(1, 0)),
              },
              cycles: 3,
              duration: const Duration(seconds: 2),
              endAnimationListener: (anim) => print("animation finished"),
              animatorKey: animatorKey,
              builder: (context, anim, child) => FadeTransition(
                opacity: anim.getAnimation("opacityAnim"),
                child: FractionalTranslation(
                  translation: anim.getValue("translateAnim"),
                  child: _flutterLog100,
                ),
              ),
            ),
            AnimatorRebuilder(
              observe: () => animatorKey,
              builder: (context, anim, child) {
                return Container(
                  child: FractionalTranslation(
                    translation: anim.getValue("translateAnim"),
                    child: Transform.rotate(
                      angle: anim.getValue("rotationAnim"),
                      child: _flutterLog100,
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
