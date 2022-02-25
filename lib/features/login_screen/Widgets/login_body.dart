// ignore_for_file: must_be_immutable

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled2/core/Shared/components.dart';
import 'package:untitled2/features/register_screen/presentation/register_screen.dart';

import 'cubit/login_cubit.dart';
import 'cubit/login_state.dart';

class LoginBody extends StatelessWidget {
  LoginBody({Key? key}) : super(key: key);
  late GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => LoginCubit(),
        child: BlocConsumer<LoginCubit, LoginStates>(
            listener: (context, state) {},
            builder: (context, state) {
              return Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'LOGIN',
                            style:
                                Theme.of(context).textTheme.headline5?.copyWith(
                                      fontSize: 45,
                                      fontWeight: FontWeight.w900,
                                    ),
                          ),
                          Text(
                            'login now to view the application ',
                            style:
                                Theme.of(context).textTheme.bodyText1?.copyWith(
                                      color: Colors.grey,
                                      fontSize: 18,
                                    ),
                          ),
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
                            //as
                            label: 'Password',
                            //using Login cubit
                            obscureText: LoginCubit.get(context).obscureText,
                            prefix: Icons.lock_outlined,
                            //using Login cubit
                            suffix: LoginCubit.get(context).suffix,
                            suffixPressed: () {
                              //using Login cubit
                              LoginCubit.get(context)
                                  .changePasswordVisibility();
                            },
                            onSubmit: (value) {
                              if (formKey.currentState!.validate()) {
                                LoginCubit.get(context).userLogin(
                                  email: emailController.text,
                                  password: passwordController.text,
                                );
                              }
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          ConditionalBuilder(
                            condition: state is! LoginLoadingState,
                            fallback: (context) => const Center(
                                child: CircularProgressIndicator()),
                            builder: (context) => defaultButton(
                              function: () {
                                if (formKey.currentState!.validate()) {
                                  LoginCubit.get(context).userLogin(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  );
                                }
                              },
                              text: 'Login',
                              isUpperCase: true,
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Don't have an account ?",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              defaultTextButton(
                                  text: 'Register now',
                                  function: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const RegisterScreen(),
                                        ));
                                  }),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }));
  }
}
