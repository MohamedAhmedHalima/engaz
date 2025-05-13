import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
class ReorderButton extends StatelessWidget {
  const ReorderButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      width: 327.w,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF13A9CA),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(
          "إعادة الطلب", // Change text based on state
          style: GoogleFonts.cairo(
              textStyle: const TextStyle(color: Colors.white),
              fontSize: 20.sp,
              fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
