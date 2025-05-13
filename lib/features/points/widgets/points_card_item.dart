import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class PointsCardItem extends StatelessWidget {
  const PointsCardItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        height: 120.h,
        width: 343.w,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 0.5),
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "الاربعاء , 30 اكتوبر",
                style: GoogleFonts.cairo(
                    textStyle: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0XFF323335))),
              ),
              Row(
                children: [
                  Text(
                    "رقم الطلب:",
                    style: GoogleFonts.cairo(
                        textStyle: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(0XFF323335))),
                  ),
                  Text(
                    "4545",
                    style: GoogleFonts.cairo(
                        textStyle: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.w500)),
                  )
                ],
              ),
              Row(
                children: [
                  Text(
                    "تفاصيل الطلب:",
                    style: GoogleFonts.cairo(
                        textStyle: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(0XFF323335))),
                  ),
                  Text(
                    "كرتونة لبن المراعى",
                    style: GoogleFonts.cairo(
                        textStyle: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.w500)),
                  ),
                  Spacer(),
                  Container(
                    height: 37,
                    decoration: const BoxDecoration(color: Color(0XFFB0E2ED)),
                    child: Text(
                      "200- EGP",
                      style: GoogleFonts.cairo(
                          textStyle: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w500,
                              color: const Color(0XFF13A9CA))),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
