import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../offers/widgets/card_item_for_offeres.dart';
import '../cubits/get_all_favourite_list/cubit/get_all_favourite_list_cubit.dart';

class CardItemForFavorit extends StatefulWidget {
  const CardItemForFavorit({super.key});

  @override
  State<CardItemForFavorit> createState() => _CardItemForFavoritState();
}

class _CardItemForFavoritState extends State<CardItemForFavorit> {
  bool _isExpanded = false;

  @override
  void initState() {
    // TODO: implement initState
    context
        .read<GetAllFavouriteListCubit>().getFavouriteList();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<GetAllFavouriteListCubit, GetAllFavouriteListState>(
      builder: (context, state) {
        if (state is GetAllFavouriteListSuccess) {
          return   GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 1.0,
              mainAxisSpacing: 1,
              mainAxisExtent: 380.h,
            ),
            itemCount:state.favouriteListModel.data!.length,
            itemBuilder: (context, index) {
              final product = state.favouriteListModel.data![index];
              return OfferItemGrid(product:product ,isFavorite: true,) ;
            },
          );

        } else if (state is GetAllFavouriteListError) {
          return Center(child: Text(state.message ?? ""));
        }else {
          return Column(mainAxisAlignment:MainAxisAlignment.center,children: [Center(child: CircularProgressIndicator(),)],);
        }
      },
    );
  }
}

