import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomeSearchBarInChat extends StatelessWidget {
  const CustomeSearchBarInChat({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 60.h, // Responsive height
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "ابحث هنا ",
                  hintStyle: GoogleFonts.cairo(
                    textStyle: TextStyle(
                      fontSize: 14.sp, // Responsive font size
                      fontWeight: FontWeight.w400,
                      color: const Color(0XFFB9B6B6),
                    ),
                  ),
                  prefixIcon: const Image(
                      image: AssetImage("assets/images/search-icon.png")),
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(8.r), // Responsive radius
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide:
                        const BorderSide(color: Colors.grey, width: 0.25),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide:
                        const BorderSide(color: Colors.grey, width: 0.25),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 8
                          .h), // Adjust content padding for different screen sizes
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
