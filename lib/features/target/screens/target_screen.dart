import 'package:engaz/features/home/screens/main_export.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../home/screens/drawer_screen.dart';
import '../../home/widgets/app_bar.dart';
import '../../home/widgets/custome_search_bar.dart';
import '../widgets/card_item_for_target.dart';
import '../widgets/progress_bar_with_target.dart';

class TargetScreen extends StatefulWidget {
  static const String routeName = "TargetScreen";

  const TargetScreen({super.key});

  @override
  _TargetScreenState createState() => _TargetScreenState();
}

class _TargetScreenState extends State<TargetScreen> {
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
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
              child: Align(
                alignment: Alignment.topRight,
                child: Text(
                  "اهداف العميل",
                  style: GoogleFonts.cairo(
                    textStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            ProgressBarWithTarget(),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
              child: Align(
                alignment: Alignment.topRight,
                child: Text(
                  " الاهداف السابقة",
                  style: GoogleFonts.cairo(
                    textStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 10.h, top: 10),
                    child: const CardItemForTarget(),
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
