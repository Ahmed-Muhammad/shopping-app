// ignore_for_file: unused_import, avoid_print

import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled2/features/login_screen/Screens/login_screen.dart';

import 'core/cache/cache_helper.dart';
import 'core/themes/themes.dart';
import 'core/web/API/dio_helper.dart';
import 'features/login_screen/Widgets/cubit/bloc_observer.dart';

import 'features/on_boarding/Screens/on_boardin_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  bool onBoarding = CacheHelper.getData(key: 'onBoarding');
  print(onBoarding);
  BlocOverrides.runZoned(
    () => runApp(MyApp(onBoarding: onBoarding)),
    blocObserver: MyBlocObserver(),
  );
  runApp(MyApp(onBoarding: onBoarding));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.onBoarding}) : super(key: key);
final bool onBoarding;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      home: onBoarding
          ?const LoginScreen()
          :const OnBoardingScreen(),
    );
  }
}
