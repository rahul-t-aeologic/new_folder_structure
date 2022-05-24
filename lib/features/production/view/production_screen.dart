import 'package:flutter/material.dart';

import '../../../res/assets.gen.dart';
import '../../../res/dimens.dart';

class ProductionScreen extends StatelessWidget {
  const ProductionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        title: const Text('Production Flavor'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Assets.imagesProduction.image(),
            const SizedBox(
              height: Dimens.px20,
            ),
            Text(
              'Production Flavor',
              style: Theme.of(context).textTheme.headline1,
            ),
          ],
        ),
      ),
    );
  }
}
