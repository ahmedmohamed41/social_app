import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/firebase_options.dart';
import 'package:social_app/layout/cubit/social_cubit.dart';
import 'package:social_app/layout/social_home.dart';
import 'package:social_app/module/login/social_login_screen.dart';
import 'package:social_app/shared/bloc_observer.dart';
import 'package:social_app/shared/network/local/cache_helper.dart';
import 'package:social_app/shared/style/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await CacheHelper.init();
  Bloc.observer = MyBlocObserver();
  var uId = CacheHelper.getDate(key: 'uId');
  Widget widget;
  if (uId != null) {
    widget = const SocialHome();
  } else {
    widget = const SocialLoginScreen();
  }
  runApp( SocialApp(widget: widget,));
}

class SocialApp extends StatelessWidget {
  const SocialApp({super.key, required this.widget});
  final Widget widget;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      
      providers: [
        BlocProvider(
          create: (context) => SocialCubit()..changeAppMode(fromShared: true),
        ),
       
      ],
      child: BlocConsumer<SocialCubit, SocialState>(
        listener: (context, state) {},

        builder: (context, state) {
          return  MaterialApp(
            theme: lightTheme,
            home: widget,
          );
        },
      ),
    );
  }
}
