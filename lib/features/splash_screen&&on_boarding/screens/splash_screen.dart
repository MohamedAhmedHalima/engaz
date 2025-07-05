import 'package:engaz/core/network/shared_preferences.dart';
import 'package:engaz/features/home/screens/main_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../auth/login/screens/login_screen.dart';
import 'on_boarding_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "SplashScreen";

  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  double _opacity = 0.0;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        setState(() {
          _opacity = 1.0;
        });
      }
    });
    _navigateBasedOnToken();
  }

  Future<void> _navigateBasedOnToken() async {
    await Future.delayed(const Duration(seconds: 4));
    if (!mounted) return;

    String? token = await SharedPreferencesHelper.getToken();

    if (mounted) {
      SharedPreferencesHelper.getOnboardingState().then((value){
        if(!SharedPreferencesHelper.isPassedOnboarding){
          SharedPreferencesHelper.saveOnboardingState(true).then((value) { Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => OnBoardingScreen()),
          );});

        }else{
          if (token != null && token.isNotEmpty) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => MainHome()),
            );
          } else {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
            );
          }
        }
      });

    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 80.h,
            ),
            Expanded(
              flex: 5,
              child: Center(
                child: AnimatedOpacity(
                  opacity: _opacity,
                  duration: const Duration(seconds: 1),
                  child: Image.asset(
                    'assets/images/splash_icon.png',
                    fit: BoxFit.contain,
                    width: 350.w,
                    height: 350.h,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  RotationTransition(
                    turns: _controller,
                    child: Image.asset(
                      'assets/images/Loading_icon.png',
                      width: 50.w,
                      height: 50.h,
                    ),
                  ),
                  SizedBox(height: 70.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
