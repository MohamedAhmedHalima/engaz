import 'package:flutter/material.dart';

import '../widgets/first_on_boarding_screen.dart';
import '../widgets/second_on_boarding_screen.dart';

class OnBoardingScreen extends StatelessWidget {
  static const String routeName = "OnBoardingScreen";
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView(
        children: <Widget>[
          FirstOnBoardingScreen(),
          SecondOnBoardingScreen(),
        ],
      ),
    );
  }
}
