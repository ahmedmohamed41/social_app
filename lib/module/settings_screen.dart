import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/layout/cubit/social_cubit.dart';
import 'package:social_app/shared/components/constaints.dart';
import 'package:social_app/shared/style/icons/icon_broken.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialState>(
      listener: (context, state) {},
      builder: (context, state) {
        var model = SocialCubit.get(context).model;
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                SizedBox(
                  height: 180,
                  child: Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      Align(
                        alignment: AlignmentDirectional.topCenter,
                        child: Container(
                          height: 140,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          padding: EdgeInsets.zero,
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(8),
                          )),
                          child: SizedBox(
                            width: double.infinity,
                            child: Image(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                '${model!.cover}',
                              ),
                            ),
                          ),
                        ),
                      ),
                      Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          const CircleAvatar(
                            radius: 55,
                            backgroundColor: defaulScaffold,
                          ),
                          CircleAvatar(
                            radius: 50,
                            backgroundImage: NetworkImage(
                              '${model.image}',
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  '${model.name}',
                  style: const TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  '${model.bio}',
                  style: const TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(
                  height: 13,
                ),
                const Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            '100',
                            style: TextStyle(
                              fontSize: 13.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Posts',
                            style: TextStyle(
                              fontSize: 10.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            '265',
                            style: TextStyle(
                              fontSize: 13.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Photos',
                            style: TextStyle(
                              fontSize: 10.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            '10K',
                            style: TextStyle(
                              fontSize: 13.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Followers',
                            style: TextStyle(
                              fontSize: 10.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            '64',
                            style: TextStyle(
                              fontSize: 13.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Followings',
                            style: TextStyle(
                              fontSize: 10.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(color: Colors.grey[200]),
                        child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Add Photos',
                            style: TextStyle(color: defaultColor),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(IconBroken.Edit, color: defaultColor),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
