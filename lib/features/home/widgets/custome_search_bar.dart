import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../cart/screens/first_cart_screen.dart';

class CustomeSearchBar extends StatelessWidget {
  const CustomeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 48.h,
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
                  suffixIcon:
                      const ImageIcon(AssetImage("assets/images/gallery.png")),
                  hintText: "ابحث هنا ",
                  hintStyle: GoogleFonts.cairo(
                    textStyle: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0XFFB9B6B6),
                    ),
                  ),
                  prefixIcon: const Image(
                      image: AssetImage("assets/images/search-icon.png")),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
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
                  contentPadding: EdgeInsets.symmetric(vertical: 8.h),
                  filled: true,
                  fillColor: Colors.white, // Background color of the text field
                ),
              ),
            ),
          ),
          SizedBox(
            width: 12.w,
          ),
          InkWell(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => FirstCartScreen()),
              );
            },
            child:  SizedBox(
              height: 48.h,
              width: 56.w,
              child: const Card(
                elevation: 5,
                shadowColor: Colors.grey,
                color: Colors.white,
                child: Image(
                  image: AssetImage("assets/images/bin.png"),
                  height: 20,
                  width: 21,
                ),
              ),
            ),
          )

        ],
      ),
    );
  }
}
