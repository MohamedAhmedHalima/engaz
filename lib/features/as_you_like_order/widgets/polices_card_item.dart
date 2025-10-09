import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class PolicesCardItem extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final String limit;
  final Color ?border;
  // final String featuresTitle;
  // final List<String> features;

  const PolicesCardItem({
    super.key,
    required this.imagePath,
    required this.title,
    required this.limit,
    required this.description,
      this.border,
    // required this.featuresTitle,
    // required this.features,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.symmetric(horizontal: 20.w,vertical:10.h)  ,
      child:Container(
        // height: 210.h,
        // width: 343.w,
        decoration: BoxDecoration(
          border: Border.all(
            color:  border?? Color(0XFF13A9CA) ,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(imagePath),
                  SizedBox(width: 15.w),
                  Text(
                    title,
                    style: GoogleFonts.cairo(
                      textStyle: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Text(
                description,
                style: GoogleFonts.cairo(
                  textStyle: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  color: const Color(0XFFB9B6B6),
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                " $limitالحد الادني للفتوره:",
                style: GoogleFonts.cairo(
                  textStyle: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  color: const Color(0XFFB9B6B6),
                ),
              ),
              // Align(
              //   alignment: Alignment.topRight,
              //   child: Text(
              //     featuresTitle,
              //     style: GoogleFonts.cairo(
              //       textStyle: TextStyle(
              //         fontSize: 12.sp,
              //         fontWeight: FontWeight.w500,
              //         color: const Color(0XFF94CF29),
              //       ),
              //     ),
              //   ),
              // ),
              // ...features.map(
              //   (feature) => Align(
              //     alignment: Alignment.topRight,
              //     child: Text(
              //       feature,
              //       style: GoogleFonts.cairo(
              //         textStyle: TextStyle(
              //           fontSize: 12.sp,
              //           fontWeight: FontWeight.w400,
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ) , );
  }
}
