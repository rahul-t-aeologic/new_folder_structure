import 'package:flutter/material.dart';

import '../../../res/assets.gen.dart';
import '../../../res/dimens.dart';

class StagingScreen extends StatelessWidget {
  const StagingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      appBar: AppBar(
        title: const Text('Staging Flavor'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Assets.imagesStaging.image(),
            const SizedBox(
              height: Dimens.px20,
            ),
            Text(
              'Staging Flavor',
              style: Theme.of(context).textTheme.headline1,
            ),
          ],
        ),
      ),
    );
  }
}
