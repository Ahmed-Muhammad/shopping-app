// ignore: unused_import
// ignore_for_file: unused_import, duplicate_ignore

import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/themes/themes.dart';
import 'features/on_boarding/presentation/on_boardin_screen.dart';



void main() /*async*/ {
  // WidgetsFlutterBinding.ensureInitialized();
  // DioHelper.init();
  // await CacheHelper.init();
  // BlocOverrides.runZoned(
  //   () => runApp(const MyApp()),
  //   blocObserver: MyBlocObserver(),
  // );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme ,
      darkTheme: darkTheme,
      home: const OnBoardingScreen(),
    );
  }
}
