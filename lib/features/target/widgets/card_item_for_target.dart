import 'package:engaz/features/home/screens/main_export.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardItemForTarget extends StatelessWidget {
  const CardItemForTarget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        height: 94.h,
        width: 344.w,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 0.5),
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                " سبتمبر 2024 ",
                style: GoogleFonts.cairo(
                    textStyle: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0XFF323335))),
              ),
              Row(
                children: [
                  Text(
                    "الهدف: ",
                    style: GoogleFonts.cairo(
                        textStyle: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(0XFF323335))),
                  ),
                  Text(
                    "4545 EGP",
                    style: GoogleFonts.cairo(
                        textStyle: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.w500)),
                  ),
                  const Spacer(),
                  Text(
                    "تم تحقيق الهدف بنجاح",
                    style: GoogleFonts.cairo(
                        textStyle: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color(0XFF94CF29))),
                  )
                ],
              ),
              Row(
                children: [
                  Text(
                    "المبلغ المحقق: ",
                    style: GoogleFonts.cairo(
                        textStyle: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(0XFF323335))),
                  ),
                  Text(
                    "4545 EGP",
                    style: GoogleFonts.cairo(
                        textStyle: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.w500)),
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
