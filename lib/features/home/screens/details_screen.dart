import 'package:engaz/features/home/cubits/get_productes/cubit/get_products_cubit.dart';
import 'package:engaz/features/home/models/product_model.dart';
import 'package:engaz/features/home/widgets/app_bar.dart';
import 'package:engaz/features/home/widgets/details_screen_image.dart';
import 'package:engaz/features/home/widgets/favorite_icon_and_description.dart';
import 'package:engaz/features/home/widgets/item.dart';
import 'package:engaz/features/home/widgets/price_and_button.dart';
import 'package:engaz/features/home/widgets/see_more_container.dart';
import 'package:engaz/features/home/widgets/similer_product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

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
  bool _isSelected = false;

  String? _selectedOption;

  @override
  void initState() {
    super.initState();
    _selectedOption =
        "${widget.product.limit??""} = ${widget.product.limit}";
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
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const CustomDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            const CustomeAppBar(),
            DetailsScreenImage(
              product: widget.product,
            ),
            SizedBox(
              height: 15.h,
            ),
            FavoriteIconAndDescription(
              product: widget.product,
            ),
            SizedBox(height: 15.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0XFF13A9CA), width: 1),
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
                          Row(
                            children: [Text(widget.product.description??"")],
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
                        // DropdownButton<String>(
                        //   value: _selectedOption,
                        //   underline: const SizedBox(),
                        //   isExpanded: true,
                        //   items: [
                        //     DropdownMenuItem(
                        //       value:
                        //           "${widget.product.limit} = ${widget.product.description}", // Unique value
                        //       child: Text(
                        //         // "${widget.product.container} = ${widget.product.countUnit}",
                        //         "${widget.product.limit} = ${widget.product.description}", // Unique value
                        //         style: GoogleFonts.cairo(fontSize: 10.sp),
                        //       ),
                        //     ),
                        //     DropdownMenuItem(
                        //       value: "قطعه", // Unique value
                        //       child: Text(
                        //         "قطعه",
                        //         style: GoogleFonts.cairo(fontSize: 10.sp),
                        //       ),
                        //     ),
                        //   ],
                        //   onChanged: (value) {
                        //     setState(() {
                        //       _selectedOption = value!;
                        //       _isExpanded = false;
                        //     });
                        //   },
                        // ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    " ${_selectedOption == "قطعه" ? widget.product.price : widget.product.price} EGP ",
                    style: GoogleFonts.notoSans(
                      textStyle: TextStyle(
                        fontSize: 20.sp, //
                        fontWeight: FontWeight.w400,
                        color: const Color(0XFF13A9CA),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            PriceAndButton(
              product: widget.product,
            ),
            SizedBox(
              height: 15.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
                ..getProduct(
                  id: widget.product.category!.id! ,
                ),
              child: BlocBuilder<GetProductsCubit, GetProductsState>(
                builder: (context, state) {
                  if (state is GetProductsLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is GetProductsError) {
                    return Center(child: Text(state.message ?? ""));
                  } else if (state is GetProductsSuccess) {
                    final products = state.productModel.data!.products;
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 337,
                            width: double.infinity,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: products!.length,
                              separatorBuilder: (_, __) =>
                                  SizedBox(width: 10.w),
                              itemBuilder: (context, index) {
                                final product = products[index];
                                return Items(product: product);
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            )
          ]),
        ),
      ),
    );
  }
}
