// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:untitled2/core/Shared/components.dart';
import 'package:untitled2/features/register_screen/presentation/register_screen.dart';

class LoginBody extends StatelessWidget {
  LoginBody({Key? key}) : super(key: key);

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'LOGIN',
                style:
                Theme
                    .of(context)
                    .textTheme
                    .headline5
                    ?.copyWith(fontSize: 45),
              ),
              Text('login now to view the application ',
                  style: Theme
                      .of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(color: Colors.grey, fontSize: 18)),
              const SizedBox(
                height: 15,
              ),
              defaultFormField(
                controller: emailController,
                validate: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter Your Email Address';
                  }
                  return null;
                },
                label: 'Email Address',
                prefix: Icons.email_outlined,
              ),
              const SizedBox(
                height: 15,
              ),
              defaultFormField(
                controller: passwordController,
                validate: (value) {
                  if (value!.isEmpty) {
                    return 'Password is too short';
                  }
                  return null;
                },
                label: 'Password',
                prefix: Icons.lock_outlined,
                suffix: Icons.visibility_outlined,
                suffixPressed: () {},
              ),
              const SizedBox(
                height: 15,
              ),
              defaultButton(function: () {}, text: 'Login', isUpperCase: true),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment:MainAxisAlignment.center ,
                children: [
                  const Text(
                    "Don't have an account ?",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  defaultTextButton(text: 'Register now', function: () {
                    Navigator.push(
                        context, MaterialPageRoute(
                      builder: (context) => const RegisterScreen(),));
                  }),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
