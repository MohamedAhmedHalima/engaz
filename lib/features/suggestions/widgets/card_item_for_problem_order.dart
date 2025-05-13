import 'package:engaz/features/home/screens/main_export.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardItemForProblemOrder extends StatelessWidget {
  const CardItemForProblemOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343.w,
      height: 393.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey, width: 0.25),
      ),
      child: Stack(
        children: [
          Positioned(
              top: 8,
              right: 5,
              child: Container(
                height: 80,
                width: 75,
                decoration: BoxDecoration(
                    color: const Color(0XFFB0E2ED),
                    borderRadius: BorderRadius.circular(4)),
                child: Image.asset("assets/images/two_images.png"),
              )),
          Positioned(
              top: 15,
              right: 90,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'رقم الطلب: ',
                      style: GoogleFonts.cairo(
                        textStyle: TextStyle(
                          color: const Color(0XFF7A7A7A),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      children: [
                        TextSpan(
                          text: '552254',
                          style: GoogleFonts.cairo(
                            textStyle: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'الوقت: ',
                      style: GoogleFonts.cairo(
                        textStyle: TextStyle(
                          color: const Color(0XFF7A7A7A),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      children: [
                        TextSpan(
                          text: 'السبت 26-10-2024 7 مساءا',
                          style: GoogleFonts.cairo(
                            textStyle: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'حالة الطلب:',
                      style: GoogleFonts.cairo(
                        textStyle: TextStyle(
                          color: const Color(0XFF7A7A7A),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      children: [
                        TextSpan(
                          text: '❌  تم الإلغاء',
                          style: GoogleFonts.cairo(
                            textStyle: TextStyle(
                              fontSize: 16.sp,
                              color: Colors.red,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'اجمالى السعر: ',
                      style: GoogleFonts.cairo(
                        textStyle: TextStyle(
                          color: const Color(0XFF7A7A7A),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      children: [
                        TextSpan(
                            text: '1500 EGP',
                            style: GoogleFonts.cairo(
                              textStyle: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            )),
                      ],
                    ),
                  ),
                  Text(
                    "تفاصيل الطلب:",
                    style: GoogleFonts.cairo(
                        textStyle: TextStyle(
                      color: const Color(0XFF7A7A7A),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    )),
                  ),
                  Text(
                    "كرتونة لبن المراعى",
                    style: GoogleFonts.cairo(
                        textStyle: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color(0XFF13A9CA))),
                  ),
                  Text(
                    " (كرتونة=12 علبة , سعر العلبة= 20 EGP, الاجمالى=240 EGP)",
                    style: GoogleFonts.cairo(
                        textStyle: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.w500)),
                  ),
                  Text(
                    "كرتونة لبن المراعى",
                    style: GoogleFonts.cairo(
                        textStyle: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color(0XFF13A9CA))),
                  ),
                  Text(
                    " (كرتونة=12 علبة , سعر العلبة= 20 EGP, الاجمالى=240 EGP)",
                    style: GoogleFonts.cairo(
                        textStyle: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.w500)),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
