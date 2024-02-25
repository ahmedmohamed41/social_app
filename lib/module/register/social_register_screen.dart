import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/layout/social_home.dart';
import 'package:social_app/module/register/cubit/register_cubit.dart';
import 'package:social_app/shared/components/constaints.dart';
import 'package:social_app/shared/network/local/cache_helper.dart';
import 'package:social_app/widget/custom_button.dart';
import 'package:social_app/widget/custom_text_from_filed.dart';

class SocialRegisterScreen extends StatelessWidget {
  const SocialRegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SocialRegisterCubit(),
      child: BlocConsumer<SocialRegisterCubit, SocialRegisterState>(
        listener: (context, state) {
          if (state is SocialCreateUserSuccessState) {
            CacheHelper.saveData(key: 'uId', value: state.uId).then((value) {
              navigateAndFinish(context, const SocialHome());
            });
          }
        },
        builder: (context, state) {
          var cubit = SocialRegisterCubit.get(context);
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: cubit.formKey,
                child: ListView(
                  children: [
                    const SizedBox(
                      height: 110,
                    ),
                    const Text(
                      'REGISTER',
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
                      'Register now to browse our hot offers',
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
                        cubit.changePasswordVisibility();
                      },
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    CustomTextFormField(
                      controller: cubit.nameController,
                      labelText: 'Name',
                      inputType: TextInputType.name,
                      prefixIcon: const Icon(Icons.person),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your name';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    CustomTextFormField(
                      controller: cubit.phoneController,
                      labelText: 'Phone',
                      inputType: TextInputType.phone,
                      prefixIcon: const Icon(Icons.phone),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your phone';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    ConditionalBuilder(
                      condition: state is! SocialRegisterLoadingState,
                      builder: (context) => CustomButton(
                        onTap: () {
                          if (cubit.formKey.currentState!.validate()) {
                            cubit.userSocialRegister(
                                name: cubit.nameController.text,
                                phone: cubit.phoneController.text,
                                email: cubit.emailController.text,
                                password: cubit.passwordController.text);
                          }
                        },
                        text: 'REGISTER',
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
                          "Do have an account? ",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            ' Login',
                            style: TextStyle(
                              color: kAppbarColor,
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
