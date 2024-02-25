part of 'login_cubit.dart';

abstract class SocialLoginState {}

final class SocialLoginInitialState extends SocialLoginState {}

final class SocialLoginLoadingState extends SocialLoginState {}

final class SocialLoginSuccessState extends SocialLoginState {
 final String pass;
 final String uId;

  SocialLoginSuccessState( this.pass,this.uId);

}

final class SocialLoginErrorState extends SocialLoginState {
  final String error;

  SocialLoginErrorState( this.error);

}

final class SocialLoginChangePasswordVisibilityState extends SocialLoginState {}
