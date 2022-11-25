import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_1/bloc/bloc.dart';
import 'package:flutter_test_1/bloc/state.dart';

import 'widgets/widgets.dart';

// import 'basic_animation_2/nested_animator.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MBloc>(
      create: (_) => MBloc(),
      lazy: false,
      child: const MaterialApp(
        title: 'Animator Demo',
        home: MyCustomPainterAnimation(),
      ),
    );
  }
}
