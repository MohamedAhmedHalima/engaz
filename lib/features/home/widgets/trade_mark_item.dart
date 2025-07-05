import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:engaz/features/home/models/get_all_company_model.dart';

import '../../../core/network/shared.dart';
import '../cubits/get_all_company/cubit/get_all_company_cubit.dart'; // Import the model

class CompanyListView extends StatefulWidget {
  final void Function(Company)? onTap;
  const CompanyListView({Key? key, this.onTap}) : super(key: key);

  @override
  State<CompanyListView> createState() => _CompanyListViewState();
}

class _CompanyListViewState extends State<CompanyListView> {

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
    context.read<GetAllCompanyCubit>().updateAllComapny();
  }
  List<Company>? companies;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllCompanyCubit, GetAllCompanyState>(
      builder: (context, state) {
        if (state is GetAllCompanyLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        else if (state is GetAllCompanyError) {
          return Center(child: Text(state.message ?? ""));
        }
        else if (state is GetAllCompanySuccess||state is GetUpdateAllCompanySuccess||state is GetUpdateAllCompanyLoading||state is GetUpdateAllCompanyEmpty) {
          if(state is GetAllCompanySuccess) {
            companies = state.companyList;
          }else if(state is GetUpdateAllCompanySuccess) {
            companies = state.companyList;
          }
          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
             Expanded(child:  Padding(
               padding: const EdgeInsets.symmetric(horizontal: 15),
               child: SizedBox(height: 60.h,
                   child:SingleChildScrollView(
                     controller: _scrollController,
                     scrollDirection: Axis.horizontal,
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.start,
                       children: [
                         ListView.separated(
                           physics: NeverScrollableScrollPhysics(),
                           shrinkWrap: true,
                           scrollDirection: Axis.horizontal,
                           itemCount: companies!.length,
                           separatorBuilder: (_, __) => SizedBox(width: 10.w),
                           itemBuilder: (context, index) {
                             final company = companies![index];
                             return InkWell(
                               onTap:()=>widget.onTap!(companies![index]),
                               child: TradeMarkItem(company: company),
                             ) ;
                           },
                         ),
                         if (state is GetUpdateAllCompanyLoading)
                           const CircularProgressIndicator(),
                         if (state is GetUpdateAllCompanyEmpty)
                           const Padding(
                             padding: EdgeInsets.symmetric(horizontal: 5),
                             child: Center(child: Text("لا   شركات أخرى")),
                           ),
                       ],
                     ),
                   )
               ),
             ))
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}


class TradeMarkItem extends StatelessWidget {
  final Company company;

  const TradeMarkItem({super.key, required this.company});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 30.r,
      backgroundColor: const Color(0xFFDBEFB8),
      child: ClipOval(
        child: CachedNetworkImage(
          cacheManager: MyImageCacheManager.instance,  imageUrl:company.logo ??"",
          width: 60.r,
          height: 60.r,
          fit: BoxFit.cover,
          placeholder: (context, url) =>  Center(
            child: SizedBox(
              width: 24.r,
              height: 24.r,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
          ),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}
