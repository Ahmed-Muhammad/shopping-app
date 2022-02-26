import 'package:flutter/material.dart';

class FavoritesScreenBody extends StatelessWidget {
  const FavoritesScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Favorites  Screen',
        style: Theme.of(context).textTheme.bodyText1,
      ),
    );
  }
}
