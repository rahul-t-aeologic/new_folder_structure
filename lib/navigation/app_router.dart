import 'package:auto_route/annotations.dart';

import '../features/initial/view/initial_screen.dart';

@CupertinoAutoRouter(
  routes: [
    CupertinoRoute(page: InitialScreen, initial: true),
  ],
  replaceInRouteName: "Routes",
)
class $AppRouter {}
