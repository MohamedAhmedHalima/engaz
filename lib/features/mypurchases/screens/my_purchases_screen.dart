import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../home/screens/drawer_screen.dart';
import '../../home/widgets/app_bar.dart';
import '../widgets/card_item.dart';
import '../widgets/day_list.dart';
import '../widgets/month_list.dart';

class MyPurchasesScreen extends StatefulWidget {
  static const String routeName = "MyPurchasesScreen";
  const MyPurchasesScreen({super.key});

  @override
  _MyPurchasesScreenState createState() => _MyPurchasesScreenState();
}

class _MyPurchasesScreenState extends State<MyPurchasesScreen> {
  bool showDays = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const CustomDrawer(),
      body: SafeArea(
        child: Column(
          children: [
            CustomeAppBar(),
            SizedBox(height: 10.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "مشترياتى",
                    style: GoogleFonts.cairo(
                      textStyle: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                        color: const Color(0XFF94CF29),
                      ),
                    ),
                  ),
                  IconButton(
                    icon:
                        const Icon(Icons.swap_horiz, color: Color(0XFF94CF29)),
                    onPressed: () {
                      setState(() {
                        showDays = !showDays;
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 40.h),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                itemCount: 10, // Number of HistoryCards to display
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Column(
                      children: [
                        showDays ? const MonthDaysList() : const MonthList(),
                        SizedBox(height: 20.h),
                      ],
                    );
                  }
                  return const Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: HistoryCard(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
