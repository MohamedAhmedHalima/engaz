import 'package:engaz/features/auth/login/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../auth/sign_up/view/screens/sign_up_screen.dart';

class SecondOnBoardingScreen extends StatelessWidget {
  static const String routeName = "SecondOnBoardingScreen";

  const SecondOnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 50.h,
          ),
          const Image(
            image: AssetImage("assets/images/on_boarding_2.png"),
            height: 350,
            width: 370,
          ),
          SizedBox(
            height: 40.h,
          ),
          Text(
            "ابدأ معنا الآن",
            style: GoogleFonts.cairo(
              // Apply Cairo font
              textStyle: TextStyle(
                color: Colors.black,
                fontSize: 18.sp, // Use screen-responsive font size
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'تطبيق "اوردرك" هو حل متكامل يربط بين تجار التجزئة، تجار الجملة، وأصحاب المحلات الصغيرة والموردين بكل سهولة وسلاسة. يهدف التطبيق إلى توفير مجموعة واسعة من المنتجات من موردين متنوعين تشمل فئات البقالة، العطارة، التنظيف وغيرها، مع إمكانية استعراض المنتجات وتفاصيلها، وإتمام الطلبات والدفع بشكل سلس وآمن.',
              textAlign: TextAlign.center, // Center align the text
              style: GoogleFonts.cairo(
                // Apply Cairo font
                textStyle: TextStyle(
                  color: const Color(0XFFB9B6B6),
                  fontSize: 14.sp, // Use screen-responsive font size
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: const Color(0XFF13A9CA),
                      shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(3),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                    ),
                    child: Text(
                      "تسجيل الدخول",
                      style: GoogleFonts.cairo(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10.w), // Add spacing between the buttons
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpScreen()),
                      );
                    },
                    style: TextButton.styleFrom(
                      shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(3),
                      ),
                      side: const BorderSide(color: Color(0XFF13A9CA)),
                      backgroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                    ),
                    child: Text(
                      "انشاء حساب",
                      style: GoogleFonts.cairo(
                        textStyle: TextStyle(
                          color: const Color(0XFF13A9CA),
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          // Text(
          //   "المتابعة كضيف",
          //   style: GoogleFonts.cairo(
          //     textStyle: const TextStyle(
          //       color: Color(0XFF94CF29),
          //       fontSize: 18,
          //       fontWeight: FontWeight.w400,
          //       decoration: TextDecoration.underline,
          //       decorationColor: Color(0xFF94CF29),
          //     ),
          //   ),
          // )
        ]),
      ),
    );
  }
}
