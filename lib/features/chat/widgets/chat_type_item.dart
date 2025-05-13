import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatTypeItem extends StatelessWidget {
  final String image; // Required image
  final String text; // Required text

  const ChatTypeItem({
    super.key,
    required this.image,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(
          color: Colors.grey,
          width: 0.25,
        ),
      ),
      elevation: 2.5,
      child: SizedBox(
        height: 55.h,
        width: 344.w,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Image.asset(image), // Image is now required
              SizedBox(
                width: 20.w,
              ),
              Text(
                text, // Text is now required
                style: GoogleFonts.cairo(
                  textStyle: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
