import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../model/cart_model.dart';
class PriceAndDiscaount extends StatelessWidget {
  final CartProduct product;
  const PriceAndDiscaount({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("${product.price} EGP"),
        SizedBox(
          width: 10.w,
        ),
        if(product.discount! > 0)
        Container(
          decoration: BoxDecoration(
              color: Color(0XFFDBEFB8),
              borderRadius: BorderRadius.circular(16)),
          height: 20.h,
          child: Text(
            "خصم ${product.discount}%",
            style: GoogleFonts.cairo(
                textStyle:
                    TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w400)),
          ),
        )
      ],
    );
  }
}
