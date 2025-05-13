import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../home/screens/drawer_screen.dart';
import '../../home/widgets/app_bar.dart';
import '../../home/widgets/custome_search_bar.dart';
import '../../home/widgets/custome_slider.dart';
import '../widgets/card_item_for_favorit.dart';
import '../widgets/dialg.dart';

class FavoriteScreen extends StatelessWidget {
  static const String routeName = "FavoriteScreen";
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomeAppBar(),
              // CustomeSearchBar(),
              //SizedBox(height: 20.h),
              //CustomeSlider(),
              SizedBox(height: 20.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "المفضلة",
                      style: GoogleFonts.cairo(
                          textStyle: TextStyle(
                              fontSize: 20.sp, fontWeight: FontWeight.w500)),
                    ),
                    GestureDetector(
                      onTap: () {
                        showCustomAlertDialog(context);
                      },
                      child: Text("مسح الكل",
                          style: GoogleFonts.cairo(
                              textStyle: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color(0XFFD42828),
                            decoration: TextDecoration.underline,
                            decorationColor: const Color(0XFFD42828),
                          ))),
                    ),
                  ],
                ),
              ),
              CardItemForFavorit(),
            ],
          ),
        ),
      ),
    );
  }
}
