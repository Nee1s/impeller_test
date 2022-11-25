import 'package:flutter/material.dart';
import 'package:animator/animator.dart';

class ScaleAnimation extends StatelessWidget {
  const ScaleAnimation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[
            Text('Tween<double>'),
            Text('Scale & SizeTransition & Skew'),
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
            "1- Scale from center. dur:2s , cycles = 0",
            style: _titleStyle,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  const Text(
                    "SizedBox",
                    style: _style,
                  ),
                  Animator<double>(
                    duration: const Duration(seconds: 2),
                    cycles: 0,
                    builder: (_, animationState, __) => SizedBox(
                      width: 50 * animationState.value,
                      height: 50 * animationState.value,
                      child: const FlutterLogo(
                        size: 50,
                      ),
                    ),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  const Text(
                    "Transform.scale",
                    style: _style,
                  ),
                  Animator<double>(
                    duration: const Duration(seconds: 2),
                    cycles: 0,
                    builder: (_, animationState, __) => Transform.scale(
                      scale: animationState.value,
                      child: const FlutterLogo(
                        size: 50,
                      ),
                    ),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  const Text(
                    "diagonal3Values",
                    style: _style,
                  ),
                  Animator<double>(
                    tween: Tween<double>(begin: 0, end: 1),
                    duration: const Duration(seconds: 2),
                    cycles: 0,
                    builder: (_, animationState, __) => Transform(
                      transform: Matrix4.diagonal3Values(animationState.value, animationState.value, 1),
                      alignment: Alignment.center,
                      child: const FlutterLogo(
                        size: 50,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  const Text(
                    "ScaleTransition",
                    style: _style,
                  ),
                  Animator<double>(
                    duration: const Duration(seconds: 2),
                    cycles: 0,
                    builder: (_, animationState, __) => ScaleTransition(
                      scale: animationState.animation,
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
            "2- Transform.scale widget : Changing the origin. dur:2s , cycles=0",
            style: _titleStyle,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  const Text(
                    "center",
                    style: _style,
                  ),
                  Animator<double>(
                    tween: Tween<double>(begin: 0, end: 1),
                    duration: const Duration(seconds: 2),
                    cycles: 0,
                    builder: (_, animationState, __) => Transform.scale(
                      scale: animationState.value,
                      child: const FlutterLogo(
                        size: 50,
                      ),
                    ),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  const Text(
                    "topLeft",
                    style: _style,
                  ),
                  Animator<double>(
                    tween: Tween<double>(begin: 0, end: 1),
                    duration: const Duration(seconds: 2),
                    cycles: 0,
                    builder: (_, animationState, __) => Transform.scale(
                      scale: animationState.value,
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
                  const Text(
                    "bottomRight",
                    style: _style,
                  ),
                  Animator<double>(
                    duration: const Duration(seconds: 2),
                    cycles: 0,
                    builder: (_, animationState, __) => Transform.scale(
                      scale: animationState.value,
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
                  const Text(
                    "Offset(10, -10)",
                    style: _style,
                  ),
                  Animator<double>(
                    tween: Tween<double>(begin: 0, end: 1),
                    duration: const Duration(seconds: 2),
                    cycles: 0,
                    builder: (_, animationState, __) => Transform.scale(
                      scale: animationState.value,
                      origin: const Offset(10, -10),
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
            "3- Transform.scale : Changing Curves. dur:500ms , cycles = 0",
            style: _titleStyle,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  const Text(
                    "elasticOut",
                    style: _style,
                  ),
                  Animator<double>(
                    tween: Tween<double>(begin: 0.8, end: 1.4),
                    curve: Curves.elasticOut,
                    cycles: 0,
                    builder: (_, animationState, __) => Transform.scale(
                        scale: animationState.value,
                        child: const Icon(
                          Icons.favorite,
                          color: Colors.red,
                          size: 50,
                        )),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  const Text(
                    "elasticIn",
                    style: _style,
                  ),
                  Animator<double>(
                    tween: Tween<double>(begin: 0.8, end: 1.4),
                    curve: Curves.elasticIn,
                    cycles: 0,
                    builder: (_, animationState, __) => Transform.scale(
                        scale: animationState.value,
                        child: const Icon(
                          Icons.favorite,
                          color: Colors.red,
                          size: 50,
                        )),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  const Text(
                    "elasticInOut",
                    style: _style,
                  ),
                  Animator<double>(
                    tween: Tween<double>(begin: 0.8, end: 1.4),
                    curve: Curves.elasticInOut,
                    cycles: 0,
                    builder: (_, animationState, __) => Transform.scale(
                        scale: animationState.value,
                        child: const Icon(
                          Icons.favorite,
                          color: Colors.red,
                          size: 50,
                        )),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  const Text(
                    "fastOutSlowIn",
                    style: _style,
                  ),
                  Animator<double>(
                    tween: Tween<double>(begin: 0.8, end: 1.4),
                    curve: Curves.fastOutSlowIn,
                    cycles: 0,
                    builder: (_, animationState, __) => Transform.scale(
                        scale: animationState.value,
                        child: const Icon(
                          Icons.favorite,
                          color: Colors.red,
                          size: 50,
                        )),
                  )
                ],
              ),
            ],
          ),
          const Divider(),
          const Text(
            "4- SizeTransition widget. dur:2s , cycles=0",
            style: _titleStyle,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  const Text("Axis.vertical", style: _style),
                  Animator<double>(
                    duration: const Duration(seconds: 2),
                    cycles: 0,
                    builder: (_, animationState, __) => SizeTransition(
                        sizeFactor: animationState.animation,
                        child: const FlutterLogo(
                          size: 50,
                        )),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  const Text(
                    "Axis.horizontal",
                    style: _style,
                  ),
                  Animator<double>(
                    duration: const Duration(seconds: 2),
                    cycles: 0,
                    builder: (_, animationState, __) => SizeTransition(
                        sizeFactor: animationState.animation,
                        axis: Axis.horizontal,
                        child: const FlutterLogo(
                          size: 50,
                        )),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  const Text(
                    "axisAlig. : -1",
                    style: _style,
                  ),
                  Animator<double>(
                    duration: const Duration(seconds: 2),
                    cycles: 0,
                    builder: (_, animationState, __) => SizeTransition(
                        sizeFactor: animationState.animation,
                        axis: Axis.horizontal,
                        axisAlignment: -1,
                        child: const FlutterLogo(
                          size: 50,
                        )),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  const Text(
                    "axisAlig. : 1",
                    style: _style,
                  ),
                  Animator<double>(
                    tween: Tween<double>(begin: 0, end: 1),
                    duration: const Duration(seconds: 2),
                    cycles: 0,
                    builder: (_, animationState, __) => SizeTransition(
                        sizeFactor: animationState.animation,
                        axis: Axis.horizontal,
                        axisAlignment: 1,
                        child: const FlutterLogo(
                          size: 50,
                        )),
                  )
                ],
              ),
            ],
          ),
          const Divider(),
          const Text(
            "5- Transform widget. Matrix4.skew . dur:2s , cycles=0",
            style: _titleStyle,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  const Text("skewX", style: _style),
                  Animator<double>(
                    tween: Tween<double>(begin: -0.5, end: 0.5),
                    duration: const Duration(seconds: 2),
                    cycles: 0,
                    builder: (_, animationState, __) => Transform(
                      transform: Matrix4.skewX(animationState.value),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue),
                        ),
                        child: const FlutterLogo(
                          size: 50,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  const Text(
                    "skewY",
                    style: _style,
                  ),
                  Animator<double>(
                    tween: Tween<double>(begin: -0.5, end: 0.5),
                    duration: const Duration(seconds: 2),
                    cycles: 0,
                    builder: (_, animationState, __) => Transform(
                      transform: Matrix4.skewY(animationState.value),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue),
                        ),
                        child: const FlutterLogo(
                          size: 50,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  const Text(
                    "skew",
                    style: _style,
                  ),
                  Animator<double>(
                    tween: Tween<double>(begin: -0.5, end: 0.5),
                    duration: const Duration(seconds: 2),
                    cycles: 0,
                    builder: (_, animationState, __) => Transform(
                      transform: Matrix4.skew(animationState.value, animationState.value),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue),
                        ),
                        child: const FlutterLogo(
                          size: 50,
                        ),
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
