import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../screens/change_password_screen.dart';
class PasswordCardItem extends StatelessWidget {
  const PasswordCardItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      color: Colors.white,
      child: Container(
        width: 343.w,
        height: 50.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey, width: 0.5),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: [
              Image.asset("assets/images/password_icon.png"),
              SizedBox(
                width: 10.w,
              ),
              Text(
                "كلمة المرور",
                style: GoogleFonts.cairo(
                    textStyle: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: const Color(0XFF94CF29))),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ChangePasswordScreen()),
                  );
                },
                child: Text(
                  "تغيير",
                  style: GoogleFonts.cairo(
                    textStyle: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0XFF13A9CA),
                      decoration: TextDecoration.underline,
                      decorationColor: const Color(0XFF13A9CA),
                      decorationThickness: 2.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
