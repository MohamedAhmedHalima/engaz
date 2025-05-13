import 'package:engaz/features/home/widgets/item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:engaz/features/home/cubits/get_productes/cubit/get_products_cubit.dart'; // Import the cubit

class Discounts extends StatelessWidget {
  const Discounts({super.key});

  @override
  Widget build(BuildContext context) {
    final sortBy = 'highestDiscount'; // القيمة التي تُرسل
    print('Sort By in UI: $sortBy'); // طباعة القيمة للتأكد

    return BlocProvider(
      create: (context) => GetProductsCubit()..getProduct(),
      child: BlocBuilder<GetProductsCubit, GetProductsState>(
        builder: (context, state) {
          if (state is GetProductsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is GetProductsError) {
            return Center(child: Text(state.message ?? ""));
          } else if (state is GetProductsSuccess) {
            final products = state.productModel.data!.products;
            // طباعة أسماء المنتجات للتأكد من الترتيب
            print(
                'Products from API: ${products!.map((p) => p.name).toList()}');

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      "خصومات",
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
                      itemCount: products.length,
                      separatorBuilder: (_, __) => SizedBox(width: 10.w),
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
    );
  }
}
