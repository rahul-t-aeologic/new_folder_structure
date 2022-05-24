import 'package:flutter/material.dart';
import '../../../core/flavor_config.dart';
import '../../development/view/development_screen.dart';
import '../../production/view/production_screen.dart';
import '../../staging/view/staging_screen.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (FlavorConfig.instance.flavor) {
      case Flavor.dev:
        return const DevelopmentScreen();
      case Flavor.qa:
        return const StagingScreen();
      case Flavor.prod:
        return const ProductionScreen();
    }
  }
}
