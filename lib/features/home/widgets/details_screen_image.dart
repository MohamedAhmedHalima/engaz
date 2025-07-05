import 'package:cached_network_image/cached_network_image.dart';
import 'package:engaz/features/home/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/network/shared.dart';

class DetailsScreenImage extends StatelessWidget {
  final Products product;

  const DetailsScreenImage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4),
      height: 239.h,
      width: 343.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color:Colors.white60 )
      ),
      child: Stack(
        children: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios)),
          if( product.discount != null && product.discount! > 0)
          Positioned(
            top: 10,
            left: 1,
            child: Container(
              height: 19.h,
              decoration: const BoxDecoration(
                color: Color(0XFFDBEFB8),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
              ),
              child: Center(
                child: Text(
                  product.discount != null && product.discount! > 0&&(product.discount_type!=null&& product.discount_type!.contains("percentage"))
                      ? "خصم ${product.discount!}%"
                      : "بدون خصم",
                  style: GoogleFonts.cairo(
                    textStyle: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            // top: 5,
            left: 0,
            right: 0,
            child: SizedBox(
                width: 150.w,
                height: 240.h,
                child: CachedNetworkImage(
                  cacheManager: MyImageCacheManager.instance,
                  imageUrl: product.images!.length > 0
                      ? product.images![0] ?? ""
                      : product.image ?? "",
                  fit: BoxFit.fitHeight,
                  placeholder: (context, url) => Center(
                    child: SizedBox(
                      width: 24.r,
                      height: 24.r,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                )

                // Image.network(
                //   product.images![0],
                //   fit: BoxFit.fitHeight, // ضبط كيفية عرض الصورة
                //   loadingBuilder: (context, child, loadingProgress) {
                //     if (loadingProgress == null) return child;
                //     return Center(
                //       child: CircularProgressIndicator(
                //         value: loadingProgress.expectedTotalBytes != null
                //             ? loadingProgress.cumulativeBytesLoaded /
                //                 loadingProgress.expectedTotalBytes!
                //             : null,
                //       ),
                //     );
                //   },
                //   errorBuilder: (context, error, stackTrace) {
                //     return const Icon(Icons.error);
                //   },
                // ),
                ),
          ),
          Positioned(
            bottom: 20,
            child: Container(
              height: 20.h,
              decoration: const BoxDecoration(
                color: Color(0XFFDBEFB8),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  topLeft: Radius.circular(16),
                ),
              ),
              child: Center(
                child: Text(
                  "مسموح طلب ${product.limit}",
                  style: GoogleFonts.cairo(
                    textStyle: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
