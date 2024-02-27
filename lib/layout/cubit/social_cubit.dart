import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/model/social_model.dart';
import 'package:social_app/module/add_post_screen.dart';
import 'package:social_app/module/chats_screen.dart';
import 'package:social_app/module/home_screen.dart';
import 'package:social_app/module/settings_screen.dart';
import 'package:social_app/module/users_screen.dart';
import 'package:social_app/shared/network/local/cache_helper.dart';

import '../../shared/components/constaints.dart';

part 'social_state.dart';

class SocialCubit extends Cubit<SocialState> {
  SocialCubit() : super(SocialInitialState());

  static SocialCubit get(context) => BlocProvider.of(context);
  bool isDark = false;
  int currentIndex = 0;

  List<String> appBarList = const [
    'Home Screen',
    'Chats Screen',
    'Add Post Screen',
    'Users Screen',
    'Settings',
  ];

  List<Widget> screens = const [
    HomeScreen(),
    ChatsScreen(),
    AddPostScreen(),
    UsersScreen(),
    SettingsScreen(),
  ];

  void changeBottomNav(int index) {
    if (index == 2) {
      emit(SocialAddPostState());
    } else {
      currentIndex = index;
      emit(SocialChngeBottomNavState());
    }
  }

  SocialUserModel? model;

  void getUserData() {
    emit(SocialGetDataLoadingState());
    FirebaseFirestore.instance.collection('users').doc(uId).get().then(
      (value) {
        model = SocialUserModel.fromJson(value.data()!);
        emit(SocialGetDataSuccessState());
      },
    ).catchError((error) {
      emit(SocialGetDataErrorState());
    });
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
