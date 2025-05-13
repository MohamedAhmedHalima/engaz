import 'package:engaz/features/home/cubits/add_product_to_favorit_list/cubit/add_product_to_favorit_list_cubit.dart';
import 'package:engaz/features/home/models/product_model.dart';
import 'package:engaz/features/home/screens/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:html/parser.dart' show parse;

import '../../cart/cubits/add_to_cart/cubit/add_to_cart_cubit.dart';


class Items extends StatefulWidget {
  final Products product;

  Items({required this.product});

  @override
  State<Items> createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
  bool _isExpanded = false;
  bool _isSelected = false;
  String stripHtmlTags(String htmlString) {
    final document = parse(htmlString);
    return document.body?.text ?? '';
  }
  String? _selectedOption;

  @override
  void initState() {
    super.initState();
    _selectedOption ="unit";
        // "${widget.product.container} = ${widget.product.countUnit}";
  }

  void _toggleImage() {
    setState(() {
      _isSelected = !_isSelected;
    });
  }

  void _toggleExpansion() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddProductToFavoritListCubit(),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      DetailsScreen(product: widget.product)));
        },
        child: SizedBox(
          height: _isExpanded ? 500.h : 262.h,
          width: 230.w,
          child: Card(
            color: Colors.white,
            elevation: 5.0,
            child: Column(
              children: [
                SizedBox(height: 5.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 20.h,
                      width: 56.w,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16),
                            bottomLeft: Radius.circular(16)),
                        color: Color(0XFFF1DBB3),
                      ),
                      child: Center(
                        child: Text(
                          widget.product.discount != null &&
                                  widget.product.discount != null
                              ? "خصم ${widget.product.discount!}%"
                              : "خارج الخصم",
                          style: GoogleFonts.cairo(
                            textStyle: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0XFF121212),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                SizedBox(
                  height: 110,
                  child: Image.network(
                   widget.product.image??"",
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return CircularProgressIndicator();
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return Icon(Icons.error);
                    },
                  ),
                ),
                SizedBox(height: 15.h),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Text(
                        widget.product.name ?? "",
                        style: GoogleFonts.cairo(
                          textStyle: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(0XFF121212),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15.h),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Container(
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: const Color(0XFF13A9CA), width: 1),
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 4, vertical: 5),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    stripHtmlTags(widget.product.description??""),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(fontSize: 16),
                                  )
                                ],
                              ),
                              GestureDetector(
                                onTap: _toggleExpansion,
                                child: const Image(
                                  image: AssetImage(
                                      'assets/images/arrow-circle-down.png'),
                                ),
                              ),
                            ],
                          ),
                          // if (_isExpanded)
                          //   DropdownButton<String>(
                          //     value: _selectedOption,
                          //     underline: const SizedBox(),
                          //     isExpanded: true,
                          //     items: [
                          //       // DropdownMenuItem(
                          //       //   value:
                          //       //       "${widget.product.container} = ${widget.product.countUnit}",
                          //       //   child: Text(
                          //       //     "${widget.product.container} = ${widget.product.countUnit}",
                          //       //     style: GoogleFonts.cairo(fontSize: 10.sp),
                          //       //   ),
                          //       // ),
                          //       DropdownMenuItem(
                          //         value: "قطعه",
                          //         child: Text(
                          //           "قطعه",
                          //           style: GoogleFonts.cairo(fontSize: 10.sp),
                          //         ),
                          //       ),
                          //     ],
                          //     onChanged: (value) {
                          //       setState(() {
                          //         _selectedOption = value!;
                          //         _isExpanded = false;
                          //       });
                          //     },
                          //   ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        " ${_selectedOption == "قطعه" ? widget.product.price : widget.product.price} EGP ",
                        style: GoogleFonts.cairo(
                          textStyle: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(0XFF13A9CA),
                          ),
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          color: Color(0XFF13A9CA),
                        ),
                        child: Text(
                          "المسموح  ${widget.product.limit}",
                          style: GoogleFonts.cairo(
                              textStyle: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white)),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [

                    BlocBuilder<AddProductToCartListCubit,
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
                                      productId: widget.product.id,quantity: 1);
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
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(4),
                                          topLeft: Radius.circular(4),
                                          bottomLeft: Radius.circular(4),
                                          bottomRight: Radius.circular(1),
                                        ),
                                        color: Colors.white,
                                      ),
                                      height: 16.h,
                                      width: 16.w,
                                      child: const Center(
                                        child: Icon(
                                          Icons.add,
                                          size: 15,
                                          color: Color(0xFF13A9CA),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                        );
                      },
                    ),

                    BlocBuilder<AddProductToFavoritListCubit,
                        AddProductToFavoritListState>(
                      builder: (context, state) {
                        return GestureDetector(
                          onTap: () {
                            // print(widget.product.sId);
                            _toggleImage();
                            _isSelected?
                            context
                                .read<AddProductToFavoritListCubit>()
                                .addToFavoritList(
                                    productId: widget.product.id):
                            context
                                .read<AddProductToFavoritListCubit>()
                                .removeToFavoritList(
                                    productId: widget.product.id);
                          },
                          child: Image(
                            image: AssetImage(
                              _isSelected
                                  ? "assets/images/heart.png"
                                  : "assets/images/fav.png",
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
