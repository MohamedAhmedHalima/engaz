import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class InstructionBox extends StatelessWidget {
  const InstructionBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.h,
      width: 343.w,
      decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0XFF0C8CE9),
          ),
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset("assets/images/file_icon.png"),
                SizedBox(
                  width: 15.w,
                ),
                Text(
                  "الاوراق المطلوبة",
                  style: GoogleFonts.cairo(
                      fontSize: 14.sp, fontWeight: FontWeight.w500),
                )
              ],
            ),
            Text(
              "• رقم و صور السجل التجارى",
              style: GoogleFonts.cairo(
                  textStyle: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: Color(0XFF7A7A7A))),
            ),
            Text(
              "• رقم و صور البطاقة الضريبية ",
              style: GoogleFonts.cairo(
                  textStyle: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: Color(0XFF7A7A7A))),
            ),
            Text(
              "• مع العلم ان فترة السداد تكون خلال 60 يوما من الطلب",
              style: GoogleFonts.cairo(
                  textStyle: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: Color(0XFF7A7A7A))),
            ),
          ],
        ),
      ),
    );
  }
}
