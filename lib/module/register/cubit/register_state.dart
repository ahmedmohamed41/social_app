part of 'register_cubit.dart';

abstract class SocialRegisterState {}

final class SocialRegisterInitialState extends SocialRegisterState {}

final class SocialRegisterLoadingState extends SocialRegisterState {}

final class SocialRegisterSuccessState extends SocialRegisterState {
  final String pass;

  SocialRegisterSuccessState(this.pass);
}

final class SocialRegisterErrorState extends SocialRegisterState {
  final String error;

  SocialRegisterErrorState(this.error);
}

final class SocialRegisterChangePasswordVisibilityState
    extends SocialRegisterState {}

final class SocialCreateUserLoadingState extends SocialRegisterState {}

final class SocialCreateUserSuccessState extends SocialRegisterState {
  final String uId;

  SocialCreateUserSuccessState(this.uId);
}

final class SocialCreateUserErrorState extends SocialRegisterState {
  final String error;

  SocialCreateUserErrorState(this.error);
}
