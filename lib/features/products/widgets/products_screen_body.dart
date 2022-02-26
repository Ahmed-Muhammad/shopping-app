import 'package:flutter/material.dart';

class ProductsScreenBody extends StatelessWidget {
  const ProductsScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Products Screen',
        style: Theme.of(context).textTheme.bodyText1,
      ),
    );
  }
}
