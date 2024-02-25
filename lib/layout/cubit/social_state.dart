part of 'social_cubit.dart';

@immutable
sealed class SocialState {}

final class SocialInitialState extends SocialState {}

final class SocialLoadingState extends SocialState {}

final class SocialSuccessState extends SocialState {}

final class SocialErrorState extends SocialState {}

final class SocialChngeModeState extends SocialState {}
