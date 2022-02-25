import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';




import '../Widgets/on_boarding_body.dart';
import '../Widgets/on_boarding_cubit.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnBoardingCubit(),
      child: BlocConsumer<OnBoardingCubit, OnBoardingState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              actions: [
                TextButton(
                  onPressed: () =>OnBoardingCubit.get(context).submit(context),
                  //     Navigator.pushReplacement(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const LoginScreen(),
                  //   ),
                  // ),
                  child: const Text('Skip'),
                ),
              ],
            ),
            body: const OnBoardingBody(),
          );
        },
      ),
    );
  }
}
