import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../cubits/get_all_category/getallcategory_cubit.dart';
import '../cubits/get_home_offer/cubit/get_home_offer_cubit.dart';
import 'offer_product.dart';
import 'offers_card.dart';

class OffersRow extends StatelessWidget {
  const OffersRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Text(
              "العروض",
              style: GoogleFonts.cairo(
                  textStyle:
                      TextStyle(fontWeight: FontWeight.w500, fontSize: 18.sp)),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          BlocProvider(
            create: (context) => HomeOfferCubit()..getHomeOffer(),
            child: BlocConsumer<HomeOfferCubit, HomeOfferState>(
              listener: (context, state) async {
                if (state is HomeOfferError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.message ?? "حدث خطأ")),
                  );
                }
              },
              builder: (context, state) {


                if (state is HomeOfferSuccess) {
                  final offerModel = state.offerModel.data!.data;
                  if (offerModel!.isEmpty) {
                    return Column(
                      children: [

                        Center(
                          child: Text(
                            "لا يوجد عروض ",
                            style: GoogleFonts.cairo(fontSize: 14.sp),
                          ),
                        ),
                      ],
                    );
                  }


                return SizedBox(
                    height: 100.h, // Adjust height as needed to fit items
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.offerModel.data!.data!.length,
                      itemBuilder: (context, index) {
                        return   InkWell(
                          onTap: (){

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => OfferProduct(titleName: 'العروض', getProductesEndpoint: "products?offer_id=${state.offerModel.data!.data![index].id}"),
                              ),
                            );
                          },
                          child: OffersCard(offerData: state.offerModel.data!.data![index]),
                        );
                      },
                    ),
                  );
                }else{
                  return Column(
                    children: [
                      SizedBox(height: 20.h),
                      const Center(child: CircularProgressIndicator()),
                    ],
                  );
                }
                },
            ),
          )
          ,
        ],
      ),
    );
  }
}
