import 'dart:math';
import 'package:flutter/material.dart';
import 'package:animator/animator.dart';

class TranslateAnimation extends StatelessWidget {
  const TranslateAnimation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[
            Text('Tween<Offset>'),
            Text('Translate'),
          ],
        ),
      ),
      body: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  static const _style = TextStyle(fontSize: 12, fontWeight: FontWeight.bold);
  static const _titleStyle = TextStyle(fontWeight: FontWeight.bold);

  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          const Text(
            "1- offset. dur:2s , cycles = 0",
            style: _titleStyle,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  const Text("FractionalTranslation", style: _style),
                  Animator<Offset>(
                    tween: Tween<Offset>(begin: const Offset(-1, 0), end: const Offset(1, 0)),
                    duration: const Duration(seconds: 2),
                    cycles: 0,
                    builder: (_, animatorState, __) => FractionalTranslation(
                      translation: animatorState.value,
                      child: const FlutterLogo(
                        size: 50,
                      ),
                    ),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  const Text("Transform.translate", style: _style),
                  Animator<Offset>(
                    tween: Tween<Offset>(begin: const Offset(-50, 0), end: const Offset(50, 0)),
                    duration: const Duration(seconds: 2),
                    cycles: 0,
                    builder: (_, animatorState, __) => Transform.translate(
                      offset: animatorState.value,
                      child: const FlutterLogo(
                        size: 50,
                      ),
                    ),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  const Text("SlideTransition", style: _style),
                  Animator<Offset>(
                    tween: Tween<Offset>(begin: const Offset(-1, 0), end: const Offset(1, 0)),
                    duration: const Duration(seconds: 2),
                    cycles: 0,
                    builder: (_, animatorState, __) => SlideTransition(
                      position: animatorState.animation,
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
            "2-Transform widget. Matrix4.translationValues.. dur:2s",
            style: _titleStyle,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(
                children: <Widget>[
                  const Text("cycles = 0", style: _style),
                  Animator<Offset>(
                    tween: Tween<Offset>(begin: const Offset(-50, 0), end: const Offset(50, 0)),
                    duration: const Duration(seconds: 2),
                    cycles: 0,
                    builder: (_, animatorState, __) => Transform(
                      transform: Matrix4.translationValues(animatorState.value.dx, 0, 0),
                      child: const FlutterLogo(
                        size: 50,
                      ),
                    ),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  const Text("repeats = 0.", style: _style),
                  Animator<Offset>(
                    tween: Tween<Offset>(begin: const Offset(-50, 0), end: const Offset(100, 0)),
                    duration: const Duration(seconds: 2),
                    repeats: 0,
                    builder: (_, animatorState, __) => Transform(
                      transform: Matrix4.translationValues(animatorState.value.dx, 0, 0),
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
            "3- FractionalTranslation widget. changing Offset",
            style: _titleStyle,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  const Text("(-a, 0)=>(a, 0)", style: _style),
                  Animator<Offset>(
                    tween: Tween<Offset>(begin: const Offset(-0.5, 0), end: const Offset(0.5, 0)),
                    duration: const Duration(seconds: 2),
                    cycles: 0,
                    builder: (_, animatorState, __) => FractionalTranslation(
                      translation: animatorState.value,
                      child: const FlutterLogo(
                        size: 50,
                      ),
                    ),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  const Text("(-a, a)=>(a, a)", style: _style),
                  Animator<Offset>(
                    tween: Tween<Offset>(begin: const Offset(-0.5, -0.5), end: const Offset(0.5, 0.5)),
                    duration: const Duration(seconds: 2),
                    cycles: 0,
                    builder: (_, animatorState, __) => FractionalTranslation(
                      translation: animatorState.value,
                      child: const FlutterLogo(
                        size: 50,
                      ),
                    ),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  const Text("(0, -a)=>(0, a)", style: _style),
                  Animator<Offset>(
                    tween: Tween<Offset>(begin: const Offset(0, -0.5), end: const Offset(0, 0.5)),
                    duration: const Duration(seconds: 2),
                    cycles: 0,
                    builder: (_, animatorState, __) => FractionalTranslation(
                      translation: animatorState.value,
                      child: const FlutterLogo(
                        size: 50,
                      ),
                    ),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  const Text("(a, -a)=>(-a, a)", style: _style),
                  Animator<Offset>(
                    tween: Tween<Offset>(begin: const Offset(0.5, -0.5), end: const Offset(-0.5, 0.5)),
                    duration: const Duration(seconds: 2),
                    cycles: 0,
                    builder: (_, animatorState, __) => FractionalTranslation(
                      translation: animatorState.value,
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
            "4- FractionalTranslation widget. changing Curves.",
            style: _titleStyle,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  const Text("bounceOut", style: _style),
                  Animator<Offset>(
                    tween: Tween<Offset>(begin: const Offset(-0.5, 0), end: const Offset(0.5, 0)),
                    duration: const Duration(seconds: 2),
                    curve: Curves.bounceOut,
                    repeats: 0,
                    builder: (_, animatorState, __) => FractionalTranslation(
                      translation: animatorState.value,
                      child: const FlutterLogo(
                        size: 50,
                      ),
                    ),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  const Text("bounceIn", style: _style),
                  Animator<Offset>(
                    tween: Tween<Offset>(begin: const Offset(-0.5, 0), end: const Offset(0.5, 0)),
                    duration: const Duration(seconds: 2),
                    curve: Curves.bounceIn,
                    repeats: 0,
                    builder: (_, animatorState, __) => FractionalTranslation(
                      translation: animatorState.value,
                      child: const FlutterLogo(
                        size: 50,
                      ),
                    ),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  const Text("bounceInOut", style: _style),
                  Animator<Offset>(
                    tween: Tween<Offset>(begin: const Offset(-0.5, 0), end: const Offset(0.5, 0)),
                    duration: const Duration(seconds: 2),
                    curve: Curves.bounceInOut,
                    repeats: 0,
                    builder: (_, animatorState, __) => FractionalTranslation(
                      translation: animatorState.value,
                      child: const FlutterLogo(
                        size: 50,
                      ),
                    ),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  const Text("decelerate", style: _style),
                  Animator<Offset>(
                    tween: Tween<Offset>(begin: const Offset(-0.5, 0), end: const Offset(0.5, 0)),
                    duration: const Duration(seconds: 2),
                    curve: Curves.decelerate,
                    repeats: 0,
                    builder: (_, animatorState, __) => FractionalTranslation(
                      translation: animatorState.value,
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
            "5- Transform widget. Combining transform. dur:2s , cycles=0",
            style: _titleStyle,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text("translation + rotateZ", style: _style),
                  Animator<double>(
                    duration: const Duration(seconds: 2),
                    cycles: 0,
                    builder: (_, animatorState, __) => Transform(
                      transform: Matrix4.translationValues(animatorState.value * 100, 0, 0)
                        ..rotateZ(animatorState.value * 4 * pi),
                      alignment: Alignment.center,
                      child: const FlutterLogo(
                        size: 50,
                      ),
                    ),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text("translation + rotateZ +scale", style: _style),
                  Animator<double>(
                    duration: const Duration(seconds: 2),
                    cycles: 0,
                    builder: (_, animatorState, __) => Transform(
                      transform: Matrix4.translationValues(animatorState.value * 100, 0, 0)
                        ..setRotationZ(animatorState.value * 2 * pi)
                        ..scale(animatorState.value),
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
        ],
      ),
    );
  }
}
