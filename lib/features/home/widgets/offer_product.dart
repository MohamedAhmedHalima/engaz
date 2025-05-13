import 'package:engaz/features/home/screens/main_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../cubits/get_all_company/cubit/get_all_company_cubit.dart';
import '../cubits/get_productes/cubit/get_products_cubit.dart';
import 'custome_search_bar.dart';
import 'item.dart';

class OfferProduct extends StatefulWidget {
  final String titleName;
  final String getProductesEndpoint;
  const OfferProduct({required this.titleName,required this.getProductesEndpoint,Key? key}) : super(key: key);

  @override
  State<OfferProduct> createState() => _OfferProductState();
}

class _OfferProductState extends State<OfferProduct> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          widget.titleName,
          style: GoogleFonts.cairo(
            textStyle: TextStyle(
              color: const Color(0XFF94CF29),
              fontSize: 24.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Color(0XFF13A9CA),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CustomeSearchBar(),
            SizedBox(height: 30.h),
            BlocProvider(
              create: (context) => GetProductsCubit()
                ..getProduct(
                  getProductesEndpoint:  widget.getProductesEndpoint,

                ),
              child: BlocBuilder<GetProductsCubit, GetProductsState>(
                builder: (context, state) {
                  if (state is GetProductsLoading) {
                    return const Center(
                        child: CircularProgressIndicator());
                  } else if (state is GetProductsError) {
                    return Center(child: Text(state.message ?? ""));
                  } else if (state is GetProductsSuccess) {
                    final products = state.productModel.data!.products;
                    return Padding(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              " منتجات متشابها",
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
                            height: 337,
                            width: double.infinity,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: products!.length,
                              separatorBuilder: (_, __) =>
                                  SizedBox(width: 10.w),
                              itemBuilder: (context, index) {
                                final product = products[index];
                                return Items(product: product);
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
            )
          ],
        ),
      ),
    );
  }
}
