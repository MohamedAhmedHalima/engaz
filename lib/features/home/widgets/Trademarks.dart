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
    return BlocProvider(
      create: (context) => GetAllCompanyCubit()..getAllComapny(),
      child: BlocBuilder<GetAllCompanyCubit, GetAllCompanyState>(
        builder: (context, state) {
          if (state is GetAllCompanyLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is GetAllCompanyError) {
            return Center(child: Text(state.message ?? ""));
          } else if (state is GetAllCompanySuccess) {
            final companies = state.getAllCompanyModel.data;
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
                  SizedBox(
                    height: 60,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: companies!.length,
                      separatorBuilder: (_, __) => SizedBox(width: 10.w),
                      itemBuilder: (context, index) {
                        final company = companies[index];
                        return InkWell(
                          onTap: (){

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => OfferProduct(titleName: companies[index].name??"", getProductesEndpoint: "products?company_id=${companies[index].id}"),
                              ),
                            );
                          },
                          child: TradeMarkItem(company: company),
                        ) ;
                      },
                    ),
                  ),
                ],
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
