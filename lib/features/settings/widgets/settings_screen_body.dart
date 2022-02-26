import 'package:flutter/material.dart';

class SettingsScreenBody extends StatelessWidget {
  const SettingsScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Settings Screen',
        style: Theme.of(context).textTheme.bodyText1,
      ),
    );
  }
}
