import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/network/shared.dart';
import '../../cart/cubits/add_to_cart/cubit/add_to_cart_cubit.dart';
import '../../home/models/product_model.dart';
import '../cubits/get_cart_amount/get_cart_amount_cubit.dart';
import '../cubits/get_cart_item/get_cart_item_cubit.dart';
import '../model/cart_model.dart';
import 'package:html/parser.dart' show parse;

class ProductNameAndImageAndDeletIcon extends StatelessWidget {
  final Products product;
   const ProductNameAndImageAndDeletIcon({super.key,  required this.product});
  String stripHtmlTags(String htmlString) {
    final document = parse(htmlString);
    return document.body?.text ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.all(4),
          height: 75.h,
          width: 71.w,

          child:   CachedNetworkImage(
            cacheManager: MyImageCacheManager.instance, imageUrl: product.images!.length > 0
                ? product.images![0] ?? ""
                : product.image ?? "",
            height: 75.h,
            width: 71.w,
            placeholder: (context, url) => Center(
              child: SizedBox(
                width: 24.r,
                height: 24.r,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            ),
            errorWidget: (context, url, error) =>
            const Icon(Icons.error),
          ),
        ),

        const Spacer(),
        Column(
          children: [
            Text(
              product.name ?? "",
              style: GoogleFonts.cairo(
                  textStyle:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500)),
            ),
            // Text(
            //   stripHtmlTags(product.description ?? ""),
            //   maxLines: 2,
            //   overflow: TextOverflow.ellipsis,
            //   style: TextStyle(fontSize: 16),
            // )
          ],
        ),
        const Spacer(),

          BlocConsumer<AddProductToCartListCubit, AddProductToCartListState>(
            listener: (context, state) {
          if (state is RemoveProductToCartListSuccess) {
            BlocProvider.of<GetAmountCubit>(context).getCartAmount();
            BlocProvider.of<GetAllCartListCubit>(context).getCartList();
          }
        }, builder: (context, state) {
          return InkWell(
            onTap: () {
              BlocProvider.of<AddProductToCartListCubit>(context).removeToCartList(
                  productId: product.id,);
            },
            child: const Image(image: AssetImage("assets/images/Delete 2.png")),
          );
        }),
        SizedBox(
          width: 10.w,
        )
      ],
    );
  }
}
