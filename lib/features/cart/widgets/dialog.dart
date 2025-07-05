import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../cubits/add_to_cart/cubit/add_to_cart_cubit.dart';
Future<void> showCustomAlertDialogInCart(BuildContext context) async {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: SizedBox(
          height: 257,
          width: 343,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text('مسح جميع المنتجات',
                      style: GoogleFonts.cairo(
                          textStyle: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                      ))),
                ),
                SizedBox(height: 16.h),
                const Center(
                    child: Image(
                        image: AssetImage("assets/images/dialog_image.png"))),
                Center(
                  child: Text(
                    'هل انت متأكد انك تريد مسح جميع المنتجات فى عربة التسوق ؟',
                    style: GoogleFonts.cairo(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: const Color(0XFF7A7A7A)),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: const Color(0xFF13A9CA),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                        ),
                        child: Text(
                          'الغاء الامر',
                          style: GoogleFonts.cairo(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500,
                              color: const Color(0XFFFDFDFD)),
                        ),
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          BlocProvider.of<AddProductToCartListCubit>(context).removeALLCartList();
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: const Color(0xFFD42828),
                          backgroundColor: Colors.white,
                          side: const BorderSide(
                              color: Color(0xFFD42828), width: 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                        ),
                        child: Text(
                          'مسح الكل',
                          style: GoogleFonts.cairo(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFFD42828)),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
