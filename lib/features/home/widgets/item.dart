import 'package:cached_network_image/cached_network_image.dart';
import 'package:engaz/features/home/cubits/add_product_to_favorit_list/cubit/add_product_to_favorit_list_cubit.dart';
import 'package:engaz/features/home/models/product_model.dart';
import 'package:engaz/features/home/screens/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:html/parser.dart' show parse;

import '../../../core/network/shared.dart';
import '../../cart/cubits/add_to_cart/cubit/add_to_cart_cubit.dart';
import '../../cart/cubits/get_cart_amount/get_cart_amount_cubit.dart';
import '../../cart/model/cart_model.dart';
import '../../cart/widgets/pluse_and_minus_puttons.dart';
import 'dialog_offer.dart';
import 'offer_product.dart';

class Items extends StatefulWidget {
  final Products product;

  Items({required this.product});

  @override
  State<Items> createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
  bool _isSelected = false;
  bool _isExpanded = false;
  Unit? _selectedUnit;
  bool isFirstProduct = true;

  String stripHtmlTags(String htmlString) {
    final document = parse(htmlString);
    return document.body?.text ?? '';
  }

  @override
  void initState() {
    super.initState();
    _selectedUnit = widget.product.units?.isNotEmpty == true
        ? widget.product.units!.first
        : null;
    _isSelected = widget.product.inFavourites ?? false;
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
      child: AbsorbPointer(
          absorbing: !widget.product.active!,
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          DetailsScreen(product: widget.product)));
            },
            child: SizedBox(
              height: _isExpanded ? 380.h : 262.h,
              width: 230.w,
              child: Card(
                color: widget.product.active! ? Colors.white : Colors.grey[200],
                elevation: 5.0,
                child: Column(
                  children: [
                    SizedBox(height: 5.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (((widget.product.discount != null &&
                            widget.product.discount! > 0) &&( widget.product.discount_type!=null&&  widget.product.discount_type!.contains("percentage"))) ||
                            !widget.product.active!)
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
                                !widget.product.active!
                                    ? "غير متوفر"
                                    : (widget.product.discount != null &&
                                            widget.product.discount != null)
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
                        Spacer(),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => OfferProduct(
                                      titleName: 'منتجات مشابهه',
                                      getProductesEndpoint:
                                          "products?category_id=${widget.product.category!.id}&weight=${widget.product.weight}")),
                            );
                          },
                          child: const Image(
                              image: AssetImage(
                                  "assets/images/refresh-circle.png")),
                        ),
                      ],
                    ),
                    // SizedBox(height: 15.h),
                    Expanded(
                      child: CachedNetworkImage(
                        cacheManager: MyImageCacheManager.instance,   imageUrl: widget.product.images!.length > 0
                            ? widget.product.images![0] ?? ""
                            : widget.product.image ?? "",
                        height: 120.h,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => Center(
                          child: SizedBox(
                            width: 24.r,
                            height: 24.r,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          ),
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      )
                      // Image.network(
                      //   widget.product.images!.length>0?  widget.product.images![0]??"":widget.product.image??"",height: 120.h,
                      //   loadingBuilder: (context, child, loadingProgress) {
                      //     if (loadingProgress == null) return child;
                      //     return Center(child: CircularProgressIndicator(),);
                      //   },
                      //   errorBuilder: (context, error, stackTrace) {
                      //     return Icon(Icons.error);
                      //   },
                      // )
                      ,
                    ),
                    // SizedBox(height: 15.h),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              widget.product.name ?? "",
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.cairo(
                                textStyle: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0XFF121212),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 15.h),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color(0XFF13A9CA), width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(8.r)),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 4.w, vertical: 0.h),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // Row(
                              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //   children: [
                              //     // Row(
                              //     //   children: [
                              //     //     Text(
                              //     //       stripHtmlTags(
                              //     //           widget.product.description ?? ""),
                              //     //       maxLines: 2,
                              //     //       overflow: TextOverflow.ellipsis,
                              //     //       style: TextStyle(fontSize: 16.sp),
                              //     //     )
                              //     //   ],
                              //     // ),
                              //     GestureDetector(
                              //       onTap: _toggleExpansion,
                              //       child: const Image(
                              //         image: AssetImage(
                              //             'assets/images/arrow-circle-down.png'),
                              //       ),
                              //     ),
                              //   ],
                              // ),

                              if (widget.product.units != null &&
                                  widget.product.units!.isNotEmpty)
                                DropdownButton<Unit>(
                                  value: _selectedUnit,
                                  icon: const Image(
                                    image: AssetImage(
                                        'assets/images/arrow-circle-down.png'),
                                  ),
                                  isExpanded: true,
                                  underline: const SizedBox(),
                                  items: widget.product.units!
                                      .map((unit) => DropdownMenuItem<Unit>(
                                            value: unit,
                                            child: Text(
                                              "${unit.unitName} — ${unit.price?.toStringAsFixed(2)} EGP",
                                              style: GoogleFonts.cairo(
                                                  fontSize: 10.sp),
                                            ),
                                          ))
                                      .toList(),
                                  onChanged: (unit) {
                                    setState(() {
                                      _selectedUnit = unit;
                                      // _isExpanded = false;
                                    });
                                  },
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if((widget.product.discount!=null&&widget.product.discount==0) &&(widget.product.discount_type!=null&& widget.product.discount_type!.contains("amount")))...[
                                Text(
                                  "EGP ${_selectedUnit!.price} ",
                                  style: GoogleFonts.cairo(
                                      textStyle: const TextStyle(
                                          fontSize: 15,
                                          decoration: TextDecoration.lineThrough,
                                          color: Color(0XFFB9B6B6),
                                          decorationThickness: 1.2)),
                                ),
                                Text(
                                  _selectedUnit != null
                                      ? "${_selectedUnit!.price_after_discount?.toStringAsFixed(2)} EGP"
                                      : "${widget.product.price_after_discount ?? 0} EGP",
                                  style: GoogleFonts.notoSans(
                                    textStyle: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0XFF13A9CA),
                                    ),
                                  ),
                                )
                              ]else...[
                                Text(
                                  _selectedUnit != null
                                      ? "${_selectedUnit!.price?.toStringAsFixed(2)} EGP"
                                      : "${widget.product.price ?? 0} EGP",
                                  style: GoogleFonts.notoSans(
                                    textStyle: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0XFF13A9CA),
                                    ),
                                  ),
                                )
                              ]

                            ],
                          ),
                          if (widget.product.limit != null)
                            Container(
                              decoration: const BoxDecoration(
                                color: Color(0XFF13A9CA),
                              ),
                              child: Text(
                                "المسموح  ${widget.product.limit}",
                                style: GoogleFonts.cairo(
                                    textStyle: TextStyle(
                                        fontSize: 12.sp,
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
                        if (_selectedUnit != null &&
                            (_selectedUnit!.is_sellable ?? true)) ...[
                          isFirstProduct&& widget.product.cartQuantity==0
                              ? BlocBuilder<AddProductToCartListCubit,
                                  AddProductToCartListState>(
                                  builder: (context, state) {
                                    return SizedBox(
                                      height: 40.h,
                                      width: 170.w,
                                      child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 4.w),
                                          child: TextButton(
                                            onPressed: () {
                                              isFirstProduct = false;
                                              widget.product.cartQuantity=1;
                                              setState(() {});
                                              if (widget
                                                  .product.offers!.isNotEmpty) {
                                                showCustomAlertOfferDialog(
                                                    context,
                                                    name: widget.product
                                                        .offers![0].name,
                                                    description: widget.product
                                                        .offers![0].description,
                                                    img: widget.product
                                                        .offers![0].image);
                                              } else {
                                                BlocProvider.of<GetAmountCubit>(
                                                        context)
                                                    .getCartAmount();
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                        "تم اضافه المنتج   بنجاح!",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white)),
                                                    duration:
                                                        Duration(seconds: 2),
                                                    behavior: SnackBarBehavior
                                                        .floating, // makes it float above content
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 20,
                                                            vertical: 10),
                                                    backgroundColor:
                                                        Colors.green,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                  ),
                                                );
                                              }
                                              context
                                                  .read<
                                                      AddProductToCartListCubit>()
                                                  .addToCartList(
                                                      unitId: _selectedUnit!.id,
                                                      productId:
                                                          widget.product.id,
                                                      quantity: 1);
                                            },
                                            style: TextButton.styleFrom(
                                              backgroundColor:
                                                  const Color(0xFF13A9CA),
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 12.h),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(4.r),
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Text(
                                                  "اضف إلى عربة التسوق",
                                                  style: GoogleFonts.cairo(
                                                    textStyle: TextStyle(
                                                      fontSize: 10.sp,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  decoration:
                                                      const BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topRight:
                                                          Radius.circular(4),
                                                      topLeft:
                                                          Radius.circular(4),
                                                      bottomLeft:
                                                          Radius.circular(4),
                                                      bottomRight:
                                                          Radius.circular(1),
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
                                )
                              : PluseAndMinusPuttons(
                            limit:  widget.product.limit??0,
                                  deleteItem: (value) {
                                    setState(() {
                                      isFirstProduct = value;
                                    });
                                  },
                            quantityItem: (quantity) {
                              widget.product.cartQuantity =quantity;
                              // setState(() {
                              //
                              // });

                            },
                                  product: widget.product,
                                  quantity:  widget.product.cartQuantity!,
                                  unitId: _selectedUnit!.id!,
                                ),
                        ],
                        GestureDetector(
                          onTap: () {
                            // print(widget.product.sId);
                            _toggleImage();
                            _isSelected
                                ? context
                                    .read<AddProductToFavoritListCubit>()
                                    .addToFavoritList(
                                        productId: widget.product.id)
                                : context
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
                        )
                        // BlocBuilder<AddProductToFavoritListCubit,
                        //     AddProductToFavoritListState>(
                        //   builder: (context, state) {
                        //     return
                        //   },
                        // ),
                      ],
                    ),
                    SizedBox(height: 15.h),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
