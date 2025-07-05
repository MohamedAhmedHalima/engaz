import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../cart/cubits/get_cart_amount/get_cart_amount_cubit.dart';
import '../../cart/screens/first_cart_screen.dart';
import 'offer_product.dart';

class CustomeSearchBar extends StatelessWidget {
    CustomeSearchBar({super.key});
    String count ="0";
    String amount ="0";
    TextEditingController  controller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 48.h,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: TextField(
                controller:controller ,
                decoration: InputDecoration(
                  // suffixIcon:
                  //     const ImageIcon(AssetImage("assets/images/gallery.png")),
                  hintText: "ابحث هنا ",
                  hintStyle: GoogleFonts.cairo(
                    textStyle: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0XFFB9B6B6),
                    ),
                  ),
                  prefixIcon:InkWell(
                    onTap: (){
                    if(controller.text.isNotEmpty){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OfferProduct(
                              titleName: '${controller.text.trim()}',
                              getProductesEndpoint:
                              "products?name=${controller.text.trim()}"),
                        ),
                      );
                    }
                    },
                      child: const Image(
                      image: AssetImage("assets/images/search-icon.png"))),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide:
                        const BorderSide(color: Colors.grey, width: 0.25),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide:
                        const BorderSide(color: Colors.grey, width: 0.25),
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 8.h),
                  filled: true,
                  fillColor: Colors.white, // Background color of the text field
                ),
              ),
            ),
          ),
          SizedBox(
            width: 12.w,
          ),
          BlocBuilder<GetAmountCubit, GetAmountState>(
            builder: (context, state) {
              if(state is GetAmountSuccess){
                amount =state.amount;
                count =state.count;
              }
              if(state is GetAmountLoading){
                return Center(child: CircularProgressIndicator(),);
              }
              return InkWell(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FirstCartScreen()),
                  );
                },
                child: Stack(
                  children: [
                    SizedBox(
                      height: 60.h,
                      width: 56.w,
                      child:   Card(
                        elevation: 5,
                        shadowColor: Colors.grey,
                        color: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 5.h,),
                            Image(
                              image: AssetImage("assets/images/bin.png"),
                              height: 20,
                              width: 21,
                            ),
                            Text(
                              "${amount}",
                              style: GoogleFonts.cairo(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w300,
                                  color: const Color(0XFF13A9CA)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(right:0,top:0,child: CircleAvatar(radius:10.r,backgroundColor:Colors.green,child:  Text(
                      "${count}",
                      style: GoogleFonts.cairo(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ) ))
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
