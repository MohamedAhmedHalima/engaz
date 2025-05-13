import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class MessageInput extends StatelessWidget {
  final VoidCallback onSend;
  final VoidCallback onGallerySelect;
  final TextEditingController controller;

  const MessageInput({
    super.key,
    required this.onSend,
    required this.onGallerySelect,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.h,
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                hintText: 'اكتب رسالة...',
                hintStyle: GoogleFonts.cairo(
                  textStyle: TextStyle(
                    fontSize: 14.sp,
                    color: const Color(0XFF7A7A7A),
                  ),
                ),
                border: InputBorder.none,
              ),
            ),
          ),
          GestureDetector(
            onTap: onGallerySelect,
            child: Image.asset(
              "assets/images/callary_2.png",
              color: const Color(0XFF7A7A7A),
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 5),
            height: 32.h,
            width: 32.w,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Color(0XFF94CF29)),
            child: Center(
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  size: 13,
                  color: Colors.white,
                ),
                onPressed: onSend,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
