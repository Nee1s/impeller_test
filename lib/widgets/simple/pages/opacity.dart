import 'package:flutter/material.dart';
import 'package:animator/animator.dart';

class OpacityAnimation extends StatelessWidget {
  const OpacityAnimation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[
            Text('Tween<double>'),
            Text('Opacity Animation'),
          ],
        ),
      ),
      body: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const _style = TextStyle(fontSize: 12, fontWeight: FontWeight.bold);
    const _titleStyle = TextStyle(fontWeight: FontWeight.bold);
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          const Text(
            "1- Opacity widget. Default Animation = Twn:<bouble> 0 -->1, Dur: 500ms, Crv: Linear",
            style: _titleStyle,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  const Text("Defaut", style: _style),
                  Animator<double>(
                    builder: (_, animatorState, __) => Opacity(
                      opacity: animatorState.value,
                      child: const FlutterLogo(
                        size: 50,
                      ),
                    ),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  const Text("repeats = 5", style: _style),
                  Animator<double>(
                    repeats: 5,
                    // ignore: avoid_print
                    endAnimationListener: (_) => print("end"),
                    builder: (_, animatorState, __) => Opacity(
                      opacity: animatorState.value,
                      child: const FlutterLogo(
                        size: 50,
                      ),
                    ),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  const Text("repeats = 0", style: _style),
                  Animator<double>(
                    repeats: 0,
                    builder: (_, animatorState, __) => Opacity(
                      opacity: animatorState.value,
                      child: const FlutterLogo(
                        size: 50,
                      ),
                    ),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  const Text("cycles = 10", style: _style),
                  Animator<double>(
                    cycles: 2 * 5,
                    builder: (_, animatorState, __) => Opacity(
                      opacity: animatorState.value,
                      child: const FlutterLogo(
                        size: 50,
                      ),
                    ),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  const Text("cycles = 0", style: _style),
                  Animator<double>(
                    cycles: 0,
                    builder: (_, animatorState, __) => Opacity(
                      opacity: animatorState.value,
                      child: const FlutterLogo(
                        size: 50,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
          const Divider(height: 20, color: Colors.teal),
          const Text(
            "2- FadeTransition widget : Default Animation = Twn:<bouble> 0 -->1, Dur: 500ms, Crv: Linear",
            style: _titleStyle,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  const Text("Defaut", style: _style),
                  Animator<double>(
                    builder: (_, animatorState, __) => FadeTransition(
                      opacity: animatorState.animation,
                      child: const FlutterLogo(
                        size: 50,
                      ),
                    ),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  const Text("repeats = 5", style: _style),
                  Animator<double>(
                    repeats: 5,
                    builder: (_, animatorState, __) => FadeTransition(
                      opacity: animatorState.animation,
                      child: const FlutterLogo(
                        size: 50,
                      ),
                    ),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  const Text("repeats = 0", style: _style),
                  Animator<double>(
                    repeats: 0,
                    builder: (_, animatorState, __) => FadeTransition(
                      opacity: animatorState.animation,
                      child: const FlutterLogo(
                        size: 50,
                      ),
                    ),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  const Text("cycles = 10", style: _style),
                  Animator<double>(
                    cycles: 2 * 5,
                    builder: (_, animatorState, __) => FadeTransition(
                      opacity: animatorState.animation,
                      child: const FlutterLogo(
                        size: 50,
                      ),
                    ),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  const Text("cycles = 0", style: _style),
                  Animator<double>(
                    cycles: 0,
                    builder: (_, animatorState, __) => FadeTransition(
                      opacity: animatorState.animation,
                      child: const FlutterLogo(
                        size: 50,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
          const Divider(height: 20, color: Colors.teal),
          const Text(
            "3- FadeTransition widget : duration = 2s",
            style: _titleStyle,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  const Text("Default", style: _style),
                  Animator<double>(
                    duration: const Duration(seconds: 2),
                    builder: (_, animatorState, __) => FadeTransition(
                      opacity: animatorState.animation,
                      child: const FlutterLogo(
                        size: 50,
                      ),
                    ),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  const Text("repeats = 5", style: _style),
                  Animator<double>(
                    duration: const Duration(seconds: 2),
                    repeats: 5,
                    builder: (_, animatorState, __) => FadeTransition(
                      opacity: animatorState.animation,
                      child: const FlutterLogo(
                        size: 50,
                      ),
                    ),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  const Text("repeats = 0", style: _style),
                  Animator<double>(
                    duration: const Duration(seconds: 2),
                    repeats: 0,
                    builder: (_, animatorState, __) => FadeTransition(
                      opacity: animatorState.animation,
                      child: const FlutterLogo(
                        size: 50,
                      ),
                    ),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  const Text("cycles = 10", style: _style),
                  Animator<double>(
                    duration: const Duration(seconds: 2),
                    cycles: 2 * 5,
                    builder: (_, animatorState, __) => FadeTransition(
                      opacity: animatorState.animation,
                      child: const FlutterLogo(
                        size: 50,
                      ),
                    ),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  const Text("cycles = 0", style: _style),
                  Animator<double>(
                    duration: const Duration(seconds: 2),
                    cycles: 0,
                    builder: (_, animatorState, __) => FadeTransition(
                      opacity: animatorState.animation,
                      child: const FlutterLogo(
                        size: 50,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
          const Divider(height: 20, color: Colors.teal),
          const Text(
            "4- FadeTransition widget : duration = 2s, curve = elasticOut",
            style: _titleStyle,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  const Text("Defaut", style: _style),
                  Animator<double>(
                    duration: const Duration(seconds: 2),
                    curve: Curves.fastOutSlowIn,
                    builder: (_, animatorState, __) => FadeTransition(
                      opacity: animatorState.animation,
                      child: const FlutterLogo(
                        size: 50,
                      ),
                    ),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  const Text("repeats = 5", style: _style),
                  Animator<double>(
                    duration: const Duration(seconds: 2),
                    curve: Curves.fastOutSlowIn,
                    repeats: 5,
                    builder: (_, animatorState, __) => FadeTransition(
                      opacity: animatorState.animation,
                      child: const FlutterLogo(
                        size: 50,
                      ),
                    ),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  const Text("repeats = 0", style: _style),
                  Animator<double>(
                    duration: const Duration(seconds: 2),
                    curve: Curves.fastOutSlowIn,
                    repeats: 0,
                    builder: (_, animatorState, __) => FadeTransition(
                      opacity: animatorState.animation,
                      child: const FlutterLogo(
                        size: 50,
                      ),
                    ),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  const Text("cycles = 10", style: _style),
                  Animator<double>(
                    duration: const Duration(seconds: 2),
                    curve: Curves.decelerate,
                    cycles: 2 * 5,
                    builder: (_, animatorState, __) => FadeTransition(
                      opacity: animatorState.animation,
                      child: const FlutterLogo(
                        size: 50,
                      ),
                    ),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  const Text("cycles = 0", style: _style),
                  Animator<double>(
                    duration: const Duration(seconds: 2),
                    curve: Curves.elasticOut,
                    cycles: 0,
                    builder: (_, animatorState, __) => FadeTransition(
                      opacity: animatorState.animation,
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
