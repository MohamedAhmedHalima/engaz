import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../home/screens/main_home.dart';

class LastScreen extends StatelessWidget {
  static const String routeName = "LastScreen";

  const LastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text(
          "استرجاع كلمة المرور",
          style: GoogleFonts.cairo(
            textStyle: TextStyle(
              color: const Color(0XFF94CF29),
              fontSize: 24.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        leading: const Icon(
          Icons.arrow_back_ios,
          color: Color(0XFF13A9CA),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            SizedBox(
              height: 40.h,
            ),
            Center(
                child: Image(
              image: const AssetImage(
                  "assets/images/change_password_success_icon.png"),
              height: 102.h,
              width: 102.w,
            )),
            SizedBox(
              height: 30.h,
            ),
            Text(
              "تم تغيير كلمة المرور الخاصة بحسابك بنجاح , الرجاء تسجيل الدخول",
              style: GoogleFonts.cairo(
                textStyle:
                    TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400,
                    color:Color(0XFF121212)),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 70.h,),
            ElevatedButton(

              onPressed: () {
               Navigator.pushNamed(context, MainHome.routeName);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0XFF13A9CA), // Button color
                shape: RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.circular(10.0), // Rounded corners
                ),
                fixedSize: const  Size(343, 50),
              ),
              child: Text(
                " استرجاع كلمة المرور",
                style: GoogleFonts.cairo(fontSize: 20.sp,
                    fontWeight: FontWeight.w400,
                    color: const  Color(0XFFFDFCFC)),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
