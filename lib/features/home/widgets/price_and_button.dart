import 'package:engaz/features/home/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../cart/cubits/add_to_cart/cubit/add_to_cart_cubit.dart'; // Import ScreenUtil

class PriceAndButton extends StatelessWidget {
  final Products product;
  const PriceAndButton({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 55.h,
          child:  BlocBuilder<AddProductToCartListCubit,
              AddProductToCartListState>(
            builder: (context, state) {
              return SizedBox(
                height: 40.h,
                width: 170.w,
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: TextButton(
                      onPressed: (){
                        context
                            .read<AddProductToCartListCubit>()
                            .addToCartList(
                            productId: product.id,quantity: 1);
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: const Color(0xFF13A9CA),
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                                  Text(
                                    "اضف إلى عربة التسوق",
                                    style: GoogleFonts.cairo(
                                      textStyle: TextStyle(
                                        fontSize: 15.sp, // Responsive font size
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white,
                                      ),))
                          // Text(
                          //   "اضف إلى عربة التسوق",
                          //   style: GoogleFonts.cairo(
                          //     textStyle: TextStyle(
                          //       fontSize: 10.sp,
                          //       fontWeight: FontWeight.w400,
                          //       color: Colors.white,
                          //     ),
                          //   ),
                          // ),
                          // Container(
                          //   decoration: const BoxDecoration(
                          //     borderRadius: BorderRadius.only(
                          //       topRight: Radius.circular(4),
                          //       topLeft: Radius.circular(4),
                          //       bottomLeft: Radius.circular(4),
                          //       bottomRight: Radius.circular(1),
                          //     ),
                          //     color: Colors.white,
                          //   ),
                          //   height: 16.h,
                          //   width: 16.w,
                          //   child: const Center(
                          //     child: Icon(
                          //       Icons.add,
                          //       size: 15,
                          //       color: Color(0xFF13A9CA),
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    )),
              );
            },
          ),// Responsive height
          // child: GestureDetector(
          //   onTap: () {},
          //   child: Container(
          //     width: 200,
          //     decoration: BoxDecoration(
          //       color: const Color(0xFF13A9CA),
          //       borderRadius:
          //           BorderRadius.circular(10.r), // Responsive border radius
          //     ),
          //     padding: EdgeInsets.symmetric(
          //         vertical: 12.h), // Responsive vertical padding
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: [
          //         Text(
          //           "اضف إلى عربة التسوق",
          //           style: GoogleFonts.cairo(
          //             textStyle: TextStyle(
          //               fontSize: 15.sp, // Responsive font size
          //               fontWeight: FontWeight.w400,
          //               color: Colors.white,
          //             ),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
        ),
      ],
    );
  }
}
