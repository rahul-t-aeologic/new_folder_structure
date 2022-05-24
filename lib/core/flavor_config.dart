
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../res/constants.dart';

enum Flavor { dev, qa, prod }

class FlavorValues {
  FlavorValues({required this.baseUrl});

  final String baseUrl;
}

class FlavorConfig {
  factory FlavorConfig({
    required Flavor flavor,
  }) {
    _instance ??= FlavorConfig._internal(flavor, _getFlavorValues(flavor));
    return _instance!;
  }

  FlavorConfig._internal(this.flavor, this.values);

  final Flavor flavor;
  final FlavorValues values;
  static FlavorConfig? _instance;

  static FlavorConfig get instance {
    return _instance!;
  }

  static bool isProduction() => _instance!.flavor == Flavor.prod;

  static bool isDevelopment() => _instance!.flavor == Flavor.dev;

  static bool isQA() => _instance!.flavor == Flavor.qa;

  static FlavorValues _getFlavorValues(Flavor flavor) {
    switch (flavor) {
      case Flavor.dev:
        return FlavorValues(
          baseUrl: dotenv.env[Constants.devBaseUrl]!,
        );
      case Flavor.qa:
      case Flavor.prod:
        return FlavorValues(
          baseUrl: dotenv.env[Constants.prodBaseUrl]!,
        );
    }
  }
}
