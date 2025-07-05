import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../cart/cubits/get_cart_amount/get_cart_amount_cubit.dart';
import '../../home/cubits/add_product_to_favorit_list/cubit/add_product_to_favorit_list_cubit.dart';
Future<void> showCustomAlertOfferDialog(BuildContext context,{  String? name,  String ?description,  String ? img,}) async {
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
                  child: Text(name??"",
                      style: GoogleFonts.cairo(
                          textStyle: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                          ))),
                ),
                SizedBox(height: 16.h),
                Expanded(child: Center(
                    child:img!=null?Image(
                        image:NetworkImage(img) ):Image(
                        image:AssetImage("assets/images/dialog_image.png")))),
                Center(
                  child: Text(
                    description??"",
                    style: GoogleFonts.cairo(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: const Color(0XFF7A7A7A)),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        BlocProvider.of<GetAmountCubit>(context).getCartAmount();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("تم اضافه المنتج   بنجاح!", style: TextStyle(color: Colors.white)),
                            duration: Duration(seconds: 2),
                            behavior: SnackBarBehavior.floating,             // makes it float above content
                            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            backgroundColor: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),

                          ),
                        );

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
                        'تم',
                        style: GoogleFonts.cairo(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color(0XFFFDFDFD)),
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
