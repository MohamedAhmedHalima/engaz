import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../home/cubits/add_product_to_favorit_list/cubit/add_product_to_favorit_list_cubit.dart';
import '../../cart/cubits/add_to_cart/cubit/add_to_cart_cubit.dart';
import '../../like_as_products/screens/products_screen.dart';
import '../cubits/get_all_favourite_list/cubit/get_all_favourite_list_cubit.dart';
import '../models/get_all_list_model.dart';
import 'package:html/parser.dart' show parse;

class CardItemForFavorit extends StatefulWidget {
  const CardItemForFavorit({super.key});

  @override
  State<CardItemForFavorit> createState() => _CardItemForFavoritState();
}

class _CardItemForFavoritState extends State<CardItemForFavorit> {
  bool _isExpanded = false;

  @override
  void initState() {
    // TODO: implement initState
    context
        .read<GetAllFavouriteListCubit>().getFavouriteList();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: BlocBuilder<GetAllFavouriteListCubit, GetAllFavouriteListState>(
          builder: (context, state) {
            if (state is GetAllFavouriteListSuccess) {
              return GridView.builder(
                shrinkWrap: true,
                // physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 1.0,
                  mainAxisSpacing: 1,
                  mainAxisExtent: _isExpanded
                      ? 360.h
                      : 320.h, // Change height based on _isExpanded
                ),
                itemCount: state.favouriteListModel.data!.length,
                itemBuilder: (context, index) {
                  return FavoriteItemCard(isExpanded: _isExpanded, item: state.favouriteListModel.data![index]);
                },
              );
            } else if (state is GetAllFavouriteListError) {
              return Center(child: Text(state.message ?? ""));
            }else {
              return Column(mainAxisAlignment:MainAxisAlignment.center,children: [Center(child: CircularProgressIndicator(),)],);
            }
          },
        ),
      ),
    );
  }
}
class FavoriteItemCard extends StatefulWidget {
  final bool isExpanded;
  final FavouriteItem item;
  const FavoriteItemCard({required this.isExpanded,required this.item,Key? key}) : super(key: key);

  @override
  State<FavoriteItemCard> createState() => _FavoriteItemCardState();
}

class _FavoriteItemCardState extends State<FavoriteItemCard> {
  bool _isSelected = true;
  String _selectedOption = "كرتونة = 12 علبة";
 late bool _isExpanded;
  void _toggleExpansion() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }
  String stripHtmlTags(String htmlString) {
    final document = parse(htmlString);
    return document.body?.text ?? '';
  }
  void _toggleImage() {
    setState(() {
      _isSelected = !_isSelected;
    });
  }
  @override
  void initState() {
    _isExpanded=widget.isExpanded;
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Card(
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
                    "خارج الخصم",
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
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ProductsScreen()),
                  );
                },
                child: const Image(
                    image: AssetImage(
                        "assets/images/refresh-circle.png")),
              ),
            ],
          ),
          SizedBox(height: 10.h),
             Expanded(child: Image.network(widget.item.images![0]),),
          SizedBox(height: 10.h),
          Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Text(
                  widget.item.name??"",
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
                              stripHtmlTags(widget.item.description??""),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 14.sp),
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
          SizedBox(height: 10.h),
          Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              children: [
                Text(
                  " ${widget.item.price} EGP ",
                  style: GoogleFonts.cairo(
                      textStyle: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(0XFF13A9CA))),
                ),
                // Text(
                //   " EGP 240 ---",
                //   style: GoogleFonts.cairo(
                //       textStyle: const TextStyle(
                //           fontSize: 10,
                //           decoration:
                //           TextDecoration.lineThrough,
                //           color: Color(0XFFB9B6B6),
                //           decorationThickness: 1.2)),
                // ),
              ],
            ),
          ),
          SizedBox(height: 10.h),
          Row(
            children: [
              Expanded(
                child:   BlocBuilder<AddProductToCartListCubit,
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
                                  productId: widget.item.id,quantity: 1);
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
              ),
              BlocConsumer<AddProductToFavoritListCubit,
                  AddProductToFavoritListState>(
              listener: (context, state) {
                if(state is RemoveProductToFavoritListSuccess){
                  BlocProvider.of<GetAllFavouriteListCubit>(context).getFavouriteList();

                }
    },
                builder: (context, state) {
                  return GestureDetector(
                    onTap: () {
                      // print(widget.product.sId);
                      _toggleImage();
                      _isSelected?
                      context
                          .read<AddProductToFavoritListCubit>()
                          .addToFavoritList(
                          productId: widget.item.id):
                      context
                          .read<AddProductToFavoritListCubit>()
                          .removeToFavoritList(
                          productId: widget.item.id);
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
          SizedBox(height: 10.h),

        ],
      ),
    );
  }
}

