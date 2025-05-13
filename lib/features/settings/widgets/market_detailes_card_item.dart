import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/network/shared_preferences.dart';
import '../screens/change_market_info.dart';
class MarketDetailesCardItem extends StatelessWidget {
  const MarketDetailesCardItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 5.0,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey, width: 0.5),
        ),
        height: 114.h,
        width: 343.w,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset(
                    "assets/images/market_icon.png",
                    color: const Color(0XFF13A9CA),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    "بيانات الماركت",
                    style: GoogleFonts.cairo(
                        textStyle: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color(0XFF94CF29))),
                  ),
                  const Spacer(),
                  // GestureDetector(
                  //   onTap: () {
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: (context) => ChangeMarketInfo()),
                  //     );
                  //   },
                  //   child: Text(
                  //     "تعديل",
                  //     style: GoogleFonts.cairo(
                  //       textStyle: TextStyle(
                  //         fontSize: 14.sp,
                  //         fontWeight: FontWeight.w500,
                  //         color: const Color(0XFF13A9CA),
                  //         decoration: TextDecoration.underline,
                  //         decorationColor: const Color(0XFF13A9CA),
                  //         decorationThickness: 2.0,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
              SizedBox(
                height: 3.h,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "الاسم",
                      style: GoogleFonts.cairo(
                          textStyle: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: const Color(0XFF7A7A7A))),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      SharedPreferencesHelper.userModel!.marketName ??"",
                      style: GoogleFonts.cairo(
                          textStyle: TextStyle(
                              fontSize: 14.sp, fontWeight: FontWeight.w500)),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 8.h,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "العنوان",
                      style: GoogleFonts.cairo(
                          textStyle: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: const Color(0XFF7A7A7A))),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      SharedPreferencesHelper.userModel!.county!.nameAr ??"",
                      style: GoogleFonts.cairo(
                          textStyle: TextStyle(
                              fontSize: 14.sp, fontWeight: FontWeight.w500)),
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
