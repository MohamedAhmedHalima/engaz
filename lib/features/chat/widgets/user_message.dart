import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class UserMessage extends StatelessWidget {
  const UserMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Column(
          children: [
            Text(
              "محمد عمر ",
              style: GoogleFonts.cairo(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: const Color(0XFF13A9CA)),
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              width: 285.w,
              constraints: BoxConstraints(
                minHeight: 50.h, // Initial minimum height
              ),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                color: Color(0XFF13A9CA),
              ),
              child: Padding(
                padding: const EdgeInsets.all(
                    10.0), // Padding to prevent text from sticking to edges
                child: Text(
                  "لا مشكلة , عنوان المنزل هو  الحى العاشر مدينة نصر",
                  style: GoogleFonts.cairo(
                    textStyle: TextStyle(
                        color: Colors.white,
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
