import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/layout/cubit/social_cubit.dart';
import 'package:social_app/shared/style/icons/icon_broken.dart';

class SocialHome extends StatelessWidget {
  const SocialHome({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = SocialCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              cubit.appBarList[cubit.currentIndex],
            ),
            actions: [
              IconButton(onPressed: (){}, icon:const Icon(IconBroken.Notification)),
              IconButton(onPressed: (){}, icon:const Icon(IconBroken.Search)),
            ],
          ),
          body: ConditionalBuilder(
            condition: true,
            builder: (context) => cubit.screens[cubit.currentIndex],
            fallback: (context) => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.changeBottomNav(index);
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(IconBroken.Home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(IconBroken.Chat), label: 'Chat'),
              BottomNavigationBarItem(
                  icon: Icon(IconBroken.User), label: 'User'),
              BottomNavigationBarItem(
                  icon: Icon(IconBroken.Setting), label: 'Setting'),
            ],
          ),
        );
      },
    );
  }
}
