import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'offer_product.dart';
import 'trade_mark_item.dart';
import 'package:engaz/features/home/cubits/get_all_company/cubit/get_all_company_cubit.dart'; // Import the cubit

class Trademarks extends StatelessWidget {
  const Trademarks({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Text(
              "الشركات",
              style: GoogleFonts.cairo(
                textStyle: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          SizedBox(height: 20.h),
        BlocProvider(
          create: (context) => GetAllCompanyCubit()..getAllComapny(url:"companies?show_home_page=1"),
          child:CompanyListView( onTap:  (companies){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OfferProduct(titleName: companies.name??"", getProductesEndpoint: "products?company_id=${companies.id}"),
              ),
            );
          }),
        )

        ],
      ),
    );
  }
}
