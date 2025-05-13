import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../cart/cubits/add_to_cart/cubit/add_to_cart_cubit.dart';
import '../cubits/get_cart_amount/get_cart_amount_cubit.dart';
import '../model/cart_model.dart';
class PluseAndMinusPuttons extends StatefulWidget {
  final CartItem product;
  const PluseAndMinusPuttons({super.key, required this.product});

  @override
  State<PluseAndMinusPuttons> createState() => _PluseAndMinusPuttonsState();
}

class _PluseAndMinusPuttonsState extends State<PluseAndMinusPuttons> {
  int number = 1;
  @override
  void initState() {
    // TODO: implement initState
    number =widget.product.quantity??1;

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddProductToCartListCubit,AddProductToCartListState>(
     listener:  (context,state){
       if(state is AddProductToCartListSuccess){
         BlocProvider.of<GetAmountCubit>(context).getCartAmount();
       }
     },
        builder: (context,state){return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 40.h,
              width: 40.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: const Color(0xFF13A9CA), // Hex color with Flutter syntax
                  width: 2.0, // Set the border width
                ),
              ),
              child: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    BlocProvider.of<AddProductToCartListCubit>(context).addToCartList(productId: widget.product.productId, quantity: 1);

                    setState(() {
                      number++;
                    });
                  },
                  icon: const Icon(
                    Icons.add,
                    color: Color(0xFF13A9CA),
                  )),
            ),
            SizedBox(
              width: 25.w,
              child: Center(
                  child: Text(
                    '$number',
                    style: GoogleFonts.cairo(
                        textStyle:
                        TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400)),
                  )),
            ),
            Container(
              height: 40.h,
              width: 40.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: const Color(0xFF13A9CA), // Hex color with Flutter syntax
                  width: 2.0, // Set the border width
                ),
              ),
              child: IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {

                  setState(() {
                    if (number > 1) {
                      BlocProvider.of<AddProductToCartListCubit>(context).addToCartList(productId: widget.product.productId, quantity: -1);
                      number--;
                    }
                  });
                },
                icon: const Icon(
                  Icons.remove,
                  color: Color(0xFF13A9CA),
                ),
              ),
            ),
          ],
        );});
  }
}
