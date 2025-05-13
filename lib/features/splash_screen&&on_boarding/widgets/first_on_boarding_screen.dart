import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class FirstOnBoardingScreen extends StatelessWidget {
  const FirstOnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 80.h,
          ),
          const Image(
            image: AssetImage("assets/images/on_boarding_1.png"),
            height: 350,
            width: 370,
          ),
          SizedBox(
            height: 40.h,
          ),
          Text(
            "تسليم سريع وموثوق",
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
          Text(
            'يوفر تطبيق "اوردرك" نظام توصيل متكامل وفعال لتسهيل عمليات التسليم وضمان وصول المنتجات إلى العملاء بسرعة وأمان. '
            'صُمم نظام التوصيل ليكون بسيطًا وفعالًا، حيث يقدم مجموعة من الخصائص التي تساعد على تحسين تجربة المستخدمين وضمان تسليم الطلبات في الوقت المحدد.',
            textAlign: TextAlign.center, // Center align the text
            style: GoogleFonts.cairo(
              // Apply Cairo font
              textStyle: TextStyle(
                color: const Color(0XFFB9B6B6),
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
