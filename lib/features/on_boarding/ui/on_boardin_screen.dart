import 'package:flutter/material.dart';


import '../../login_screen/ui/login_screen.dart';
import '../Widgets/on_boarding_body.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                )),
            child: const Text('Skip'),
          ),
        ],
      ),
      body: const OnBoardingBody(),
    );
  }
}
