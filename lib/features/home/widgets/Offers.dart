import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../cubits/get_all_category/getallcategory_cubit.dart';
import '../cubits/get_home_offer/cubit/get_home_offer_cubit.dart';
import '../cubits/get_productes/cubit/get_products_cubit.dart';
import '../models/home_offer_model.dart';
import 'offer_product.dart';
import 'offers_card.dart';

class OffersRow extends StatelessWidget {
  final bool? isSamePage;
  const OffersRow({Key? key, this.isSamePage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Text(
              "العروض",
              style: GoogleFonts.cairo(
                  textStyle:
                      TextStyle(fontWeight: FontWeight.w500, fontSize: 18.sp)),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          BlocProvider(
            create: (context) => HomeOfferCubit()..getHomeOffer(),
            child: OffersList(isSamePage: isSamePage),
          ),
        ],
      ),
    );
  }
}

class OffersList extends StatefulWidget {
  final bool? isSamePage;
  const OffersList({Key? key, this.isSamePage}) : super(key: key);

  @override
  State<OffersList> createState() => _OffersListState();
}

class _OffersListState extends State<OffersList> {
  final ScrollController _scrollController = ScrollController();

  late int id;
  @override
  void initState() {
    // TODO: implement initState
    _scrollController.addListener(_scrollListener);

    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      _loadMoreData();
    }
  }

  Future<void> _loadMoreData() async {
    context.read<HomeOfferCubit>().getUpdateHomeOffer();
  }

  List<OfferModel>? offerList;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeOfferCubit, HomeOfferState>(
      builder: (context, state) {
        if (state is HomeOfferLoading) {
          return const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Center(child: CircularProgressIndicator())],
          );
        } else if (state is HomeOfferError) {
          return Center(child: Text(state.message ?? ""));
        } else if (state is HomeOfferSuccess ||
            state is HomeUpdateOfferSuccess ||
            state is HomeUpdateOfferLoading ||
            state is HomeOfferEmpty) {
          if (state is HomeOfferSuccess) {
            offerList = state.offerList;
          } else if (state is HomeUpdateOfferSuccess) {
            offerList = state.offerList;
          }
          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
           Expanded(child:  Padding(
             padding: const EdgeInsets.symmetric(horizontal: 0),
             child: SizedBox(
                 height: 100.h,
                 child: SingleChildScrollView(controller: _scrollController,scrollDirection: Axis.horizontal,
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.start,
                     children: [
                       ListView.builder(
                         shrinkWrap: true,
                         physics:  NeverScrollableScrollPhysics(),
                         scrollDirection: Axis.horizontal,
                         itemCount: offerList!.length,
                         itemBuilder: (context, index) {
                           return InkWell(
                             onTap: () {
                               if (widget.isSamePage ?? false) {
                                 context.read<GetProductsCubit>().getProduct(
                                     getProductesEndpoint:
                                     "products?offer_id=${offerList![index].id}");
                               } else {
                                 Navigator.push(
                                   context,
                                   MaterialPageRoute(
                                     builder: (context) => OfferProduct(
                                         titleName: 'العروض',
                                         getProductesEndpoint:
                                         "products?offer_id=${offerList![index].id}"),
                                   ),
                                 );
                               }
                             },
                             child: OffersCard(offerData: offerList![index]),
                           );
                         },
                       ),
                       if (state is HomeUpdateOfferLoading)
                         const CircularProgressIndicator(),
                       if (state is HomeOfferEmpty)
                         const Padding(
                           padding: EdgeInsets.symmetric(horizontal: 5),
                           child: Center(child: Text("لا توجد عروض أخرى")),
                         ),
                     ],
                   ),)),
           ))
          ],);
        }
        return const SizedBox.shrink();
      },
    );
  }
}
