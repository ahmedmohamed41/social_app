import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/layout/social_home.dart';
import 'package:social_app/module/login/cubit/login_cubit.dart';
import 'package:social_app/module/register/social_register_screen.dart';
import 'package:social_app/shared/components/constaints.dart';
import 'package:social_app/shared/network/local/cache_helper.dart';
import 'package:social_app/widget/custom_button.dart';
import 'package:social_app/widget/custom_text_from_filed.dart';

class SocialLoginScreen extends StatelessWidget {
  const SocialLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SocialLoginCubit(),
      child: BlocConsumer<SocialLoginCubit, SocialLoginState>(
        listener: (context, state) {
          if (state is SocialLoginSuccessState) {
            CacheHelper.saveData(key: 'uId', value: state.uId).then((value) {
              flutterToastShow(state.pass, Colors.green);
              navigateAndFinish(context, const SocialHome());
            });
          } else if (state is SocialLoginErrorState) {
            flutterToastShow(state.error, Colors.red);
          }
        },
        builder: (context, state) {
          var cubit = SocialLoginCubit.get(context);
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: cubit.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'LOGIN',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const Text(
                      'Login now to browse our hot offers',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    CustomTextFormField(
                      controller: cubit.emailController,
                      labelText: 'Email Address',
                      inputType: TextInputType.emailAddress,
                      prefixIcon: const Icon(Icons.email_outlined),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your email address';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    CustomTextFormField(
                      controller: cubit.passwordController,
                      labelText: 'PassWord',
                      inputType: TextInputType.visiblePassword,
                      prefixIcon: const Icon(Icons.lock_outline),
                      suffixIcon: cubit.suffix,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your password';
                        } else {
                          return null;
                        }
                      },
                      isPassword: cubit.isPassword,
                      suffixPressed: () {
                        SocialLoginCubit.get(context)
                            .changePasswordVisibility();
                      },
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    ConditionalBuilder(
                      condition: true,
                      builder: (context) => CustomButton(
                        onTap: () {
                          if (cubit.formKey.currentState!.validate()) {
                            cubit.userSocialLogin(
                              email: cubit.emailController.text,
                              password: cubit.passwordController.text,
                            );
                          }
                          // navigateTo(context, const SocialHome());
                        },
                        text: 'LOGIN',
                      ),
                      fallback: (context) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account? ",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            navigateTo(context, const SocialRegisterScreen());
                          },
                          child: const Text(
                            ' Register',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 17.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
