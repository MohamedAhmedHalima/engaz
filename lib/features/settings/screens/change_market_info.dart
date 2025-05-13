import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../home/screens/drawer_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../home/widgets/app_bar.dart';
import '../widgets/change_market_location.dart';
import '../widgets/cutome_text_field.dart';

class ChangeMarketInfo extends StatelessWidget {
  static const String routeName = "ChangeMarketInfo";

  final TextEditingController marketName = TextEditingController();

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
                      "تعديل بيانات الماركت",
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
                labelText: "اسم الماركت",
                controller: marketName,
              ),
              SizedBox(
                height: 40.h,
              ),
              SizedBox(
                height: 300.h,
                width: 343.w,
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: MapSample(),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40.h,
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
