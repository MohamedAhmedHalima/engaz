
import 'package:engaz/features/home/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../cubits/add_product_to_favorit_list/cubit/add_product_to_favorit_list_cubit.dart';

class FavoriteIconAndDescription extends StatefulWidget {
  final Products product;
  const FavoriteIconAndDescription({super.key, required this.product});

  @override
  State<FavoriteIconAndDescription> createState() =>
      _FavoriteIconAndDescriptionState();
}

class _FavoriteIconAndDescriptionState
    extends State<FavoriteIconAndDescription> {
  bool _isSelected = false;

  @override
  void initState() {
    // TODO: implement initState
    _isSelected =widget.product.inFavourites??false;
    super.initState();
  }
  void _toggleImage() {
    setState(() {
      _isSelected = !_isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "${widget.product.name}",
            style: GoogleFonts.cairo(
                textStyle:
                    TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w400)),
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
    );
  }
}
