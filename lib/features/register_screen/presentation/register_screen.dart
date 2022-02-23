import 'package:flutter/material.dart';
import 'package:untitled2/features/register_screen/Widgets/register_body.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: RegisterBody(),
    );
  }
}
