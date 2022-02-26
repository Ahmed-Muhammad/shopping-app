
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/cache/cache_helper.dart';
import 'core/themes/themes.dart';
import 'core/web/API/dio_helper.dart';

import 'features/login/Screens/login_screen.dart';
import 'features/login/Widgets/cubit/bloc_observer.dart';
import 'features/on_boarding/Screens/on_boardin_screen.dart';
import 'layouts/main/screens/shop_layout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  bool? onBoarding = CacheHelper.getData(key: 'onBoarding');
  String? loginToken = CacheHelper.getData(key: 'token');
  Widget widget;

//to decide which page to be open first using "onBoarding" and "loginToken" and set widget to that value
  if (onBoarding != null) {
    if (loginToken != null) {
      widget = const ShopLayout();
    } else {
      widget = const LoginScreen();
    }
  } else {
    widget = const OnBoardingScreen();
  }

  BlocOverrides.runZoned(
    () => runApp(MyApp(startWidget: widget)),
    blocObserver: MyBlocObserver(),
  );
  runApp(MyApp(startWidget: widget));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.startWidget}) : super(key: key);
  final Widget startWidget;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      home: startWidget,
    );
  }
}
