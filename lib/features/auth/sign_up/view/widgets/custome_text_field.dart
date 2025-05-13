import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFieldWithLabel extends StatefulWidget {
  final String labelText;
  final TextEditingController controller;
  final bool isPassword;

  const CustomTextFieldWithLabel({
    Key? key,
    required this.labelText,
    required this.controller,
    this.isPassword = false,
  }) : super(key: key);

  @override
  _CustomTextFieldWithLabelState createState() =>
      _CustomTextFieldWithLabelState();
}

class _CustomTextFieldWithLabelState extends State<CustomTextFieldWithLabel> {
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:   EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.labelText,
            style: GoogleFonts.cairo(
              textStyle: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(height: 10.h),
          SizedBox(
            height: 43.h,
            width: 343.w,
            child: TextField(
              controller: widget.controller,
              obscureText: widget.isPassword ? _isObscured : false,
              decoration: InputDecoration(
                contentPadding:
                EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                suffixIcon: widget.isPassword
                    ? IconButton(
                  icon: Icon(
                    _isObscured ? Icons.visibility : Icons.visibility_off,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      _isObscured = !_isObscured;
                    });
                  },
                )
                    : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
