import 'package:flutter/material.dart';

class SearchScreenBody extends StatelessWidget {
  const SearchScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(" Search Screen "),
      ),
      body: Center(
        child: Text(
          'Search Screen ',
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
    );
  }
}
