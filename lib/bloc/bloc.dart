import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_1/bloc/event.dart';
import 'package:flutter_test_1/bloc/state.dart';
import 'package:flutter_test_1/some_models_and_data/data.dart';
import 'package:flutter_test_1/some_models_and_data/model.dart';

class MBloc extends Bloc<MEvent, MState> {
  MBloc() : super(const MState()) {
    on<ExchangeList>(_changeList);
    on<StopStress>(_stopStress);

    Future.delayed(
      const Duration(minutes: 2),
      () => add(const StopStress(true)),
    );

    _stressLoadApp();
  }

  Future<void> _stressLoadApp() async {
    final Rep _jsonGetter = Rep();

    final List<dynamic> json = _jsonGetter.jsonData;
    final List<Model> models = <Model>[];

    for (Map<String, dynamic> entity in json) {
      models.add(DTO.fromJson(entity));
    }
    await Future.delayed(
      const Duration(milliseconds: 100),
      () => add(ExchangeList(models)),
    );
    if (state.stopStress) return;
    _stressLoadApp();
  }

  void _changeList(ExchangeList event, Emitter<MState> emit) {
    emit(state.copyWith(userList: event.list));
  }

  void _stopStress(StopStress event, Emitter<MState> emit) {
    emit(state.copyWith(stopStress: event.isStop));
  }
}
