import 'package:engaz/features/home/screens/main_export.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../home/screens/drawer_screen.dart';
import '../../home/widgets/app_bar.dart';
import '../../home/widgets/custome_search_bar.dart';
import '../../home/widgets/custome_slider.dart';
import '../widgets/tracking_bar.dart';

class FirstTrackingOrderScreen extends StatefulWidget {
  static const String routeName = "FirstTrackingOrderScreen";

  const FirstTrackingOrderScreen({super.key});

  @override
  State<FirstTrackingOrderScreen> createState() =>
      _FirstTrackingOrderScreenState();
}

class _FirstTrackingOrderScreenState extends State<FirstTrackingOrderScreen> {
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
              SizedBox(height: 20.0.h),
              const CustomeSlider(),
              SizedBox(height: 20.0.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    "متابعة الطلبات",
                    style: GoogleFonts.cairo(
                        fontSize: 20.0, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              SizedBox(height: 15.0.h),
              const TrackingOrderTabs(initialTabIndex: 3),
            ],
          ),
        ),
      ),
    );
  }
}
