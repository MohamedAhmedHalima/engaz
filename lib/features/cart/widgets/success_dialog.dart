import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../home/screens/main_home.dart';
Future<void> SuccessDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: SizedBox(
          height: 257,
          width: 343,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text('تم الطلب بنجاح!',
                      style: GoogleFonts.cairo(
                          textStyle: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                      ))),
                ),
                SizedBox(height: 16.h),
                const Center(
                    child: Image(
                        image: AssetImage(
                            "assets/images/change_password_success_icon.png"))),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (_) => MainHome()),
                                (Route<dynamic> route) => false,  // remove all previous routes
                          );
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: const Color(0xFF13A9CA),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                        ),
                        child: Text(
                          'العودة للصفحة الرئيسية',
                          style: GoogleFonts.cairo(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500,
                              color: const Color(0XFFFDFDFD)),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
