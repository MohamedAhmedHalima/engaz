import 'package:engaz/features/home/cubits/get_productes/cubit/get_products_cubit.dart';
import 'package:engaz/features/home/models/product_model.dart';
import 'package:engaz/features/home/widgets/app_bar.dart';
import 'package:engaz/features/home/widgets/details_screen_image.dart';
import 'package:engaz/features/home/widgets/favorite_icon_and_description.dart';
import 'package:engaz/features/home/widgets/item.dart';
import 'package:engaz/features/home/widgets/price_and_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:html/parser.dart' show parse;

import '../../cart/widgets/pluse_and_minus_puttons.dart';
import 'drawer_screen.dart';

class DetailsScreen extends StatefulWidget {
  static const String routName = "DetailsScreen";
  final Products product;
  const DetailsScreen({super.key, required this.product});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  bool _isExpanded = false;
  Unit? _selectedUnit;
  String stripHtmlTags(String htmlString) {
    final document = parse(htmlString);
    return document.body?.text ?? '';
  }

  bool isFirstProduct = true;
  @override
  void initState() {
    super.initState();
    // Default to first available unit, if any
    _selectedUnit = widget.product.units?.isNotEmpty == true
        ? widget.product.units!.first
        : null;
  }

  void _toggleExpansion() => setState(() => _isExpanded = !_isExpanded);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const CustomDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CustomeAppBar(),
              DetailsScreenImage(product: widget.product),
              SizedBox(height: 15.h),
              FavoriteIconAndDescription(product: widget.product),
              SizedBox(height: 15.h),

              // Description & units dropdown
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Container(
                  decoration: BoxDecoration(
                    border:
                        Border.all(color: const Color(0XFF13A9CA), width: 1),
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 4, vertical: 3),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                stripHtmlTags(widget.product.description ?? ""),
                                style: GoogleFonts.cairo(fontSize: 14.sp),
                              ),
                            ),
                            GestureDetector(
                              onTap: _toggleExpansion,
                              child: const Image(
                                image: AssetImage(
                                    'assets/images/arrow-circle-down.png'),
                                width: 24,
                                height: 24,
                              ),
                            ),
                          ],
                        ),
                        if (_isExpanded &&
                            widget.product.units != null &&
                            widget.product.units!.isNotEmpty)
                          DropdownButton<Unit>(
                            value: _selectedUnit,
                            isExpanded: true,
                            underline: const SizedBox(),
                            items: widget.product.units!
                                .map((unit) => DropdownMenuItem<Unit>(
                                      value: unit,
                                      child: Text(
                                        "${unit.unitName} — ${unit.price?.toStringAsFixed(2)} EGP",
                                        style:
                                            GoogleFonts.cairo(fontSize: 10.sp),
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

              // Price display
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white)),
                        ),
                      ),
                  ],
                ),
              ),
              if (_selectedUnit != null &&
                  (_selectedUnit!.is_sellable ?? true)) ...[
                SizedBox(height: 15.h),
                isFirstProduct && widget.product.cartQuantity == 0
                    ? PriceAndButton(
                        onTap: () {
                          if (_selectedUnit!.is_sellable!) {
                            isFirstProduct = false;
                            widget.product.cartQuantity = 1;
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                    "لا يمكن شراء هذه الفئه من هذا المنتج",
                                    style: TextStyle(color: Colors.white)),
                                duration: Duration(seconds: 2),
                                behavior: SnackBarBehavior
                                    .floating, // makes it float above content
                                margin: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                backgroundColor: Colors.red,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            );
                          }
                          setState(() {});
                        },
                        selectedUnitId: _selectedUnit!.id!,
                        product: widget.product)
                    : PluseAndMinusPuttons(
                  limit:  widget.product.limit??0,
                  quantityItem: (quantity) {
                    widget.product.cartQuantity =quantity;

                  },
                        deleteItem: (value) {
                          setState(() {
                            isFirstProduct = value;
                          });
                        },
                        product: widget.product,
                        quantity: widget.product.cartQuantity!,
                        unitId: _selectedUnit!.id!,
                      ),
              ],
              SizedBox(height: 15.h),

              // Similar products
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    "منتجات مشابهة",
                    style: GoogleFonts.cairo(
                        fontSize: 18.sp, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              BlocProvider(
                create: (context) => GetProductsCubit()
                  ..getProduct(getProductesEndpoint:  "products?category_id=${widget.product.category!.id!}" ),
                child: BlocBuilder<GetProductsCubit, GetProductsState>(
                  builder: (context, state) {
                    if (state is GetProductsLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is GetProductsError) {
                      return Center(child: Text(state.message ?? ''));
                    } else if (state is GetProductsSuccess) {
                      final products = state.products;
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: SizedBox(
                          height: 337,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: products!.length,
                            separatorBuilder: (_, __) => SizedBox(width: 10.w),
                            itemBuilder: (context, index) {
                              return Items(product: products[index]);
                            },
                          ),
                        ),
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
