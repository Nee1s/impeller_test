import 'package:equatable/equatable.dart';

import '../some_models_and_data/model.dart';

class MState extends Equatable {
  const MState({
    this.userList = const <Model>[],
    this.stopStress = false,
  });

  MState copyWith({
    List<Model>? userList,
    bool? stopStress,
  }) =>
      MState(
        userList: userList ?? this.userList,
        stopStress: stopStress ?? this.stopStress,
      );

  final List<Model> userList;
  final bool stopStress;

  @override
  List<Object?> get props => <Object>[userList];
}
