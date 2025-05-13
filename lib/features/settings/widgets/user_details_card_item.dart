import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/network/shared_preferences.dart';
import '../screens/edit_user_info.dart';
class UserDetailsCardItem extends StatelessWidget {
  const UserDetailsCardItem({super.key});

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
        height: 183.h,
        width: 343.w,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset(
                    "assets/images/Union.png",
                    color: const Color(0XFF13A9CA),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    "بيانات المستخدم",
                    style: GoogleFonts.cairo(
                        textStyle: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color(0XFF94CF29))),
                  ),
                  const Spacer(),
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
                      SharedPreferencesHelper.userModel!.name ??"",
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
                      "رقم الهاتف",
                      style: GoogleFonts.cairo(
                          textStyle: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: const Color(0XFF7A7A7A))),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      SharedPreferencesHelper.userModel!.firstPhone.toString() ??"",
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
                      "رقم هاتف اخر",
                      style: GoogleFonts.cairo(
                          textStyle: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: const Color(0XFF7A7A7A))),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      SharedPreferencesHelper.userModel!.secondPhone.toString() ??"",
                      style: GoogleFonts.cairo(
                          textStyle: TextStyle(
                              fontSize: 14.sp, fontWeight: FontWeight.w500)),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "نوع النشاط",
                      style: GoogleFonts.cairo(
                          textStyle: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: const Color(0XFF7A7A7A))),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      SharedPreferencesHelper.userModel!.activityType.toString() ??"",
                      style: GoogleFonts.cairo(
                          textStyle: TextStyle(
                              fontSize: 14.sp, fontWeight: FontWeight.w500)),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
