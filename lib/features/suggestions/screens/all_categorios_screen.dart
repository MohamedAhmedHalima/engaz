import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../home/screens/drawer_screen.dart';
import '../../home/widgets/app_bar.dart';
import '../../home/widgets/custome_search_bar.dart';
import '../widgets/categore_card_item.dart';

class AllCategoriosScreen extends StatelessWidget {
  static const String routeName = "AllCategoriosScreen";
  const AllCategoriosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const CustomeAppBar(),
            const CustomeSearchBar(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Align(
                alignment: Alignment.topRight,
                child: Text(
                  " كيف نساعدك ؟",
                  style: GoogleFonts.cairo(
                      textStyle: TextStyle(
                          fontSize: 20.sp, fontWeight: FontWeight.w500)),
                ),
              ),
            ),
            CategoreCardItem(),
          ],
        ),
      ),
    );
  }
}
