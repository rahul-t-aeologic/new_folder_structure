import 'package:flutter/material.dart';
import '../navigation/navigation_handler.dart';
import '../res/app_theme.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: NavigationHandler.routeInformationParser,
      routerDelegate: NavigationHandler.routerDelegate,
      theme: FortyTwoTheme.theme,
      // localizationsDelegates: const [
      //   AppLocalizations.delegate,
      //   GlobalMaterialLocalizations.delegate,
      // ],
      // supportedLocales: AppLocalizations.supportedLocales,
      // home: const TestScreen(),
    );
  }
}
