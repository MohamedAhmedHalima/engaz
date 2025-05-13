import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../settings/widgets/change_market_location.dart';
import '../../../../settings/widgets/cutome_text_field.dart';

class LocationScreen extends StatelessWidget {
  static const String routeName = "LocationScreen";
  final TextEditingController city = TextEditingController();
  final TextEditingController government = TextEditingController();
  final TextEditingController District = TextEditingController();
  final TextEditingController location = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return  Column(
        children: [
          SizedBox(height: 30.h),
          CustomTextFieldWithLabel(controller: city,labelText: 'المدينه',),
          CustomTextFieldWithLabel(controller: government,labelText: 'المحافظه',),
          CustomTextFieldWithLabel(controller: District,labelText: 'الحي',),
          CustomTextFieldWithLabel(controller: location,labelText: 'العنوان',),
          SizedBox(height: 60.h),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0XFF13A9CA), // Button color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0), // Rounded corners
              ),
              fixedSize: const Size(343, 50),
            ),
            child: Text(
              " إنشاء حساب",
              style: GoogleFonts.cairo(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0XFFFDFCFC)),
            ),
          ),
        ],

    );
  }
}
