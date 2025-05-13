import 'package:engaz/core/network/shared_preferences.dart';
import 'package:engaz/features/home/cubits/get_all_company/cubit/get_all_company_cubit.dart';
import 'package:engaz/features/home/cubits/get_productes/cubit/get_products_cubit.dart';
import 'package:engaz/features/home/cubits/get_sub_category/cubit/get_sub_category_cubit.dart';
import 'package:engaz/features/home/models/get_sub_category_model.dart';
import 'package:engaz/features/home/screens/details_screen.dart';
import 'package:engaz/features/home/widgets/categories_items.dart';
import 'package:engaz/features/home/widgets/custome_search_bar.dart';
import 'package:engaz/features/home/widgets/item.dart';
import 'package:engaz/features/home/widgets/trade_mark_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/get_all_category_model.dart';

class SpacificCategorieScreen extends StatefulWidget {
  static const String routeName = "SpacificCategorieScreen";
  final String categorieName;
  final int id;
  final List<DataCategory> subCategoryList;
  const SpacificCategorieScreen({
    super.key,
    required this.categorieName,
    required this.subCategoryList,
    required this.id,
  });

  @override
  State<SpacificCategorieScreen> createState() =>
      _SpacificCategorieScreenState();
}

class _SpacificCategorieScreenState extends State<SpacificCategorieScreen> {
  int? _selectedSubCategoryId;
  int? _selectedCompanyId;

  Future<List<dynamic>?> _loadCachedSubCategories() async {
    return await SharedPreferencesHelper.getSUbCategories();
  }

  Future<void> _saveSubCategories(List<dynamic> subCategories) async {
    await SharedPreferencesHelper.saveSubCategories(widget.subCategoryList);
  }
  @override
  void initState() {
    // TODO: implement initState
    _selectedSubCategoryId = widget.id;
    BlocProvider.of<GetProductsCubit>(context).getProduct(
        // category: widget.id,
        getProductesEndpoint:  'products/category/$_selectedSubCategoryId',

      );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          widget.categorieName,
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
      body: FutureBuilder(
        future: _loadCachedSubCategories(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            List<dynamic>? cachedSubCategories = snapshot.data;

            return SingleChildScrollView(
              child: Column(
                children: [
                  const CustomeSearchBar(),
                  SizedBox(height: 30.h),
                  // BlocBuilder<GetSubCategoryCubit, GetSubCategoryState>(
                  //   builder: (context, state) {
                  //     if (state is GetSubCategoryLoading) {
                  //       return const Center(
                  //           child: CircularProgressIndicator());
                  //     } else if (state is GetSubCategoryError) {
                  //       return Center(child: Text(state.message ?? ''));
                  //     } else if (state is GetSubCategorySuccess) {
                  //       final subCategories =
                  //           state.subCategoriesModel.subCategories;
                  //       _saveSubCategories(
                  //         subCategories
                  //             .map((subCategory) => subCategory.toJson())
                  //             .toList(),
                  //       );
                  //
                  //       return _buildSubCategoriesList(subCategories);
                  //     } else if (cachedSubCategories != null) {
                  //       final subCategories = cachedSubCategories
                  //           .map((json) => SubCategoriesModel.fromJson(json))
                  //           .toList();
                  //       return _buildSubCategoriesList(subCategories);
                  //     } else {
                  //       return const SizedBox.shrink();
                  //     }
                  //   },
                  // ),
                 if(widget.subCategoryList.isNotEmpty)...[
                _buildSubCategoriesList(widget.subCategoryList),
                  SizedBox(height: 10.h),],
                  BlocProvider(
                    create: (context) => GetAllCompanyCubit()
                      ..getAllComapny(category:_selectedSubCategoryId),
                    child:
                    BlocBuilder<GetAllCompanyCubit, GetAllCompanyState>(
                      builder: (context, state) {
                        if (state is GetAllCompanyLoading) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (state is GetAllCompanyError) {
                          return Center(child: Text(state.message ?? ""));
                        } else if (state is GetAllCompanySuccess) {
                          final companies =
                              state.getAllCompanyModel.data;
                          return Padding(
                            padding:
                            const EdgeInsets.symmetric(horizontal: 15),
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Text(
                                    "الشركات",
                                    style: GoogleFonts.cairo(
                                      textStyle: TextStyle(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20.h),
                                SizedBox(
                                  height: 60,
                                  child: ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: companies!.length,
                                    separatorBuilder: (_, __) =>
                                        SizedBox(width: 10.w),
                                    itemBuilder: (context, index) {
                                      final company = companies[index];
                                      return InkWell(
                                        onTap: (){
                                          BlocProvider.of<GetProductsCubit>(context).getProduct(

                                            getProductesEndpoint:  'products?company_id=${ companies[index].id}&category_id=${_selectedSubCategoryId}',

                                          );
                                        },
                                        child: TradeMarkItem(company: company),
                                      );
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
                  ),
                  SizedBox(height: 20.h),
                  BlocBuilder<GetProductsCubit, GetProductsState>(
                    builder: (context, state) {
                      if (state is GetProductsLoading) {
                        return const Center(
                            child: CircularProgressIndicator());
                      } else if (state is GetProductsError) {
                        return Center(child: Text(state.message ?? ""));
                      } else if (state is GetProductsSuccess) {
                        final products = state.productModel.data!.products;
                        return Padding(
                          padding:
                          const EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.topRight,
                                child: Text(
                                  " منتجات متشابها",
                                  style: GoogleFonts.cairo(
                                    textStyle: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20.h),
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
                  )
                  // BlocProvider(
                  //   create: (context) => GetProductsCubit()
                  //     ..getProduct(
                  //       category: widget.id,
                  //       getProductesEndpoint:  'products/category/$_selectedSubCategoryId',
                  //
                  //     ),
                  //   child: ,
                  // )
                ],
              ),
            );
          }
        },
      ),
    );
  }

  Widget _buildSubCategoriesList(List<dynamic> subCategories) {
    return SizedBox(
      height: 150.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: subCategories.length,
        itemBuilder: (context, index) {
          final subCategory = subCategories[index];

          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedSubCategoryId = subCategory.id;
              });

              // إعادة تحميل المنتجات بناءً على subCategoryId
              context.read<GetProductsCubit>().getProduct(
                    id: _selectedSubCategoryId,
                  );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: CategoriesItems(
                imageUrl: subCategory.image,
                name: subCategory.name,
              ),
            ),
          );
        },
      ),
    );
  }
}
