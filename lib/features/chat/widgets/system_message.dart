import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SystemMessage extends StatelessWidget {
  const SystemMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: 285.w,
              constraints: BoxConstraints(
                minHeight: 50.h, // Initial minimum height
              ),
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0XFF7A7A7A), width: 0.25),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                  // topRight: Radius.circular(10),
                ),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(
                    10.0), // Padding to prevent text from sticking to edges
                child: Text(
                  "لا مشكلة , عنوان المنزل هو  الحى العاشر مدينة نصر",
                  style: GoogleFonts.cairo(
                    textStyle: TextStyle(
                        color: const Color(0XFF7A7A7A),
                        fontSize: 16.sp,
                        fontWeight:
                            FontWeight.w400), // Optional: change the text style
                  ),
                ),
              ),
            ),
            Text(
              "08:16 AM",
              style: GoogleFonts.cairo(
                  textStyle: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0XFF7A7A7A))),
            ),
          ],
        ),
      ],
    );
  }
}
