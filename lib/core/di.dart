import 'package:get_it/get_it.dart';

import 'app_logger/app_logger.dart';

typedef RegisterFunc<T> = T Function(DI di);

class DI {
  DI._();

  static DI instance = DI._();

  final GetIt _getIt = GetIt.I;

  T get<T extends Object>({
    String? instanceName,
    dynamic param1,
    dynamic param2,
  }) {
    if (!_getIt.isRegistered<T>()) {
      AppLogger.logError('Please Register $T ${instanceName ?? ''}');
    }

    return _getIt.get<T>(
      instanceName: instanceName,
      param1: param1,
      param2: param2,
    );
  }

  void registerFactory<T extends Object>(
    RegisterFunc<T> registerFunc, {
    String? instanceName,
  }) {
    _getIt.registerFactory(
      () => registerFunc(instance),
      instanceName: instanceName,
    );
  }

  void registerSingleton<T extends Object>(
    RegisterFunc<T> registerFunc, {
    String? instanceName,
    bool? signalsReady,
    DisposingFunc<T>? dispose,
  }) {
    _getIt.registerSingleton(
      registerFunc(instance),
      instanceName: instanceName,
      dispose: dispose,
      signalsReady: signalsReady,
    );
  }
}
