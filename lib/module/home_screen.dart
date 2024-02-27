import 'package:flutter/material.dart';

import 'package:social_app/widget/custom_card_item_builder.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          Card(
            elevation: 5.0,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            margin: const EdgeInsets.all(12),
            child: Container(
              height: 200,
              color: Colors.white,
              width: double.infinity,
              child: const Stack(
                alignment: FractionalOffset.topRight,
                children: [
                  Image(
                    image: NetworkImage(
                      'https://img.freepik.com/premium-photo/surprised-young-man-with-gesture-approval_1459-18293.jpg',
                    ),
                    fit: BoxFit.cover,
                    height: 250,
                    width: double.infinity,
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'communication with friends',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => const CustomCardItemBuilder(),
            separatorBuilder: (context, index) => const SizedBox(
              width: double.infinity,
              height: 10,
            ),
            itemCount: 10,
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    ));
  }
}
