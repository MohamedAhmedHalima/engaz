import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../home/screens/drawer_screen.dart';
import '../../home/widgets/app_bar.dart';
import '../../home/widgets/custome_search_bar.dart';
import '../../home/widgets/custome_slider.dart';
import '../widgets/card_item.dart';

class ProductsScreen extends StatelessWidget {
  static const String routeName = "ProductsScreen";
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const CustomDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CardItemForSimilar(),
            ],
          ),
        ),
      ),
    );
  }
}
