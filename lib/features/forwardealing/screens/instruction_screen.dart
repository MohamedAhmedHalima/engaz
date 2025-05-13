import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../home/screens/drawer_screen.dart';
import '../../home/widgets/app_bar.dart';
import '../../home/widgets/custome_search_bar.dart';
import '../widgets/instruction_box.dart';
import 'forward_dealing_screen.dart';

class InstructionScreen extends StatelessWidget {
  static const String routeName = "InstructionScreen";
  const InstructionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        drawer: const CustomDrawer(),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(children: [
              CustomeAppBar(),
              CustomeSearchBar(),
              SizedBox(height: 20.h),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Column(
                    children: [
                      Text(
                        "التعامل الاجل",
                        style: GoogleFonts.cairo(
                            textStyle: TextStyle(
                                fontSize: 20.sp, fontWeight: FontWeight.w500)),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        " متطلبات تقديم الطلب",
                        style: GoogleFonts.cairo(
                            textStyle: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: Color(0XFF94CF29))),
                      ),
                    ],
                  ),
                ),
              ),
              InstructionBox(),
              SizedBox(
                height: 70.h,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ForwardDealingScreen()),
                  );
                },
                style: TextButton.styleFrom(
                  fixedSize: const Size(343, 48),
                  foregroundColor: Colors.white,
                  backgroundColor: const Color(0xFF13A9CA),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
                child: Text(
                  ' اريد تقديم طلب',
                  style: GoogleFonts.cairo(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0XFFFDFDFD)),
                ),
              ),
            ]),
          ),
        ));
  }
}
