import 'package:engaz/features/settings/screens/update_user_data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../home/screens/drawer_screen.dart';
import '../../home/widgets/app_bar.dart';
import '../../home/widgets/custome_search_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/logout_card_item.dart';
import '../widgets/market_detailes_card_item.dart';
import '../widgets/password_card_item.dart';
import '../widgets/user_details_card_item.dart';
import 'edit_user_info.dart';

class AllSettingsScreen extends StatelessWidget {
  static const String routeName = "AllSettingsScreen";
  const AllSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CustomeAppBar(),
              const CustomeSearchBar(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Row(children: [
                    Text(
                      " اعدادات الحساب",
                      style: GoogleFonts.cairo(
                          textStyle: TextStyle(
                              fontSize: 20.sp, fontWeight: FontWeight.w500)),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => UpdateUserData()),
                        );
                      },
                      child: Text(
                        "تعديل",
                        style: GoogleFonts.cairo(
                          textStyle: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color(0XFF13A9CA),
                            decoration: TextDecoration.underline,
                            decorationColor: const Color(0XFF13A9CA),
                            decorationThickness: 2.0,
                          ),
                        ),
                      ),
                    ),

                  ],),
                ),
              ),
              UserDetailsCardItem(),
              SizedBox(
                height: 20.h,
              ),
              PasswordCardItem(),
              SizedBox(
                height: 20.h,
              ),
              MarketDetailesCardItem(),
              SizedBox(
                height: 20.h,
              ),
              LogoutCardItem(),
            ],
          ),
        ),
      ),
    );
  }
}
