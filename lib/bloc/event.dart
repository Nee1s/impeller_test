import 'package:equatable/equatable.dart';
import 'package:flutter_test_1/some_models_and_data/model.dart';

abstract class MEvent extends Equatable {
  const MEvent();

  @override
  List<Object?> get props => <Object>[];
}

class ExchangeList extends MEvent {
  const ExchangeList(this.list);

  final List<Model> list;

  @override
  List<Object?> get props => <Object>[list];
}

class StopStress extends MEvent {
  const StopStress(this.isStop);

  final bool isStop;

  @override
  List<Object?> get props => <Object>[isStop];
}
