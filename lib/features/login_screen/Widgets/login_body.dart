// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:untitled2/core/Shared/components.dart';

class LoginBody extends StatelessWidget {
  LoginBody({Key? key}) : super(key: key);

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'LOGIN',
            style: Theme.of(context).textTheme.headline5?.copyWith(fontSize: 30),
          ),
          Text('login now To view the application ',
              style: Theme.of(context)
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
          defaultButton(function: (){}, text: 'Login' , isUpperCase: true)
        ],
      ),
    );
  }
}
