import '../core/di.dart';
import '../core/moudle/module.dart';
import 'development/view_model/development_view_model.dart';

class FeatureModule extends Module {
  @override
  void registerDependencies() {
    DI.instance.registerFactory((di) => DevelopmentViewModel());
  }
}
