import 'package:engaz/features/home/models/home_offer_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class OffersCard extends StatelessWidget {
  final  OfferModel offerData;
  const OffersCard({super.key,required this.offerData});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 149.w,
      child: Card(
        color: const Color(0XFFB0E2ED),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10.h,
              ),
              Container(
                height: 18.h,
                width: 46.w,
                color: Colors.white,
                child: Align(
                  alignment: Alignment.topRight,
                  child: Center(
                    child: Text(
                      "منتجات",
                      style: GoogleFonts.cairo(
                          textStyle: TextStyle(
                              fontSize: 10.sp, fontWeight: FontWeight.w500)),
                    ),
                  ),
                ),
              ),
              Text(
                offerData.name??"",
                style: GoogleFonts.cairo(
                    textStyle: TextStyle(
                        fontSize: 12.sp, fontWeight: FontWeight.w400)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
