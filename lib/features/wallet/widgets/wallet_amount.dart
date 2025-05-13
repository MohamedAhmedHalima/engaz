import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class WalletAmount extends StatelessWidget {
  const WalletAmount({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        height: 115.h,
        width: 343.w,
        decoration: BoxDecoration(
            color: Color(0XFF13A9CA), borderRadius: BorderRadius.circular(8)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "المبلغ المتاح",
              style: GoogleFonts.cairo(
                  textStyle: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.white)),
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Image(
                    image: AssetImage("assets/images/empty-wallet.png")),
                SizedBox(
                  width: 15.w,
                ),
                Text(
                  '4000 EGP',
                  style: GoogleFonts.cairo(
                      textStyle: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.white)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
