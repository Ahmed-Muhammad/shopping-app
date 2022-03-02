import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:untitled2/model/login/login_model.dart';

import '../../../../core/web/API/dio_helper.dart';
import '../../../../core/web/end_points.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

//------عشان اعرف استدعي ال cubit بطريقه بسيطه في اي مكان  -----
  static LoginCubit get(context) => BlocProvider.of(context);

  LoginModel? loginModel;

  //-------------------------------login function --------------
  void userLogin({
    required String email,
    required String password,
  }) {
    emit(LoginLoadingState());
    DioHelper.postData(
      url: LOGIN,
      lang: "ar",
      data: {
        'email': email,
        'password': password,
      },
    ).then((value) {
      print(value.data);
      //اخدت الداتا اللي جاياني من السيرفر
      loginModel = LoginModel.fromJson(value.data);
      emit(LoginSuccessState(loginModel!));
    }).catchError((error) {
      emit(LoginErrorState(error.toString()));
      print('error in posting Data is  =======> , ${error.toString()}');
    });
  }

  //---------------Change Password Visibility -------------------
  IconData suffix = Icons.visibility_outlined;
  bool obscureText = true;

  void changePasswordVisibility() {
    obscureText = !obscureText;
    suffix =
        obscureText ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(LoginChangePasswordVisibilityState());
  }
}
