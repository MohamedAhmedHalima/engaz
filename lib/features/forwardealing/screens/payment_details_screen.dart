import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../home/screens/drawer_screen.dart';
import '../../home/widgets/app_bar.dart';
import '../../home/widgets/custome_search_bar.dart';
import '../widgets/card_item_for_operation_detials.dart';

class PaymentDetailsScreen extends StatelessWidget {
  static const String routeName = "PaymentDetailsScreen";
  const PaymentDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const CustomDrawer(),
      body: SafeArea(
        child: Column(
          children: [
            CustomeAppBar(),
            CustomeSearchBar(),
            SizedBox(height: 20.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
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
                    "تفاصيل السداد",
                    style: GoogleFonts.cairo(
                      textStyle: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                        color: const Color(0XFF94CF29),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: ListView.builder(
                  itemCount: 7, // Number of items in the list
                  itemBuilder: (context, index) {
                    return const Padding(
                      padding: EdgeInsets.only(
                          bottom: 15.0), // Spacing between items
                      child: CardItemForOperationDetials(),
                    );
                  },
                ),
              ),
            ),
            Text(
              "*ملحوظة: التأخير عن السداد يعرضك للغرامات",
              style: GoogleFonts.cairo(
                  textStyle: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0XFFD42828))),
            )
          ],
        ),
      ),
    );
  }
}
