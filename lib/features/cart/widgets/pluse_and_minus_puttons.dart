import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../cart/cubits/add_to_cart/cubit/add_to_cart_cubit.dart';
import '../../home/models/product_model.dart';
import '../cubits/get_cart_amount/get_cart_amount_cubit.dart';
import '../model/cart_model.dart';
class PluseAndMinusPuttons extends StatefulWidget {
  final Products product;
  final int quantity;
  final int unitId;
  final int limit;
  final bool isCard;
  final void Function(bool) ?deleteItem;
  final  Function(int) ?quantityItem;
  const PluseAndMinusPuttons({super.key, required this.product,  required this.limit, this.isCard= false, required this.quantity,   this.quantityItem, required this.unitId,   this.deleteItem});

  @override
  State<PluseAndMinusPuttons> createState() => _PluseAndMinusPuttonsState();
}

class _PluseAndMinusPuttonsState extends State<PluseAndMinusPuttons> {
  int number = 1;
  @override
  void initState() {
    // TODO: implement initState
    number =widget.quantity??1;

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
                  color: widget.limit==number?Colors.grey: const Color(0xFF13A9CA), // Hex color with Flutter syntax
                  width: 2.0, // Set the border width
                ),
              ),
              child: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    if(widget.limit>number){
                    BlocProvider.of<AddProductToCartListCubit>(context)
                        .addToCartList(
                            productId: widget.product.id,
                            quantity: 1,
                            unitId: widget.unitId);
                    setState(() {
                      number++;
                    });
                    widget.quantityItem!(number);
                  }else{
                      ScaffoldMessenger.of(context)
                          .showSnackBar(
                        SnackBar(
                          content: const Text(
                              "لقد طلبت الحد المسموح من هذا المنتج",
                              style: TextStyle(
                                  color:
                                  Colors.white)),
                          duration:
                          const Duration(seconds: 2),
                          behavior: SnackBarBehavior
                              .floating, // makes it float above content
                          margin:
                          const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 10),
                          backgroundColor:
                          Colors.red,
                          shape:
                          RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(
                                8),
                          ),
                        ),
                      );
                    }
                },
                  icon:  Icon(
                    Icons.add,
                    color: widget.limit==number?Colors.grey: const Color(0xFF13A9CA), // Hex color with Flutter syntax
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
                      BlocProvider.of<AddProductToCartListCubit>(context).addToCartList(productId: widget.product.id, quantity: -1, unitId: widget.unitId);
                      number--;
                      widget.quantityItem!(number);   }else{
                      if(!widget.isCard){
                        widget.deleteItem!(true);
                        BlocProvider.of<AddProductToCartListCubit>(context).removeToCartList(
                          productId: widget.product.id,);
                        widget.quantityItem!(0); }
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
