import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../home/screens/drawer_screen.dart';
import '../../home/widgets/app_bar.dart';
import '../../home/widgets/custome_search_bar.dart';

class NotificationsScreen extends StatelessWidget {
  static const String routeName = "NotificationsScreen";
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const CustomeAppBar(),
               CustomeSearchBar(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Align(
                alignment: Alignment.topRight,
                child: Text(
                  "الإشعارات",
                  style: GoogleFonts.cairo(
                    textStyle: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: 20,
                separatorBuilder: (context, index) => const Divider(
                  thickness: 1,
                  color: Color(0xFFE0E0E0), // Light gray color for separator
                ),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      "إشعار رقم ${index + 1}",
                      style: GoogleFonts.cairo(
                        textStyle: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF13A9CA),
                        ),
                      ),
                      textAlign: TextAlign.right, // Align text to the right
                    ),
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
