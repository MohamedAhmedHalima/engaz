import 'package:engaz/core/network/shared_preferences.dart';
import 'package:engaz/features/auth/login/controller/login_cubit.dart';
import 'package:engaz/features/auth/reset_password/view/enter_phone_number_screen.dart';
import 'package:engaz/features/home/screens/main_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../sign_up/view/screens/sign_up_screen.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = "LoginScreen";

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "تسجيل الدخول",
          style: GoogleFonts.cairo(
            textStyle: TextStyle(
              color: const Color(0XFF94CF29),
              fontSize: 24.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        // leading: GestureDetector(
        //   onTap: () {
        //     Navigator.pop(context);
        //   },
        //   child: const Icon(
        //     Icons.arrow_back_ios,
        //     color: Color(0XFF13A9CA),
        //   ),
        // ),
      ),
      body: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) async {
          if (state is LoginSuccess) {
            String? token = await SharedPreferencesHelper.getToken();
            SharedPreferencesHelper.saveToken(
                state.loginModel.data!.accessToken.toString());
            if (token != null) {
              print('token $token');
            } else {
              print('No token');
            }
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  "تم التسجيل بنجاح",
                  style: GoogleFonts.cairo(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                backgroundColor: Colors.green, // Green background for success
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0), // Rounded corners
                ),
                behavior: SnackBarBehavior.floating, // Floating style
                margin: EdgeInsets.all(10.0), // Margin around the SnackBar
                elevation: 10.0, // Shadow for depth
                duration: Duration(seconds: 4), // Duration for display
              ),
            );

            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => MainHome(),
              ),
            );
          }
          else if (state is LoginError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  "برجاء التاكد من البيانات ",
                  style: GoogleFonts.cairo(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.white, // White text for contrast
                  ),
                ),
                backgroundColor: Colors.red, // Red background for errors
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0), // Rounded corners
                ),
                behavior: SnackBarBehavior.floating, // Floating style
                margin: EdgeInsets.all(10.0), // Margin around the SnackBar
                elevation: 10.0, // Shadow for depth
                duration: Duration(seconds: 4), // Duration for display
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is LoginLoading) {
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Color(0XFF13A9CA)),
              ),
            );
          }
          return Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 50.h),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "رقم الهاتف",
                        style: GoogleFonts.cairo(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: const Color(0XFF121212),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    SizedBox(
                      height: 55.h,
                      width: 343.w,
                      child: TextFormField(
                        controller: email,
                        textAlign: TextAlign.right,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'يرجى ادخال الهاتف ';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "كلمه المرور",
                        style: GoogleFonts.cairo(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: const Color(0XFF121212),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    SizedBox(
                      height: 55.h,
                      width: 343.w,
                      child: TextFormField(
                        controller: password,
                        obscureText: true,
                        textAlign: TextAlign.right,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'يرجى إدخال كلمة المرور';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Align(
                      alignment: Alignment.topLeft,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                              context, EnterPhoneNumberScreen.routeName);
                        },
                        child: Text(
                          "نسيت كلمة المرور",
                          style: GoogleFonts.cairo(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: Color(0XFF13A9CA),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 50.h),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          if (password.text.isEmpty || email.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('برجاء ادخال البيانات'),
                                backgroundColor:
                                    Colors.orange, // A warning color
                              ),
                            );
                            return;
                          }
                          LoginCubit.get(context).logIn(
                              email: email.text, password: password.text);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0XFF13A9CA),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        fixedSize: const Size(343, 50),
                      ),
                      child: Text(
                        "تسجيل الدخول",
                        style: GoogleFonts.cairo(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(0XFFFDFCFC)),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    InkWell(
                      onTap: (){    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SignUpScreen()),
                      );},
                      child:  Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: "ليس لديك حساب ؟ ",
                              style: GoogleFonts.cairo(
                                  textStyle: TextStyle(
                                      color: const Color(0XFFBCBCBC),
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500)),
                            ),
                            TextSpan(
                              text: "سجل الان",
                              style: GoogleFonts.cairo(
                                  textStyle: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0XFF13A9CA),
                                      decoration: TextDecoration.underline,
                                      decorationColor: Color(0XFF13A9CA),
                                      decorationThickness: 1.5)),
                            ),
                          ],
                        ),
                        textDirection: TextDirection.rtl,
                      ),
                    )

                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
