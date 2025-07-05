import 'package:engaz/features/cart/screens/second_cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../home/screens/drawer_screen.dart';
import '../../home/widgets/app_bar.dart';
import '../../home/widgets/custome_search_bar.dart';
import '../../home/widgets/custome_slider.dart';
import '../cubits/add_to_cart/cubit/add_to_cart_cubit.dart';
import '../cubits/check_out/check_out_bloc.dart';
import '../cubits/get_cart_amount/get_cart_amount_cubit.dart';
import '../cubits/get_cart_item/get_cart_item_cubit.dart';
import '../widgets/card_item_in_cart.dart';
import '../widgets/dialog.dart';
import '../widgets/success_dialog.dart';

class FirstCartScreen extends StatefulWidget {
  const FirstCartScreen({Key? key}) : super(key: key);

  @override
  State<FirstCartScreen> createState() => _FirstCartScreenState();
}

class _FirstCartScreenState extends State<FirstCartScreen> {
  static const String routeName = "FirstCartScreen";
  String amount = "0";
  double min=2500;
  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<GetAllCartListCubit>(context).getCartList();
    BlocProvider.of<GetAmountCubit>(context).getCartAmount();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const CustomeAppBar(),
            CustomeSearchBar(),
            SizedBox(height: 20.h),
            const CustomeSlider(),
            SizedBox(height: 20.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      "عربة التسوق",
                      style: GoogleFonts.cairo(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  BlocConsumer<AddProductToCartListCubit, AddProductToCartListState>(
                      listener: (context, state) {
                        if (state is RemoveALLCartListSuccess) {
                          BlocProvider.of<GetAmountCubit>(context).getCartAmount();
                          BlocProvider.of<GetAllCartListCubit>(context).getCartList();
                        }
                      }, builder: (context, state) {
                    if (state is RemoveALLCartListLoading) {
                      return const CircularProgressIndicator();
                    }
                    return  GestureDetector(
                      onTap: () {
                        showCustomAlertDialogInCart(context);
                      },
                      child: Text(
                        "مسح الكل",
                        style: GoogleFonts.cairo(
                          textStyle: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color(0XFFD42828),
                            decoration: TextDecoration.underline,
                            decorationColor: const Color(0XFFD42828),
                          ),
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
            SizedBox(height: 15.h),

                BlocBuilder<GetAllCartListCubit, GetAllCartListState>(
                  builder: (context, state) {
                    if (state is GetAllCartListSuccess) {
                      return Expanded(child:  Column(
                        children: [
                          state.cartListModel.data!.isNotEmpty?
                          Expanded(
                            child: ListView.builder(
                              itemCount: state.cartListModel.data!.length, // Number of items
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding:
                                  EdgeInsets.only(bottom: 10.h), // Space between items
                                  child:   CardItemInCart(product: state.cartListModel.data![index],),
                                );
                              },
                            ),
                          ):
                          Center(child: Text("لا توجد منتجات",   style: GoogleFonts.cairo(
                          textStyle:
                          TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500)),
                          ))
                          ,
                          BlocBuilder<GetAmountCubit, GetAmountState>(
                            builder: (context, state) {
                              if(state is GetAmountSuccess){
                                amount =state.amount;
                              }
                              return Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20.w),
                                child: Row(
                                  children: [
                                    Text(
                                      "اجمالي السعر بعد الخصم ",
                                      style: GoogleFonts.cairo(
                                          fontSize: 20.sp, fontWeight: FontWeight.w400),
                                    ),
                                    const Spacer(),
                                    Text(
                                      "${amount} EGP",
                                      style: GoogleFonts.cairo(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0XFF13A9CA)),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                          // ),
                          SizedBox(height: 15.h),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: TextButton(
                              onPressed: () {
                               if(double.parse(amount)>=min) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SecondCartScreen()),
                              );
                            }else{
                                 ScaffoldMessenger.of(context)
                                     .showSnackBar(
                                   SnackBar(
                                     content: const Text(
                                         " الحد اادنى للفاتوره 2500 جنيه ",
                                         style: TextStyle(
                                             color: Colors.white)),
                                     duration: const Duration(seconds: 2),
                                     behavior: SnackBarBehavior
                                         .floating, // makes it float above content
                                     margin: const EdgeInsets.symmetric(
                                         horizontal: 20, vertical: 10),
                                     backgroundColor: Colors.red,
                                     shape: RoundedRectangleBorder(
                                       borderRadius:
                                       BorderRadius.circular(8),
                                     ),
                                   ),
                                 );
                               }
                          },
                              style: TextButton.styleFrom(
                                backgroundColor: const Color(0xFF13A9CA), // Background color
                                minimumSize: const Size(
                                    double.infinity, 48), // Width is dynamic, height is fixed
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10), // Border radius
                                ),
                              ),
                              child: Text(
                                "التالى",
                                style: GoogleFonts.cairo(
                                  textStyle: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white, // Text color
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ));
                    } else if (state is GetAllCartListError) {
                      return Center(child: Text(state.message ?? ""));
                    }else {
                      return const Column(mainAxisAlignment:MainAxisAlignment.center,children: [Center(child: CircularProgressIndicator(),)],);
                    }
                  },
                ),

          ],
        ),
      ),
    );
  }
}