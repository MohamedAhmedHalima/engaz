import 'package:engaz/features/home/screens/main_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../offers/widgets/card_item_for_offeres.dart';
import '../cubits/get_all_company/cubit/get_all_company_cubit.dart';
import '../cubits/get_productes/cubit/get_products_cubit.dart';
import 'custome_search_bar.dart';
import 'item.dart';

class OfferProduct extends StatefulWidget {
  final String titleName;
  final String getProductesEndpoint;
  const OfferProduct({required this.titleName,required this.getProductesEndpoint,Key? key}) : super(key: key);

  @override
  State<OfferProduct> createState() => _OfferProductState();
}

class _OfferProductState extends State<OfferProduct> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
      body: BlocProvider(
        create: (context) => GetProductsCubit()
          ..getProduct(
            getProductesEndpoint:  widget.getProductesEndpoint,
          ),
        child:    CardItemForOfferes(body:  Column(
          children: [
            CustomeSearchBar(),
            SizedBox(height: 30.h),

          ],
        ),)
      )

    );
  }
}
