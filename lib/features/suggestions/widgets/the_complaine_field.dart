import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CustomTextFieldWithButton extends StatelessWidget {
  final TextEditingController controller;
  final String buttonText;
  final VoidCallback onButtonPressed;

  const CustomTextFieldWithButton({
    super.key,
    required this.controller,
    required this.buttonText,
    required this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 343.w,
          height: 232.h,
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey, width: 0.25),
          ),
          child: TextField(
            controller: controller,
            maxLines: null, // Allow multi-line input
            expands: true, // Make the TextField fill the container
            textAlign: TextAlign.start,
            style: const TextStyle(fontSize: 16),
            decoration: const InputDecoration(
              border: InputBorder.none, // Remove default border
              contentPadding: EdgeInsets.all(10), // Inner padding
            ),
          ),
        ),
        const SizedBox(height: 40), // Space between the TextField and Button
        SizedBox(
          width: 343, // Match the width of the TextField
          height: 50, // Standard button height
          child: ElevatedButton(
            onPressed: onButtonPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0XFF13A9CA), // Button color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text(
              buttonText,
              style: GoogleFonts.cairo(
                  textStyle: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.white)),
            ),
          ),
        ),
      ],
    );
  }
}
