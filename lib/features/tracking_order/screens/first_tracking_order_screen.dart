import 'package:engaz/features/home/screens/main_export.dart';
import 'package:engaz/features/tracking_order/controller/get_order_list_data/cubite/get_order_list_data_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../home/screens/drawer_screen.dart';
import '../../home/widgets/app_bar.dart';
import '../../home/widgets/custome_search_bar.dart';
import '../../home/widgets/custome_slider.dart';
import '../widgets/order_card_Item.dart';
import '../widgets/order_details.dart';


class FirstTrackingOrderScreen extends StatefulWidget {
  static const String routeName = "FirstTrackingOrderScreen";

  const FirstTrackingOrderScreen({super.key});

  @override
  State<FirstTrackingOrderScreen> createState() =>
      _FirstTrackingOrderScreenState();
}

class _FirstTrackingOrderScreenState extends State<FirstTrackingOrderScreen> {
  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<GetOrderListDataCubit>(context).getOrderListData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CustomeAppBar(),
                CustomeSearchBar(),
              SizedBox(height: 20.0.h),
              const CustomeSlider(),
              SizedBox(height: 20.0.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    "متابعة الطلبات",
                    style: GoogleFonts.cairo(
                        fontSize: 20.0, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              SizedBox(height: 15.0.h),
              BlocBuilder<GetOrderListDataCubit,GetOrderListDataState>(
                  builder: (context,state){
                    if(state is GetOrderListDataSuccess){
                      return state.listOrdersResponse.data!.isNotEmpty?ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: state.listOrdersResponse.data!.length,
                          itemBuilder:(context, index) => InkWell(
                          onTap:  !state.listOrdersResponse.data![index].status!.contains("cancled")?(){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => OrderCardItem(model:  state.listOrdersResponse.data![index],)),
                              );
                            }:null,
                            child: TrackingOrderCard(model: state.listOrdersResponse.data![index],),
                          )
                      ): Center(child: Text("لا توجد طلبات",   style: GoogleFonts.cairo(
                    textStyle:
                    TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500)),
                    ));
                        // TrackingOrderTabs(initialTabIndex: 0);
                    }else{
                      return Center(child: CircularProgressIndicator(),);
                    }
                  }
              ),

            ],
          ),
        ),
      ),
    );
  }
}
