import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CardItemForOperationDetials extends StatelessWidget {
  const CardItemForOperationDetials({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110.h,
      width: 343.w,
      child: Card(
        color: Colors.white,
        elevation: 3.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Text(
                  "اول موعد للسداد",
                  style: GoogleFonts.cairo(
                      textStyle: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.w400)),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(0XFFDBEFB8),
                      borderRadius: BorderRadius.circular(16)),
                  height: 32.h,
                  width: 70.w,
                  child: Center(
                    child: Text(
                      "تم السداد",
                      style: GoogleFonts.cairo(
                          textStyle: TextStyle(
                              fontSize: 12.sp, fontWeight: FontWeight.w500)),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Text(
                  "10نوفمبر 2024",
                  style: GoogleFonts.cairo(
                      textStyle: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: Color(0XFF7A7A7A))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
