import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class SocialLoginCubit extends Cubit<SocialLoginState> {
  SocialLoginCubit() : super(SocialLoginInitialState());

  // object of Cubit
  static SocialLoginCubit get(context) => BlocProvider.of(context);

  // ShopSocialLoginModel? SocialLoginModel;
final formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  // void userSocialLogin({
  //   required String email,
  //   required String password,
  // }) async {
  //   emit(SocialLoginLoadingState());
  //   try {
  //     await FirebaseAuth.instance
  //         .signInWithEmailAndPassword(email: email, password: password);

  //     emit(SocialLoginSuccessState("تم التسجيل الدخول بنجاح",));
  //   } catch (e) {
  //     emit(SocialLoginErrorState(e.toString()));
  //   }
  // }
  void userSocialLogin({
    required String email,
    required String password,
  }){
     emit(SocialLoginLoadingState());
 FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password).then((value) {
             emit(SocialLoginSuccessState("تم التسجيل الدخول بنجاح",value.user!.uid));
          }).catchError((error){
            emit(SocialLoginErrorState(error.toString()));
          });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = false;
  void changePasswordVisibility() {
    isPassword = !isPassword;
    if (isPassword) {
      suffix = Icons.visibility_off_outlined;
      emit(SocialLoginChangePasswordVisibilityState());
    } else {
      suffix = Icons.visibility_outlined;
      emit(SocialLoginChangePasswordVisibilityState());
    }
  }
}
