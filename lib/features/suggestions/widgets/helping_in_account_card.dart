import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class HelpingInAccountCard extends StatelessWidget {
  const HelpingInAccountCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
      child: Column(
        children: [
          Row(
            children: [
              Card(
                elevation: 5,
                color: Colors.white,
                child: SizedBox(
                  height: 120.h,
                  width: 163.w,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: Column(
                      children: [
                        Image.asset("assets/images/change_name_icon.png"),
                        const Spacer(),
                        Text(
                          "تغيير اسم الحساب",
                          style: GoogleFonts.cairo(
                              textStyle: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500)),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0XFF94CF29)),
                            child: const Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                elevation: 5,
                color: Colors.white,
                child: SizedBox(
                  height: 120.h,
                  width: 163.w,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: Column(
                      children: [
                        Image.asset("assets/images/mobile_icon.png"),
                        const Spacer(),
                        Text(
                          "تغيير رقم الهاتف",
                          style: GoogleFonts.cairo(
                              textStyle: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500)),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0XFF94CF29)),
                            child: const Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            children: [
              Card(
                elevation: 5,
                color: Colors.white,
                child: SizedBox(
                  height: 120.h,
                  width: 163.w,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: Column(
                      children: [
                        Image.asset("assets/images/location22.png"),
                        const Spacer(),
                        Text(
                          " تغيير العنوان ",
                          style: GoogleFonts.cairo(
                              textStyle: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500)),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0XFF94CF29)),
                            child: const Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                elevation: 5,
                color: Colors.white,
                child: SizedBox(
                  height: 120.h,
                  width: 163.w,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: Column(
                      children: [
                        Image.asset("assets/images/Vector555.png"),
                        const Spacer(),
                        Text(
                          "مشكلة فى بيانات الحساب",
                          style: GoogleFonts.cairo(
                              textStyle: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500)),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0XFF94CF29)),
                            child: const Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            children: [
              Card(
                elevation: 5,
                color: Colors.white,
                child: SizedBox(
                  height: 120.h,
                  width: 163.w,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/images/Delete 2.png",
                          color: const Color(0XFF13A9CA),
                        ),
                        const Spacer(),
                        Text(
                          " حذف الحساب ",
                          style: GoogleFonts.cairo(
                              textStyle: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500)),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0XFF94CF29)),
                            child: const Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                elevation: 5,
                color: Colors.white,
                child: SizedBox(
                  height: 120.h,
                  width: 163.w,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: Column(
                      children: [
                        Image.asset("assets/images/dott1.png"),
                        const Spacer(),
                        Text(
                          "مشكلة اخرى",
                          style: GoogleFonts.cairo(
                              textStyle: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500)),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0XFF94CF29)),
                            child: const Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
