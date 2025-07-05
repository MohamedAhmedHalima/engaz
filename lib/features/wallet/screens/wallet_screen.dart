import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../home/screens/drawer_screen.dart';
import '../../home/widgets/app_bar.dart';
import '../../home/widgets/custome_search_bar.dart';
import '../widgets/wallet_amount.dart';
import '../widgets/wallet_card_item.dart';

class WalletScreen extends StatelessWidget {
  static const String routName = "WalletScreen";
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const CustomDrawer(),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(children: [
            const CustomeAppBar(),
              CustomeSearchBar(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Align(
                alignment: Alignment.topRight,
                child: Text(
                  "محفظة العميل",
                  style: GoogleFonts.cairo(
                      textStyle: TextStyle(
                          fontSize: 20.sp, fontWeight: FontWeight.w500)),
                ),
              ),
            ),
            const WalletAmount(),
            SizedBox(
              height: 20.h,
            ),
            Align(
              alignment: Alignment.topRight,
              child: Text(
                "المعاملات السابقة",
                style: GoogleFonts.cairo(
                    textStyle: TextStyle(
                        fontSize: 20.sp, fontWeight: FontWeight.w500)),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 5, // Number of items

                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        EdgeInsets.only(bottom: 10.h), // Space between items
                    child: const WalletCardItem(),
                  );
                },
              ),
            ),
          ]),
        ));
  }
}
