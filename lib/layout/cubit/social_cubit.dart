import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/module/chats_screen.dart';
import 'package:social_app/module/home_screen.dart';
import 'package:social_app/module/settings_screen.dart';
import 'package:social_app/module/users_screen.dart';
import 'package:social_app/shared/network/local/cache_helper.dart';

part 'social_state.dart';

class SocialCubit extends Cubit<SocialState> {
  SocialCubit() : super(SocialInitialState());

  static SocialCubit get(context) => BlocProvider.of(context);
  bool isDark = false;
  int currentIndex = 0;

  List<String> appBarList = const [
    'Home Screen',
    'Chats Screen',
    'Users Screen',
    'Settings Screen',
  ];

  List<Widget> screens = const [
    HomeScreen(),
    ChatsScreen(),
    UsersScreen(),
    SettingsScreen(),
  ];

  void changeBottomNav(int index) {
    currentIndex = index;
    emit(SocialChngeBottomNavState());
  }

  void changeAppMode({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(SocialChngeModeState());
    } else {
      isDark = !isDark;
      CacheHelper.putBoolean(key: 'isDark', value: isDark).then((value) {
        emit(SocialChngeModeState());
      });
    }
  }
}
