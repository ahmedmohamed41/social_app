import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/model/social_model.dart';
part 'register_state.dart';

class SocialRegisterCubit extends Cubit<SocialRegisterState> {
  SocialRegisterCubit() : super(SocialRegisterInitialState());

  // object of Cubit
  static SocialRegisterCubit get(context) => BlocProvider.of(context);
  final formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  // ShopSocialRegisterModel? SocialRegisterModel;

  void userSocialRegister({
    required String email,
    required String password,
    required String name,
    required String phone,
  }) {
    emit(SocialRegisterLoadingState());

    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      print(value.user!.email);
      print(value.user!.uid);
      userCreate(email: email, uId: value.user!.uid, name: name, phone: phone);
      emit(SocialRegisterSuccessState('تم انشاء حساب بنجاح'));
    }).catchError((error) {
      emit(SocialRegisterErrorState(error.toString()));
    });
  }

  void userCreate({
    required String email,
    required String uId,
    required String name,
    required String phone,
  }) {
    SocialUserModel model = SocialUserModel(
      email: email,
      name: name,
      phone: phone,
      uId: uId,
      bio: 'write you bio ...',
      image: 'https://img.freepik.com/free-photo/waist-up-portrait-handsome-serious-unshaven-male-keeps-hands-together-dressed-dark-blue-shirt-has-talk-with-interlocutor-stands-against-white-wall-self-confident-man-freelancer_273609-16320.jpg?w=1380&t=st=1708995948~exp=1708996548~hmac=6dd196477a52e889b3eb1ebc357be744d3cd40b6d07156a72c90259e2030d308',
      cover: 'https://img.freepik.com/premium-photo/traditional-uzbek-oriental-cuisine-uzbek-family-table-from-different-dishes-new-year-holiday_127425-162.jpg?w=1380',
      isEmailVerified: false,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(model.toMap())
        .then((value) {
      emit(SocialCreateUserSuccessState(uId));
    }).catchError((error) {
      print(error.toString());
      emit(SocialCreateUserErrorState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = false;
  void changePasswordVisibility() {
    isPassword = !isPassword;
    if (isPassword) {
      suffix = Icons.visibility_off_outlined;
      emit(SocialRegisterChangePasswordVisibilityState());
    } else {
      suffix = Icons.visibility_outlined;
      emit(SocialRegisterChangePasswordVisibilityState());
    }
  }
}
