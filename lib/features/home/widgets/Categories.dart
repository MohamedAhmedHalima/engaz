import 'package:cached_network_image/cached_network_image.dart';
import 'package:engaz/core/network/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:redacted/redacted.dart';

import '../../../core/network/shared.dart';
import '../cubits/get_all_category/getallcategory_cubit.dart';
import '../screens/spacific_categorie_screen.dart';

class Categories extends StatelessWidget {
  final String? categoriesName;

  const Categories({super.key, this.categoriesName = "البقاله "});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: BlocProvider(
        create: (context) => GetallcategoryCubit()..getAllCategory(),
        child: BlocConsumer<GetallcategoryCubit, GetallcategoryState>(
          listener: (context, state) async {
            if (state is GetallcategoryError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message ?? "حدث خطأ")),
              );
            }

          },
          builder: (context, state) {
            if (state is GetallcategoryLoading) {
              return Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      "الفئات",
                      style: GoogleFonts.cairo(
                          textStyle: TextStyle(
                              fontSize: 18.sp, fontWeight: FontWeight.w500)),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  const Center(child: CircularProgressIndicator()),
                ],
              );
            }



            if (state is GetallcategorySuccess) {
              final categories = state.getAllCategoryModel.data!.data![0].subcategories;
              if (categories!.isEmpty) {
                return Column(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        "الفئات",
                        style: GoogleFonts.cairo(
                            textStyle: TextStyle(
                                fontSize: 18.sp, fontWeight: FontWeight.w500)),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Center(
                      child: Text(
                        "لا يوجد منتجات ",
                        style: GoogleFonts.cairo(fontSize: 14.sp),
                      ),
                    ),
                  ],
                );
              }
              return _buildCategoryList(categories);
            }
            return const SizedBox.shrink();

          },
        ),
      ),
    );
  }

  Widget _buildCategoryList(List<dynamic> categories) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.topRight,
          child: Text(
            "الفئات",
            style: GoogleFonts.cairo(
                textStyle:
                    TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500)),
          ),
        ),
        SizedBox(height: 20.h),
        SizedBox(
          // height: categories.length <= 3 ? 150.h : 500.h,
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
              childAspectRatio: 0.8,
            ),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final category = categories[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SpacificCategorieScreen(
                        categorieName: category.name,
                        id: category.id,
                          subCategoryList: category.subcategories
                      ),
                    ),
                  );
                },
                child: Card(
                  elevation: 2.0,
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      category.image!=null?
                      CachedNetworkImage(
                        cacheManager: MyImageCacheManager.instance,   imageUrl:category.image ??"",
                        // width: 60.r,
                        height: 80.h,
                        fit: BoxFit.cover,
                        placeholder: (context, url) =>  Center(
                          child: SizedBox(
                            width: 24.r,
                            height: 24.r,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          ),
                        ),
                        errorWidget: (context, url, error) => const Icon(Icons.error),
                      )
                      // Image.network(
                      //   category.image,
                      //   height: 80,
                      //   fit: BoxFit.cover,
                      //   errorBuilder: (context, error, stackTrace) =>
                      //       const Icon(Icons.error),
                      // )
                          :Image.asset(
                        "assets/images/logo.png",
                        height: 80,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.error),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        category.name,
                        style: GoogleFonts.cairo(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
