import 'dart:math';
import 'package:flutter/material.dart';
import 'package:animator/animator.dart';

class RotationAnimation extends StatelessWidget {
  const RotationAnimation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[
            Text('Tween<double>'),
            Text('Rotation Animation'),
          ],
        ),
      ),
      body: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  static const _style = TextStyle(fontSize: 12, fontWeight: FontWeight.bold);
  static const _titleStyle = TextStyle(fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          const Text(
            "1- Rotation around the center. dur:2s , repeats = 0",
            style: _titleStyle,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  const Text("Transform.rotate", style: _style),
                  Animator<double>(
                    tween: Tween<double>(begin: 0, end: 2 * pi),
                    duration: const Duration(seconds: 2),
                    repeats: 0,
                    builder: (_, animationState, __) => Transform.rotate(
                      angle: animationState.value,
                      child: const FlutterLogo(
                        size: 50,
                      ),
                    ),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  const Text(" Matrix4.rotationZ", style: _style),
                  Animator<double>(
                    tween: Tween<double>(begin: 0, end: 2 * pi),
                    duration: const Duration(seconds: 2),
                    repeats: 0,
                    builder: (_, animationState, __) => Transform(
                      transform: Matrix4.rotationZ(animationState.value),
                      alignment: Alignment.center,
                      child: const FlutterLogo(
                        size: 50,
                      ),
                    ),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  const Text("RotationTransition", style: _style),
                  Animator<double>(
                    tween: Tween<double>(begin: 0, end: 1),
                    duration: const Duration(seconds: 2),
                    repeats: 0,
                    builder: (_, animationState, __) => RotationTransition(
                      turns: animationState.animation,
                      child: const FlutterLogo(
                        size: 50,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
          const Divider(),
          const Text(
            "2- Transform widget. Rotation around X,Y or Z axis. dur:2s , repeats = 0; origin : center",
            style: _titleStyle,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  const Text(" Matrix4.rotationX", style: _style),
                  Animator<double>(
                    tween: Tween<double>(begin: 0, end: 2 * pi),
                    duration: const Duration(seconds: 2),
                    repeats: 0,
                    builder: (_, animationState, __) => Transform(
                      transform: Matrix4.rotationX(animationState.value),
                      alignment: Alignment.center,
                      child: const FlutterLogo(
                        size: 50,
                      ),
                    ),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  const Text(" Matrix4.rotationY", style: _style),
                  Animator<double>(
                    tween: Tween<double>(begin: 0, end: 2 * pi),
                    duration: const Duration(seconds: 2),
                    repeats: 0,
                    builder: (_, animationState, __) => Transform(
                      transform: Matrix4.rotationY(animationState.value),
                      alignment: Alignment.center,
                      child: const FlutterLogo(
                        size: 50,
                      ),
                    ),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  const Text(" Matrix4.rotationZ", style: _style),
                  Animator<double>(
                    tween: Tween<double>(begin: 0, end: 2 * pi),
                    duration: const Duration(seconds: 2),
                    repeats: 0,
                    builder: (_, animationState, __) => Transform(
                      transform: Matrix4.rotationZ(animationState.value),
                      alignment: Alignment.center,
                      child: const FlutterLogo(
                        size: 50,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
          const Divider(),
          const Text(
            "3- Transform.rotate widget. Changing the origin. dur:2s , repeats = 0;",
            style: _titleStyle,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  const Text(" origin : topLeft", style: _style),
                  Animator<double>(
                    tween: Tween<double>(begin: 0, end: 2 * pi),
                    duration: const Duration(seconds: 2),
                    repeats: 0,
                    builder: (_, animationState, __) => Transform.rotate(
                      angle: animationState.value,
                      alignment: Alignment.topLeft,
                      child: const FlutterLogo(
                        size: 50,
                      ),
                    ),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  const Text(" origin : bottomRight", style: _style),
                  Animator<double>(
                    tween: Tween<double>(begin: 0, end: 2 * pi),
                    duration: const Duration(seconds: 2),
                    repeats: 0,
                    builder: (_, animationState, __) => Transform.rotate(
                      angle: animationState.value,
                      alignment: Alignment.bottomRight,
                      child: const FlutterLogo(
                        size: 50,
                      ),
                    ),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  const Text(" Offset(-10, 10)", style: _style),
                  Animator<double>(
                    tween: Tween<double>(begin: 0, end: 2 * pi),
                    duration: const Duration(seconds: 2),
                    repeats: 0,
                    builder: (_, animationState, __) => Transform(
                      transform: Matrix4.rotationZ(animationState.value),
                      alignment: Alignment.center,
                      origin: const Offset(-10, 10),
                      child: const FlutterLogo(
                        size: 50,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
          const Divider(),
          const Text(
            "4- Transform.rotate widget. Changing Curves: dur:2s, cycles=0",
            style: _titleStyle,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  const Text("elasticOut", style: _style),
                  Animator<double>(
                    tween: Tween<double>(begin: 0, end: 2 * pi),
                    duration: const Duration(seconds: 2),
                    curve: Curves.elasticOut,
                    cycles: 0,
                    builder: (_, animationState, __) => Transform.rotate(
                      angle: animationState.value,
                      child: const FlutterLogo(
                        size: 50,
                      ),
                    ),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  const Text("elasticIn", style: _style),
                  Animator<double>(
                    tween: Tween<double>(begin: 0, end: 2 * pi),
                    duration: const Duration(seconds: 2),
                    curve: Curves.elasticIn,
                    cycles: 0,
                    builder: (_, animationState, __) => Transform.rotate(
                      angle: animationState.value,
                      child: const FlutterLogo(
                        size: 50,
                      ),
                    ),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  const Text("elasticInOut", style: _style),
                  Animator<double>(
                    tween: Tween<double>(begin: 0, end: 2 * pi),
                    duration: const Duration(seconds: 2),
                    curve: Curves.elasticInOut,
                    cycles: 0,
                    builder: (_, animationState, __) => Transform.rotate(
                      angle: animationState.value,
                      child: const FlutterLogo(
                        size: 50,
                      ),
                    ),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  const Text("bounceOut", style: _style),
                  Animator<double>(
                    tween: Tween<double>(begin: 0, end: 2 * pi),
                    duration: const Duration(seconds: 2),
                    curve: Curves.bounceOut,
                    cycles: 0,
                    builder: (_, animationState, __) => Transform.rotate(
                      angle: animationState.value,
                      child: const FlutterLogo(
                        size: 50,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
