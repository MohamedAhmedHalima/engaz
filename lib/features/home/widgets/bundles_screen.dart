import 'dart:ffi';

import 'package:engaz/features/home/screens/main_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../cart/cubits/add_to_cart/cubit/add_to_cart_cubit.dart';
import '../../cart/cubits/get_cart_amount/get_cart_amount_cubit.dart';
import '../../offers/widgets/card_item_for_offeres.dart';
import '../cubits/get_bundles/cubit/get_bundles_cubit.dart';
import '../models/get_bundles_model.dart';
import '../models/get_bundles_model.dart';
import '../models/product_model.dart';
import 'custome_search_bar.dart';

class BundlesScreen extends StatefulWidget {
  final String titleName;
  const BundlesScreen({
    Key? key,
    required this.titleName,
  }) : super(key: key);

  @override
  State<BundlesScreen> createState() => _BundlesScreenState();
}

class _BundlesScreenState extends State<BundlesScreen> {
  bool isFirst = true;
  int? bundleId;

  @override
  void initState() {
    BlocProvider.of<GetBundlesCubit>(context).getBundles();
    super.initState();
  }

  List<Products> products = [];
  BundleModelData ?bundleModelData;

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          widget.titleName,
          style: GoogleFonts.cairo(
            textStyle: TextStyle(
              color: const Color(0XFF94CF29),
              fontSize: 24.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Color(0XFF13A9CA),
          ),
        ),
      ),

      bottomSheet: Container(
          color: Colors.white,
          child: Padding(
          padding: EdgeInsets.all(20.r),
          child: SizedBox(
            child: BlocConsumer<AddProductToCartListCubit,
                AddProductToCartListState>(
              listener: (context, state) {
                if (state is AddBundleToCartListSuccess) {
                  BlocProvider.of<GetAmountCubit>(context).getCartAmount();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text("تم اضافه المنتج   بنجاح!",
                          style: TextStyle(color: Colors.white)),
                      duration: const Duration(seconds: 2),
                      behavior: SnackBarBehavior
                          .floating, // makes it float above content
                      margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  );
                }
              },
              builder: (context, state) {
              if (state is AddBundleToCartListLoading) {
                  return const CircularProgressIndicator();
                }
                return SizedBox(
                  height: 40.h,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8,),
                    child: GestureDetector(
                      onTap: () {
                        context
                            .read<AddProductToCartListCubit>()
                            .addBundleToCartList(
                          bundleId: bundleId,
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFF13A9CA),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 12.h,horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment
                              .spaceBetween, // Adjust alignment
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
                            SizedBox(
                              width:
                              10.w, // Adjusted width for smaller screens
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
                      ),
                    ),
                  ),
                );
              },
            ),
          )
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomeSearchBar(),
            SizedBox(height: 30.h),
            BlocConsumer<GetBundlesCubit, GetBundlesState>(
              listener: (context, state) async {
                if (state is GetBundlesError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.message ?? "حدث خطأ")),
                  );
                }
              },
              builder: (context, state) {
                if (state is GetBundlesSuccess) {
                  final bundleModel = state.getBundlesModel.data!;
                  if (bundleModel!.isEmpty) {
                    return Column(
                      children: [
                        Center(
                          child: Text(
                            "لا يوجد عروض ",
                            style: GoogleFonts.cairo(fontSize: 14.sp),
                          ),
                        ),
                      ],
                    );
                  }
                  if (isFirst) {
                    bundleId = bundleModel[0].id;
                    products = bundleModel[0].items!;
                    bundleModelData=bundleModel[0];
                    isFirst = false;
                  }
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          SizedBox(
                              height: 100.h, // Adjust height as needed to fit items
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: state.getBundlesModel.data!.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      products = [];
                                      products = bundleModel[index].items!;
                                      bundleModelData=bundleModel[index];
                                      bundleId = bundleModel[index].id;
                                      setState(() {});
                                    },
                                    child: BundlesCard(
                                        bundlesModel:
                                        state.getBundlesModel.data![index]),
                                  );
                                },
                              )),
                          SizedBox(height: 20.h),
                          GridView.builder(
                            shrinkWrap: true,
                            key: ValueKey(products),
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 1.0,
                              mainAxisSpacing: 1,
                              mainAxisExtent: 380.h,
                            ),
                            itemCount: products!.length,
                            itemBuilder: (context, index) {
                              // final product = products[index];
                              return OfferItemGrid(
                                  product: products[index], isBundle: true);
                            },
                          ),
                        ],
                      ),

                    Padding(padding: EdgeInsets.all(20.r),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "اجمالي السعر قبل الخصم ",
                              style: GoogleFonts.cairo(
                                  fontSize: 20.sp, fontWeight: FontWeight.w400),
                            ),
                            const Spacer(),
                            Text(
                              "${bundleModelData!.total??0} EGP",
                              style: GoogleFonts.cairo(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0XFF13A9CA)),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "اجمالي السعر بعد الخصم ",
                              style: GoogleFonts.cairo(
                                  fontSize: 20.sp, fontWeight: FontWeight.w400),
                            ),
                            const Spacer(),
                            Text(
                              "${bundleModelData!.total_after_discount??0} EGP",
                              style: GoogleFonts.cairo(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0XFF13A9CA)),
                            ),
                          ],
                        ),
                      ],
                    )
                      ,)
                    ],
                  );
                } else {
                  return Column(
                    children: [
                      SizedBox(height: 20.h),
                      const Center(child: CircularProgressIndicator()),
                    ],
                  );
                }
              },
            ),

          ],
        ),
      ),
    );
  }

}



class BundlesCard extends StatelessWidget {
  final BundleModelData bundlesModel;
  const BundlesCard({super.key, required this.bundlesModel});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 149.w,
      child: Card(
        color: const Color(0XFFB0E2ED),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10.h,
              ),
              Container(
                height: 18.h,
                width: 46.w,
                color: Colors.white,
                child: Align(
                  alignment: Alignment.topRight,
                  child: Center(
                    child: Text(
                      bundlesModel.name ?? "",
                      style: GoogleFonts.cairo(
                          textStyle: TextStyle(
                              fontSize: 14.sp, fontWeight: FontWeight.w500)),
                    ),
                  ),
                ),
              ),
              Text(
                bundlesModel.description ?? "",
                style: GoogleFonts.cairo(
                    textStyle: TextStyle(
                        fontSize: 16.sp, fontWeight: FontWeight.w400)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
