import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled2/features/login_screen/Widgets/cubit/login_cubit.dart';
import 'package:untitled2/features/login_screen/Widgets/cubit/login_state.dart';

import '../Widgets/login_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: LoginBody(),
          );
        },
      ),
    );
  }
}
