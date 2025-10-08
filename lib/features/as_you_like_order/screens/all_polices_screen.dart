import 'package:engaz/features/as_you_like_order/cubits/get_policies/get_policies_cubit.dart';
import 'package:engaz/features/as_you_like_order/cubits/update_policies/update_policies_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../home/screens/drawer_screen.dart';
import '../../home/widgets/app_bar.dart';
import '../../home/widgets/custome_search_bar.dart';
import '../model/policies_model.dart';
import '../widgets/polices_card_item.dart';

class AllPolicesScreen extends StatefulWidget {
  static const String routeName = "AllPolicesScreen";
  const AllPolicesScreen({Key? key}) : super(key: key);

  @override
  State<AllPolicesScreen> createState() => _AllPolicesScreenState();
}

class _AllPolicesScreenState extends State<AllPolicesScreen> {
  late GetAllPoliciesCubit _policiesCubit;
  @override
  void initState() {
    // TODO: implement initState
    _policiesCubit=  BlocProvider.of<GetAllPoliciesCubit>(context);
    _policiesCubit.getPolicies();
    super.initState();
  }
  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   _policiesCubit.close();
  //   super.dispose();
  // }
    int ? selectedId;
   late List<PoliciesData> policesItem;
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            CustomeAppBar(),
            CustomeSearchBar(),
            SizedBox(height: 20.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Align(
                alignment: Alignment.topRight,
                child: Text(
                  "اوردرك على كيفك",
                  style: GoogleFonts.cairo(
                      textStyle: TextStyle(
                          fontSize: 20.sp, fontWeight: FontWeight.w500)),
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            BlocBuilder<GetAllPoliciesCubit,GetAllPoliciesState>(
              builder: (context, state) {
               if(state is GetAllPoliciesSuccess){
                 policesItem=state.policiesModel.data!;
                  return Column(
                   children: [
                     ...policesItem.map(
                             (item) => InkWell(
                               onTap: () {
                                 selectedId=item.id!;
                                 setState(() {

                                 });
                               },
                               child: PolicesCardItem(
                                 imagePath: "assets/images/police_1.png",
                                 title: item.name??"",
                                 border:selectedId==item.id!?Colors.green:null ,
                                 description:
                                 item.description??"", limit:  item.minimumLimit??"",
                                 // featuresTitle: "المميزات",
                                 // features: [
                                 //   "اختيار المنتجات الأساسية فقط.",
                                 //   "توصيل عادي في مدة تتراوح من 3 إلى 5 أيام عمل.",
                                 //   "خدمة عملاء عادية عبر البريد الإلكتروني.",
                                 // ],
                               ),
                             ))
                   ],
                 );
               }else{
                 return const CircularProgressIndicator();
               }
              },
            ),
             SizedBox(
              height: 30.h,
            ),
            BlocConsumer<UpdatePoliciesCubit,UpdatePoliciesState>(
              listener: (context, state) {
                if(state is UpdatePoliciesSuccess){
                  ScaffoldMessenger.of(context)
                      .showSnackBar(
                    SnackBar(
                      content: Text(
                          "تم اختيار السياسة!",
                          style: TextStyle(
                              color:
                              Colors.white)),
                      duration:
                      Duration(seconds: 2),
                      behavior: SnackBarBehavior
                          .floating, // makes it float above content
                      margin:
                      EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10),
                      backgroundColor:
                      Colors.green,
                      shape:
                      RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(
                            8),
                      ),
                    ),
                  );
                }

              },
              builder: (context, state) {
                if(state is UpdatePoliciesLoading){
                  return CircularProgressIndicator();
                }
              return SizedBox(
                width: 343.w, // Match the width of the TextField
                height: 50.h, // Standard button height
                child: ElevatedButton(

                  onPressed:selectedId!=null? () {
                    BlocProvider.of<UpdatePoliciesCubit>(context).getCartCheckout(policy_id: selectedId!);
                  }:null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: selectedId!=null?const Color(0XFF13A9CA):Colors.grey, // Button color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    "اختيار السياسة",
                    style: GoogleFonts.cairo(
                        textStyle: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.white)),
                  ),
                ),
              );
            },)
          ]),
        ),
      ),
    );
  }
}
