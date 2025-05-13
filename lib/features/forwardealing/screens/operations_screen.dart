import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../home/screens/drawer_screen.dart';
import '../../home/widgets/app_bar.dart';
import '../../home/widgets/custome_search_bar.dart';
import '../widgets/operations_amount.dart';
import '../widgets/operations_card_item.dart';

class OperationsScreen extends StatelessWidget {
  static const String routeName = "OperationsScreen";
  const OperationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const CustomDrawer(),
      body: SafeArea(
        child: Column(
          children: [
            CustomeAppBar(),
            CustomeSearchBar(),
            SizedBox(height: 20.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Align(
                alignment: Alignment.topRight,
                child: Text(
                  "متابعة المعاملات الاجلة",
                  style: GoogleFonts.cairo(
                    textStyle: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0XFF121212),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30.h),
            OperationsAmount(),
            SizedBox(height: 30.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Align(
                alignment: Alignment.topRight,
                child: Text(
                  "المعاملات ",
                  style: GoogleFonts.cairo(
                    textStyle: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        color: const Color(0XFF121212)),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: ListView.builder(
                  itemCount: 5, // Number of items to display
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          bottom: 15), // Space between items
                      child: OperationsCardItem(),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
