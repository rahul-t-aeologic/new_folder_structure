import 'package:flutter/material.dart';
import 'package:new_folder_structure/res/assets.gen.dart';
import 'package:new_folder_structure/res/dimens.dart';

import '../../../res/colors.gen.dart';

class DevelopmentScreen extends StatelessWidget {
  const DevelopmentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        title: const Text('Development Flavor'),
        backgroundColor: ColorName.mediumSlateBlue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Assets.imagesDevelopment.image(),
            const SizedBox(
              height: Dimens.px20,
            ),
            Text(
              'Development Flavor',
              style: Theme.of(context).textTheme.headline1,
            ),
          ],
        ),
      ),
    );
  }
}
