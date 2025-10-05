import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../cubits/home_slider/cubit/home_slider_cubit.dart';
import 'offer_product.dart';

class CustomeSlider extends StatefulWidget {
  const CustomeSlider({super.key});

  @override
  _CustomeSliderState createState() => _CustomeSliderState();
}

class _CustomeSliderState extends State<CustomeSlider> {
  int _currentIndex = 0;
  final List<String> _images = [
    "assets/images/baner.png",
    "assets/images/baner.png",
    "assets/images/baner.png"
  ];

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => HomeSliderCubit()..getHomeSlider(),
      child: BlocConsumer<HomeSliderCubit, HomeSliderState>(
        listener: (context, state) async {
          if (state is HomeSliderError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message ?? "حدث خطأ")),
            );
          }
          // else if (state is HomeSliderSuccess) {
          //   // Cache the fetched categories if the response is successful
          //   await SharedPreferencesHelper.saveCategories(
          //       state.getAllCategoryModel.data!.data);
          // }
        },
        builder: (context, state) {


          // if (state is HomeSliderError) {
          //   return FutureBuilder<List<dynamic>?>(
          //     future: SharedPreferencesHelper.getCategories(),
          //     builder: (context, snapshot) {
          //       if (snapshot.connectionState == ConnectionState.waiting) {
          //         return const Center(child: CircularProgressIndicator());
          //       }
          //       if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          //         final cachedCategories = snapshot.data!;
          //         return _buildCategoryList(cachedCategories);
          //       }
          //       return Column(
          //         children: [
          //           Align(
          //             alignment: Alignment.topRight,
          //             child: Text(
          //               "الفئات",
          //               style: GoogleFonts.cairo(
          //                   textStyle: TextStyle(
          //                       fontSize: 18.sp,
          //                       fontWeight: FontWeight.w500)),
          //             ),
          //           ),
          //           SizedBox(height: 20.h),
          //           Center(
          //             child: Text(
          //               state.message ?? "Error",
          //               style: GoogleFonts.cairo(
          //                   fontSize: 14.sp, color: Colors.red),
          //             ),
          //           ),
          //         ],
          //       );
          //     },
          //   );
          // }

          if (state is HomeSliderSuccess) {
            final sliderModel = state.sliderModel.data!;
            if (sliderModel.isEmpty) {
              return  Column(
                children: [
                  SizedBox(
                    // width: 343.w,
                    child: CarouselSlider(
                      items: _images.map((imagePath) {
                        return  Image.asset(imagePath, fit: BoxFit.contain) ;

                      }).toList(),
                      options: CarouselOptions(
                        height: 160.h,
                        enlargeCenterPage: true,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 3),
                        viewportFraction: 1.0,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _currentIndex = index;
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _images.asMap().entries.map((entry) {
                      return Container(
                        width: 8.0.w,
                        height: 8.0.h,
                        margin: EdgeInsets.symmetric(horizontal: 4.0.w),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentIndex == entry.key
                              ? const Color(0XFF13A9CA)
                              : Colors.grey.withOpacity(0.5),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              );
            }
            return  Column(
              children: [
                SizedBox(
                  // width: 343.w,
                  child: CarouselSlider(
                    items: sliderModel.map((imagePath) {

                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    OfferProduct(titleName: 'العروض',
                                        getProductesEndpoint: "products?offer_id=${imagePath
                                            .offerId??""}&category_id=${imagePath
                                            .categoryId??""}&product_id=${imagePath
                                            .productId??""}")
                            ),
                          );
                        },
                        child:Image.network(imagePath.image??"", fit: BoxFit.contain),
                      );
                    }).toList(),
                    options: CarouselOptions(
                      height: 160.h,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      viewportFraction: 1.0,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: sliderModel.asMap().entries.map((entry) {
                    return Container(
                      width: 8.0.w,
                      height: 8.0.h,
                      margin: EdgeInsets.symmetric(horizontal: 4.0.w),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentIndex == entry.key
                            ? const Color(0XFF13A9CA)
                            : Colors.grey.withOpacity(0.5),
                      ),
                    );
                  }).toList(),
                ),
              ],
            );
          }
          else {
            return const Column(
              children: [
                Center(child: CircularProgressIndicator()),
              ],
            );
          }
          // return FutureBuilder<List<dynamic>?>(
          //   future: SharedPreferencesHelper.getCategories(),
          //   builder: (context, snapshot) {
          //     if (snapshot.connectionState == ConnectionState.waiting) {
          //       return const Center(child: CircularProgressIndicator());
          //     }
          //     if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          //       final cachedCategories = snapshot.data!;
          //       return Column(
          //         children: [
          //           SizedBox(
          //             width: 343.w,
          //             child: CarouselSlider(
          //               items: _images.map((imagePath) {
          //                 return Image.asset(imagePath, fit: BoxFit.contain);
          //               }).toList(),
          //               options: CarouselOptions(
          //                 height: 160.h,
          //                 enlargeCenterPage: true,
          //                 autoPlay: true,
          //                 autoPlayInterval: Duration(seconds: 3),
          //                 viewportFraction: 0.8,
          //                 onPageChanged: (index, reason) {
          //                   setState(() {
          //                     _currentIndex = index;
          //                   });
          //                 },
          //               ),
          //             ),
          //           ),
          //           SizedBox(height: 10.h),
          //           Row(
          //             mainAxisAlignment: MainAxisAlignment.center,
          //             children: _images.asMap().entries.map((entry) {
          //               return Container(
          //                 width: 8.0.w,
          //                 height: 8.0.h,
          //                 margin: EdgeInsets.symmetric(horizontal: 4.0.w),
          //                 decoration: BoxDecoration(
          //                   shape: BoxShape.circle,
          //                   color: _currentIndex == entry.key
          //                       ? Color(0XFF13A9CA)
          //                       : Colors.grey.withOpacity(0.5),
          //                 ),
          //               );
          //             }).toList(),
          //           ),
          //         ],
          //       );
          //     }
          //     return const SizedBox();
          //   },
          // );
        },
      ),
    );



  }
}
