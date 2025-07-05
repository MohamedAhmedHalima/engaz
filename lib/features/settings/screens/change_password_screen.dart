import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../home/screens/drawer_screen.dart';
import '../../home/widgets/app_bar.dart';
import '../controller/get_user_data/cubit/get_user_data_cubit.dart';
import '../controller/update_user_data/cubit/update_user_data_cubit.dart';
import '../model/get_user_data_model.dart';
import '../widgets/cutome_text_field.dart';

 class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  static const String routeName = "ChangePasswordScreen";
 late UserData userModl;
  @override
  void initState() {
    GetUserDataCubit.get(context).getUserData();
    super.initState();
  }
  final TextEditingController currentPass = TextEditingController();
  final TextEditingController newPass = TextEditingController();
  final TextEditingController confirmPass = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const CustomDrawer(),
      body: BlocConsumer<GetUserDataCubit, GetUserDataState>(
        listener: (context, state) {
          if (state is GetUserDataSuccess) {
            userModl=state.userModl;
            // Navigator.pushReplacement(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => LoginScreen(),
            //   ),
            // );
          }
          if (state is GetUserDataError) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(
                  state.message!,
                )));
          }
        },
        builder: (context, state) {
          if(state is GetUserDataSuccess){

            return Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                  EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
                  child: Column(
                    children: [
                      CustomeAppBar(),
                      SizedBox(height: 20.h),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: const Icon(
                                Icons.arrow_back_ios,
                                color: Color(0XFF13A9CA),
                              ),
                            ),
                            Text(
                              "تغيير كلمة المرور",
                              style: GoogleFonts.cairo(
                                textStyle: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0XFF94CF29),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      CustomTextFieldWithLabel(
                        labelText: "كلمة المرور الجديدة",
                        controller: newPass,
                        isPassword: true,
                      ),
                      CustomTextFieldWithLabel(
                        labelText: "تأكيد كلمة المرور الجديدة",
                        controller: confirmPass,
                        isPassword: true,
                      ),
                      SizedBox(
                        height: 80.h,
                      ),
                      SizedBox(height: 20.h),
                      // somewhere in your build(), e.g. after the image picker / before the Sign Up button:


                      SizedBox(height: 15.h),



                  BlocConsumer<UpdateUserDataCubit, UpdateUserDataState>(
                    listener: (context, state) {
                      if (state is UpdateUserDataSuccess) {
                        // Navigator.pushReplacement(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => LoginScreen(),
                        //   ),
                        // );
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                              "تم تغير كلمه المرور بنجاح",
                            )));
                      }
                      if (state is UpdateUserDataError) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                              state.message!,
                            )));
                      }
                    },
                    builder: (context, state) {
                      if(state is UpdateLocationLoading){
                        return CircularProgressIndicator();
                      }
                      return  ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState?.validate() ??
                              false) {
                            UpdateUserDataCubit.get(context).signUp(
                                nameClient:  userModl.name??"",
                                phone:  userModl.firstPhone??"",
                                location:  userModl.location??"",
                                otherPhone:  userModl.secondPhone??"",
                                governorate: userModl.governorate!.id!.toString(),
                                City:  userModl.city!.id!.toString(),
                                District: userModl.county!.id!.toString(),
                                storeName: userModl.marketName??"",
                                businessType:  userModl.activityType??"",
                                password: newPass.text,
                                password_confirmation: confirmPass.text,
                              images: []
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                          const Color(0XFF13A9CA), // Button color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                10.0), // Rounded corners
                          ),
                          fixedSize: const Size(343, 48),
                        ),
                        child: Text(
                          "تغير كلمه المرور",
                          style: GoogleFonts.cairo(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0XFFFDFCFC)),
                        ),
                      );
                    },
                      ),
                      const SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ),
              ),
            );
          }
          else{
            return const Center(child: CircularProgressIndicator(),);
          }
        },
      ),
    );
  }
}
