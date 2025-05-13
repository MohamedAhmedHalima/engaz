import 'package:engaz/features/home/cubits/get_all_category/getallcategory_cubit.dart';
import 'package:engaz/features/home/widgets/Categories.dart';
import 'package:engaz/features/home/widgets/Discounts.dart';
import 'package:engaz/features/home/widgets/Offers.dart';
import 'package:engaz/features/home/widgets/Trademarks.dart';
import 'package:engaz/features/home/widgets/abbreviation.dart';
import 'package:engaz/features/home/widgets/app_bar.dart';
import 'package:engaz/features/home/widgets/best%20seller.dart';
import 'package:engaz/features/home/widgets/custome_search_bar.dart';
import 'package:engaz/features/home/widgets/custome_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'drawer_screen.dart';
import 'main_export.dart';

class MainHome extends StatelessWidget {
  const MainHome({super.key});

  static const String routeName = "MainHome";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetallcategoryCubit(),
      child: Scaffold(
        backgroundColor: Colors.white,
        drawer: const CustomDrawer(),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomeAppBar(),
                CustomeSearchBar(),
                SizedBox(height: 20.h),
                CustomeSlider(),
                SizedBox(height: 20.h),
                Abbreviation(),
                SizedBox(height: 20.h),
                OffersRow(),
                SizedBox(height: 20.h),
                Categories(), // The updated Categories widget
                SizedBox(height: 30.h),
                Trademarks(),
                SizedBox(height: 30.h),
                BestSeller(),
                // SizedBox(height: 30.h),
                // Discounts(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
