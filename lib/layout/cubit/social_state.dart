part of 'social_cubit.dart';

@immutable
sealed class SocialState {}

final class SocialInitialState extends SocialState {}

final class SocialLoadingState extends SocialState {}

final class SocialSuccessState extends SocialState {}

final class SocialErrorState extends SocialState {}

final class SocialChngeModeState extends SocialState {}

final class SocialChngeBottomNavState extends SocialState {}

final class SocialAddPostState extends SocialState {}

final class SocialGetDataLoadingState extends SocialState {}

final class SocialGetDataSuccessState extends SocialState {}

final class SocialGetDataErrorState extends SocialState {}
