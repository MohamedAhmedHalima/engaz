import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatCardItem extends StatelessWidget {
  final String? imagePath;
  final String? name;
  final String? message;
  final String? time;

  const ChatCardItem({
    super.key,
    this.imagePath,
    this.name,
    this.message,
    this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (imagePath != null)
            CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage(imagePath!),
            ),
          if (imagePath != null) SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (name != null)
                  Text(
                    name!,
                    style: GoogleFonts.cairo(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                if (name != null) SizedBox(height: 5.h),
                Row(
                  children: [
                    if (message != null)
                      Expanded(
                        child: Text(
                          message!,
                          style: GoogleFonts.cairo(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color(0XFF7A7A7A),
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    if (time != null) SizedBox(width: 10.w),
                    if (time != null)
                      Text(
                        time!,
                        style: GoogleFonts.cairo(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
