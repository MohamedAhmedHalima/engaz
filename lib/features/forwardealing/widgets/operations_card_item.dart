import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../screens/payment_details_screen.dart';
class OperationsCardItem extends StatelessWidget {
  const OperationsCardItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343.w,
      height: 205.h,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        border: Border.all(color: Colors.grey, width: .5),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "رقم الفاتورة:",
                  style: GoogleFonts.cairo(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0XFF7A7A7A)),
                ),
                Text(
                  "264554",
                  style: GoogleFonts.cairo(
                      textStyle: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.w500)),
                )
              ],
            ),
            SizedBox(
              height: 5.h,
            ),
            Row(
              children: [
                Text(
                  "تفاصيل الطلب: ",
                  style: GoogleFonts.cairo(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0XFF7A7A7A)),
                ),
                Text(
                  "كرتونة لبن المراعى",
                  style: GoogleFonts.cairo(
                      textStyle: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.w500)),
                )
              ],
            ),
            SizedBox(
              height: 5.h,
            ),
            Row(
              children: [
                Text(
                  "المبلغ الكلى:",
                  style: GoogleFonts.cairo(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0XFF7A7A7A)),
                ),
                Text(
                  "1000 EGP",
                  style: GoogleFonts.cairo(
                      textStyle: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.w500)),
                )
              ],
            ),
            Row(
              children: [
                Text(
                  "تاريخ الاستحقاق:",
                  style: GoogleFonts.cairo(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0XFF7A7A7A)),
                ),
                Text(
                  "3 نوفمبر 2024",
                  style: GoogleFonts.cairo(
                      textStyle: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.w500)),
                ),
                const Spacer(),
                Container(
                  height: 35.h,
                  decoration: BoxDecoration(color: Color(0XFFB0E2ED)),
                  child: Center(
                      child: Text(
                    "1000- EGP",
                    style: GoogleFonts.cairo(
                        textStyle: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color(0XFF13A9CA))),
                  )),
                )
              ],
            ),
            SizedBox(
              height: 5.h,
            ),
            Row(
              children: [
                Text(
                  "تاريخ السداد:",
                  style: GoogleFonts.cairo(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0XFF7A7A7A)),
                ),
                Text(
                  "10ديسمبر 2024",
                  style: GoogleFonts.cairo(
                      textStyle: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.w500)),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PaymentDetailsScreen()),
                  );
                },
                child: Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      "تفاصيل السداد",
                      style: GoogleFonts.cairo(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(0XFF94CF29),
                          decoration: TextDecoration.underline,
                          decorationColor: const Color(0XFF94CF29)),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
