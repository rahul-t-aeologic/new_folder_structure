import 'package:new_folder_structure/res/constants.dart';

import 'core/di.dart';
import 'core/flavor_config.dart';
import 'core/moudle/module.dart';
import 'core/network/error_model.dart';
import 'core/network/i_error_model.dart';

class GlobalModule extends Module {
  @override
  void registerDependencies() {
    DI.instance.registerSingleton<String>(
      (di) => FlavorConfig.instance.values.baseUrl,
      instanceName: Constants.baseUrlKey,
    );
    DI.instance.registerSingleton<IErrorModel>((di) => ErrorModel());
  }
}
