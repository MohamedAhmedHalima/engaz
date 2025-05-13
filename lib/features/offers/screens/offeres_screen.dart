import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../home/screens/drawer_screen.dart';
import '../../home/widgets/Offers.dart';
import '../../home/widgets/app_bar.dart';
import '../../home/widgets/custome_search_bar.dart';
import '../../home/widgets/custome_slider.dart';
import '../widgets/card_item_for_offeres.dart';

class OfferesScreen extends StatelessWidget {
  static const String routeName = "OfferesScreen";
  const OfferesScreen({super.key});

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
              SizedBox(height: 20.h),
              const CustomeSlider(),
              SizedBox(height: 20.h),
              SizedBox(height: 20.h),
              const OffersRow(),
              SizedBox(height: 20.h),
              const CardItemForOfferes(),
            ],
          ),
        ),
      ),
    );
  }
}
