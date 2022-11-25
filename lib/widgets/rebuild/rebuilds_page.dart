import 'package:flutter/material.dart';
import 'package:animator/animator.dart';

class RebuildAnimations extends StatelessWidget {
  const RebuildAnimations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic Animation 0'),
      ),
      body: const Body(),
    );
  }
}

class Body extends StatefulWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool toggleCurve = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Text('Widget is animated on rebuild'),
        Animator<double>(
          resetAnimationOnRebuild: true,
          duration: const Duration(seconds: 2),
          cycles: 2,
          builder: (_, anim, __) => Center(
            child: Transform.scale(
              scale: anim.value,
              child: const FlutterLogo(size: 50),
            ),
          ),
        ),
        const Divider(),
        const Text('Widget is not animated on rebuild'),
        Animator<double>(
          duration: const Duration(seconds: 2),
          builder: (_, anim, __) => Center(
            child: Transform.scale(
              scale: anim.value,
              child: const FlutterLogo(
                size: 50,
                textColor: Colors.red,
              ),
            ),
          ),
        ),
        const Divider(),
        const Text('Animation is reset on rebuild. Curve changes on rebuild'),
        Animator<double>(
          duration: const Duration(seconds: 2),
          repeats: 1,
          resetAnimationOnRebuild: true,
          curve: toggleCurve ? Curves.linear : Curves.bounceIn,
          builder: (_, anim, __) => Center(
            child: Transform.scale(
              scale: anim.value,
              child: const FlutterLogo(size: 50),
            ),
          ),
        ),
        ElevatedButton(
          child: const Text('Rebuild '),
          onPressed: () {
            setState(() {
              toggleCurve = !toggleCurve;
            });
          },
        )
      ],
    );
  }
}
