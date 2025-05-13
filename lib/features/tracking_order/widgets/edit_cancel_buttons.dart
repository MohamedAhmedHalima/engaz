import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'dialog.dart';

class EditCancelButtons extends StatefulWidget {
  const EditCancelButtons({super.key});

  @override
  _EditCancelButtonsState createState() => _EditCancelButtonsState();
}

class _EditCancelButtonsState extends State<EditCancelButtons> {
  // A variable to track the button text state
  bool _isEditing = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 50.h,
          width: 155.5.w,
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                // Toggle between editing and saving state
                _isEditing = !_isEditing;
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF13A9CA),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              _isEditing
                  ? "حفظ التعديل"
                  : "تعديل الطلب", // Change text based on state
              style: GoogleFonts.cairo(
                  textStyle: const TextStyle(color: Colors.white),
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ),
        SizedBox(
          width: 20.w,
        ),
        SizedBox(
          height: 50.h,
          width: 155.5.w,
          child: ElevatedButton(
            onPressed: () {
              DeleteDialog(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: const BorderSide(color: Color(0XFFD42828)),
              ),
            ),
            child: Text(
              "إلغاء الطلب",
              style: GoogleFonts.cairo(
                textStyle: TextStyle(
                    color: const Color(0XFFD42828),
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
