import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../home/screens/drawer_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../home/widgets/app_bar.dart';
import '../../home/widgets/custome_search_bar.dart';
import '../widgets/points_amount.dart';
import '../widgets/points_card_item.dart';

class PointsScreen extends StatelessWidget {
  static const String routName = "PointsScreen";
  const PointsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const CustomDrawer(),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(children: [
            const CustomeAppBar(),
            const CustomeSearchBar(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Align(
                alignment: Alignment.topRight,
                child: Text(
                  " النقاط",
                  style: GoogleFonts.cairo(
                      textStyle: TextStyle(
                          fontSize: 20.sp, fontWeight: FontWeight.w500)),
                ),
              ),
            ),
            const PointsAmount(),
            SizedBox(
              height: 20.h,
            ),
            Align(
              alignment: Alignment.topRight,
              child: Text(
                "المعاملات السابقة",
                style: GoogleFonts.cairo(
                    textStyle: TextStyle(
                        fontSize: 20.sp, fontWeight: FontWeight.w500)),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 5, // Number of items

                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        EdgeInsets.only(bottom: 10.h), // Space between items
                    child: const PointsCardItem(),
                  );
                },
              ),
            ),
          ]),
        ));
  }
}
