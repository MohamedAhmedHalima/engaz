import 'package:engaz/features/home/screens/main_export.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../home/screens/drawer_screen.dart';
import '../../home/widgets/app_bar.dart';
import '../widgets/helping_in_account_card.dart';

class HelpingInAccount extends StatelessWidget {
  static const String routeName = "HelpingInAccount";
  const HelpingInAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(children: [
          const CustomeAppBar(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
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
                  "مساعدة فى الحساب",
                  style: GoogleFonts.cairo(
                      textStyle: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                          color: Color(0XFF94CF29))),
                )
              ],
            ),
          ),
          HelpingInAccountCard(),
        ]),
      ),
    );
  }
}
