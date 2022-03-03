import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled2/layouts/home/Widgets/cubit/shop_cubit.dart';

import 'core/Shared/constant.dart';
import 'core/cache/cache_helper.dart';
import 'core/themes/themes.dart';
import 'core/web/API/dio_helper.dart';

import 'features/login/Screens/login_screen.dart';
import 'features/login/Widgets/cubit/bloc_observer.dart';
import 'features/login/Widgets/cubit/login_cubit.dart';
import 'features/on_boarding/Screens/on_boardin_screen.dart';
import 'features/search/widgets/search_cubit.dart';
import 'layouts/home/screens/shop_layout.dart';

void main() async {
  //ensure every thing is Initialized then Run App
  WidgetsFlutterBinding.ensureInitialized();
  //---------- Dio Initialization ------------
  DioHelper.init();
  //---------- shared Preferences Initialization ------------
  await CacheHelper.init();
  //to check if onBoarding have been seen or not,
  //if the onBoarding is true then skip it and open to login
  //else start it again
  bool? onBoarding = CacheHelper.getData(key: 'onBoarding');
  //token ⬇ is saved in constant, it is an indication of
  // the profile token which carry the user information
  token = CacheHelper.getData(key: 'token');
  print('token ====>"$token"');
  //to decide which page to be open first using "onBoarding"
  //and "token" and set widget to that value to be opened firstly
  //according to which widest is done
  Widget widget;
  if (onBoarding != null) {
    if (token != null) {
      widget = const ShopLayout();
    } else {
      widget = const LoginScreen();
    }
  } else {
    widget = const OnBoardingScreen();
  }

//------Bloc observer ------------
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
    return MultiBlocProvider(
      providers: [
        //LoginCubit
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
        BlocProvider(
        create: (context) => SearchCubit(),),
        //ShopCubit
        BlocProvider(
          create: (context) => ShopCubit()
            ..getProfile()
            ..getHomeData()
            ..getCategories()
            ..getFavorites(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        darkTheme: darkTheme,
        home: startWidget,
      ),
    );
  }
}
