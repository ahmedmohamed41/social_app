import 'package:flutter/material.dart';
import 'package:social_app/layout/Social_home.dart';

void main() {
  runApp(const SocialApp());
}

class SocialApp extends StatelessWidget {
  const SocialApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SocialHome(),
    );
  }
}
