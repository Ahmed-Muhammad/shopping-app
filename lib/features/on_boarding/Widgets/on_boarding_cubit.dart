
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../core/cache/cache_helper.dart';
import '../../login/Screens/login_screen.dart';
part 'on_boarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit() : super(OnBoardingInitial());

  static OnBoardingCubit get(context) => BlocProvider.of(context);

  /*
 void submit :  method for SKIP button is used for
 save SKIP status in sheared
 preferences to avoid it stating every time */
  void  submit(context) {
    CacheHelper.saveData(key: 'onBoarding', value: true).then((value) {
      if (value == true) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ),
        );
      }
    });
    emit(CacheHelperSaveDataState());
  }
}
