import 'package:flutter/material.dart';
import 'package:flutter_test_1/some_models_and_data/model.dart';

class UserCard extends StatelessWidget {
  const UserCard({
    Key? key,
    required this.name,
    required this.age,
    required this.fingers,
    required this.nicknames,
  }) : super(key: key);

  UserCard.fromModel({
    Key? key,
    required Model userModel,
  })  : name = userModel.name,
        age = userModel.age,
        fingers = userModel.fingers,
        nicknames = userModel.nicknames,
        super(key: key);

  final String name;
  final int age;
  final double fingers;
  final List<String> nicknames;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: DecoratedBox(
        position: DecorationPosition.foreground,
        decoration: BoxDecoration(
          color: Colors.amber[700]?.withOpacity(0.6),
          border: Border.all(
            color: Colors.black38,
            width: 3.0,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(16)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: Text(name)),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Age: $age'),
                    Text('Lasts fingers: $fingers'),
                  ],
                ),
              ),
              Flexible(
                child: ListView.builder(
                  itemCount: nicknames.length,
                  itemBuilder: (context, index) => Text(
                    nicknames[index],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
