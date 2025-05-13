import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFieldWithLabel extends StatefulWidget {
  final String labelText;
  final TextEditingController controller;
  final bool isPassword;
  final bool isValid;

  const CustomTextFieldWithLabel({
    Key? key,
    required this.labelText,
    required this.controller,
    this.isPassword = false,
    this.isValid = true,
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
      padding:  EdgeInsets.symmetric(horizontal: 0.w, vertical: 0.h),
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
          SizedBox(height: 5.h),
          SizedBox(
            // height: 43.h,
            // width: 343.w,
            child: TextFormField(
              controller: widget.controller,
              validator:widget.isValid? (value) {
                if (value == null || value.isEmpty) {
                  return 'يرجى ملئ الحقل ';
                }
                return null;
              }:null,
              obscureText: widget.isPassword ? _isObscured : false,
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.r, horizontal: 10.r),
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
