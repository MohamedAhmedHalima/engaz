import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../home/screens/drawer_screen.dart';
import '../../home/widgets/app_bar.dart';
import '../widgets/cutome_text_field.dart';

class ChangePasswordScreen extends StatelessWidget {
  static const String routeName = "ChangePasswordScreen";

  final TextEditingController currentPass = TextEditingController();
  final TextEditingController newPass = TextEditingController();
  final TextEditingController confirmPass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const CustomDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomeAppBar(),
              SizedBox(height: 20.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back_ios,
                        color: Color(0XFF13A9CA),
                      ),
                    ),
                    Text(
                      "تغيير كلمة المرور",
                      style: GoogleFonts.cairo(
                        textStyle: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                          color: const Color(0XFF94CF29),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              CustomTextFieldWithLabel(
                labelText: "كلمة المرور الحالية",
                controller: currentPass,
                isPassword: true,
              ),
              CustomTextFieldWithLabel(
                labelText: "كلمة المرور الجديدة",
                controller: newPass,
                isPassword: true,
              ),
              CustomTextFieldWithLabel(
                labelText: "تأكيد كلمة المرور الجديدة",
                controller: confirmPass,
                isPassword: true,
              ),
              SizedBox(
                height: 80.h,
              ),
              SizedBox(
                width: 343,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0XFF13A9CA),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    "حفظ التعديلات",
                    style: GoogleFonts.cairo(
                        textStyle: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.white)),
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
