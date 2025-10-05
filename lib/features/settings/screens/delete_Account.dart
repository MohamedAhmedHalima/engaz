import 'package:engaz/features/settings/controller/delete_account/cubit/delete_account_cubit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/network/shared_preferences.dart';
import '../../auth/login/screens/login_screen.dart';
class DeleteAccountItem extends StatelessWidget {
  const DeleteAccountItem({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => DeleteAccountCubit(),
    child: BlocBuilder<DeleteAccountCubit,DeleteAccountState>(
     builder: (context, state) {
       if(state is DeleteAccountSuccess){
         SharedPreferencesHelper.removeToken().then((value) {
           SharedPreferencesHelper.removeUser().then((value) {
             Navigator.of(context).pushAndRemoveUntil(
               MaterialPageRoute<void>(builder: (BuildContext context) => LoginScreen()),
                   (Route<void> route) => false,
             );
           });

         });
       }else if(state is DeleteAccountLoading){
         return CircularProgressIndicator();
       }
       return InkWell(onTap: (){DeleteAccountCubit.get(context).DeleteAccount();},child: Card(
         elevation: 5.0,
         color: Colors.white,
         child: Container(
           width: 343.w,
           height: 50.h,
           decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(10),
             border: Border.all(color: Colors.grey, width: 0.5),
           ),
           child: Padding(
             padding: const EdgeInsets.symmetric(horizontal: 15),
             child: Row(
               children: [
                 const Icon(Icons.delete,color: Colors.red,),
                 SizedBox(
                   width: 10.w,
                 ),
                 Text(
                   "حذف الحساب",
                   style: GoogleFonts.cairo(
                       textStyle: TextStyle(
                           fontSize: 16.sp,
                           fontWeight: FontWeight.w500,
                           color: const Color(0XFFD42828))),
                 ),
               ],
             ),
           ),
         ),));
     },
    ));
  }
}
