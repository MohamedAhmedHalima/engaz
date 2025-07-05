import 'package:engaz/features/cart/widgets/pluse_and_minus_puttons.dart';
import 'package:engaz/features/cart/widgets/price_and_discaount.dart';
import 'package:engaz/features/cart/widgets/product_name_and_image_and_delet_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../model/cart_model.dart';
class CardItemInCart extends StatefulWidget {
  final CartItem product;
  const CardItemInCart({super.key,  required this.product});

  @override
  State<CardItemInCart> createState() => _CardItemInCartState();
}

class _CardItemInCartState extends State<CardItemInCart> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        height: 160.h,
        width: 343.w,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                width: 0.5,
                color: Colors.grey,
              )),
          child: Column(
            children: [
              ProductNameAndImageAndDeletIcon(product: widget.product!.product!,),
              SizedBox(
                height: 5.h,
              ),
               PluseAndMinusPuttons(                            limit:  widget.product.product!.limit??0,
                 product: widget.product.product!,isCard: true, quantity:  widget.product.quantity!, unitId:  widget.product.unit!.id!,),
              SizedBox(
                height: 5.h,
              ),
              PriceAndDiscaount(product: widget.product.product!,),
            ],
          ),
        ),
      ),
    );
  }
}
