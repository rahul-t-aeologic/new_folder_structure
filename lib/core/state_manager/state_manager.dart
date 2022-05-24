
import 'package:bloc/bloc.dart';

import '../app_logger/app_logger.dart';

abstract class StateManager<S> extends Cubit<S> {
  StateManager(S state) : super(state);

  set state(S value) {
    emit(value);
  }

  updateState() {
    state = state;
  }

  @override
  void onChange(Change<S> change) {
    AppLogger.log(change.currentState.toString());
    super.onChange(change);
  }
}
