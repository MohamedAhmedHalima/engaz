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

import '../../offers/widgets/card_item_for_offeres.dart';
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

  late final GetAllCompanyCubit _companyCubit;


  @override
  void initState() {
    // TODO: implement initState
    _selectedSubCategoryId = widget.id;
    BlocProvider.of<GetProductsCubit>(context).getProduct(
      getProductesEndpoint: "products?category_id=$_selectedSubCategoryId"
    );
    _companyCubit = GetAllCompanyCubit()
      ..getAllComapny(
          url: "companies?category_id=$_selectedSubCategoryId&show_category_page=1"
      );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: CardItemForOfferes(body: Column(
        children: [
          CustomeSearchBar(),
          SizedBox(height: 30.h),

          if (widget.subCategoryList.isNotEmpty) ...[
            _buildSubCategoriesList(widget.subCategoryList),
            SizedBox(height: 10.h),
          ],
         Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
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
                BlocProvider.value(
                  value: _companyCubit,

                  child:CompanyListView(onTap:  (companies) {
                    BlocProvider.of<GetProductsCubit>(
                        context)
                        .getProduct(
                      getProductesEndpoint:
                      'products?company_id=${companies!.id}&category_id=${_selectedSubCategoryId}',
                    );
                  },),
                )

              ],
            ),
          ),
          SizedBox(height: 20.h),
        ],
      )
    ) );
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
              _companyCubit.getAllComapny(
                  url:
                  "companies?category_id=$_selectedSubCategoryId&show_category_page=1"
              );
              // إعادة تحميل المنتجات بناءً على subCategoryId
              context.read<GetProductsCubit>().getProduct(
                  getProductesEndpoint: "products?category_id=$_selectedSubCategoryId"

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
  @override
  void dispose() {
    // هنا بنقفل الكيوبت
    _companyCubit.close();
    super.dispose();
  }
}
