import 'package:animator/animator.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyAnimatedContainer());

/// Inspired form https://api.flutter.dev/flutter/widgets/AnimatedContainer-class.html

class MyAnimatedContainer extends StatelessWidget {
  const MyAnimatedContainer({Key? key}) : super(key: key);

  static const String _title = 'Implicit Animation';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(_title)),
      body: const MyStatefulWidget(),
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = !selected;
        });
      },
      child: Column(
        children: [
          const Text('Flutter AnimatedContainer'),
          const SizedBox(height: 20),
          Expanded(
            child: Center(
              child: AnimatedContainer(
                width: selected ? 200.0 : 100.0,
                height: selected ? 100.0 : 200.0,
                color: selected ? Colors.red : Colors.blue,
                alignment: selected ? Alignment.center : AlignmentDirectional.topCenter,
                duration: const Duration(seconds: 2),
                curve: Curves.fastOutSlowIn,
                child: const FlutterLogo(size: 75),
              ),
            ),
          ),
          const Text('Using AnimateWidget'),
          const SizedBox(height: 20),
          Expanded(
            child: Center(
              child: AnimateWidget(
                duration: const Duration(seconds: 2),
                curve: Curves.fastOutSlowIn,
                builder: (context, animate) {
                  final width = animate(selected ? 200.0 : 100.0);
                  final height = animate(selected ? 100.0 : 200.0, 'height');
                  final alignment = animate(
                    selected ? Alignment.center : AlignmentDirectional.topCenter,
                  );
                  final Color? color = animate(
                    selected ? Colors.red : Colors.blue,
                  );
                  return Container(
                    width: width,
                    height: height,
                    color: color,
                    alignment: alignment,
                    child: const FlutterLogo(size: 75),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
