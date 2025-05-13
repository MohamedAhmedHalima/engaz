import 'package:engaz/features/home/screens/main_export.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../screens/helping_in_account_screen.dart';
import '../screens/problem_in_order_screen.dart';
import '../screens/suggestion_screen.dart';

class CategoreCardItem extends StatelessWidget {
  const CategoreCardItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HelpingInAccount()),
              );
            },
            child: Container(
              height: 50.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey)),
              child: Row(
                children: [
                  SizedBox(
                    width: 10.w,
                  ),
                  Image.asset("assets/images/help.png"),
                  SizedBox(
                    width: 15.w,
                  ),
                  Text(
                    "مساعدة فى الحساب",
                    style: GoogleFonts.cairo(
                        textStyle: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.w500)),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 25.h,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProblemInOrderScreen()),
              );
            },
            child: Container(
              height: 50.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey)),
              child: Row(
                children: [
                  SizedBox(
                    width: 10.w,
                  ),
                  Image.asset("assets/images/problem_in_order.png"),
                  SizedBox(
                    width: 15.w,
                  ),
                  Text(
                    "مشكلة فى الطلب",
                    style: GoogleFonts.cairo(
                        textStyle: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.w500)),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 25.h,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SuggestionScreen()),
              );
            },
            child: Container(
              height: 50.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey)),
              child: Row(
                children: [
                  SizedBox(
                    width: 10.w,
                  ),
                  Image.asset("assets/images/icons8_idea.png"),
                  SizedBox(
                    width: 15.w,
                  ),
                  Text(
                    "اقتراحات",
                    style: GoogleFonts.cairo(
                        textStyle: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.w500)),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 25.h,
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 90.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey)),
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 10.w,
                      ),
                      Image.asset(
                        "assets/images/fluent_person-support-20-regular (1).png",
                        color: Color(0XFF13A9CA),
                      ),
                      SizedBox(
                        width: 15.w,
                      ),
                      Text(
                        "خدمة العملاء",
                        style: GoogleFonts.cairo(
                            textStyle: TextStyle(
                                fontSize: 14.sp, fontWeight: FontWeight.w500)),
                      )
                    ],
                  ),
                  Text("لاى استفسارات اتصل بنا على رقم 012345678 ",
                      style: GoogleFonts.cairo(
                          textStyle: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0XFFA6A6A6)))),
                  Text("او راسلنا عبر حسابنا على  الفيسبوك ",
                      style: GoogleFonts.cairo(
                          textStyle: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0XFFA6A6A6)))),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
