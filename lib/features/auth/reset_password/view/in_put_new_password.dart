import 'package:engaz/features/auth/reset_password/controller/cubit/reset_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'last_screen.dart';

class InPutNewPassword extends StatefulWidget {
  static const String routeName = "InPutNewPassword";
  final String otp;

  const InPutNewPassword({super.key, required this.otp});
  @override
  State<InPutNewPassword> createState() => _InPutNewPasswordState();
}

class _InPutNewPasswordState extends State<InPutNewPassword> {
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();

  bool isPasswordVisible = false;

  bool isConfirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
      listener: (context, state) {
        if (state is ResetPasswordSuccess) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => LastScreen()));
        }
        if (state is ResetPasswordError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                state.message,
                style: GoogleFonts.cairo(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              backgroundColor: const Color.fromARGB(255, 244, 54, 79),
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
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.white,
            title: Text(
              "استرجاع كلمة المرور",
              style: GoogleFonts.cairo(
                textStyle: TextStyle(
                  color: const Color(0XFF94CF29),
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            leading: const Icon(
              Icons.arrow_back_ios,
              color: Color(0XFF13A9CA),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 40.h,
                  ),
                  const Center(
                      child: Image(
                          image: AssetImage(
                              "assets/images/reset_password_image.png"))),
                  Text(
                    "ادخل كلمة مرور جديدة لحسابك",
                    style: GoogleFonts.cairo(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16.sp,
                            color: Color(0XFF121212))),
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  // Align(
                  //   alignment: Alignment.centerRight,
                  //   child: Text(
                  //     " البريد الالكتروني",
                  //     style: GoogleFonts.cairo(
                  //       fontSize: 16.sp,
                  //       fontWeight: FontWeight.w500,
                  //       color: const Color(0XFF121212),
                  //     ), // Use appropriate font size
                  //   ),
                  // ),
                  SizedBox(height: 10.h),
                  // SizedBox(
                  //   height: 55.h,
                  //   width: 343.w,
                  //   child: TextFormField(
                  //     controller: email,
                  //     textAlign: TextAlign.right,
                  //     decoration: InputDecoration(
                  //       border: OutlineInputBorder(
                  //         borderRadius: BorderRadius.circular(10.0),
                  //         borderSide: const BorderSide(
                  //             color: Colors.grey), // Gray border
                  //       ),
                  //       enabledBorder: OutlineInputBorder(
                  //         borderRadius: BorderRadius.circular(10.0),
                  //         borderSide: const BorderSide(
                  //             color: Colors.grey), // Gray border when enabled
                  //       ),
                  //       focusedBorder: OutlineInputBorder(
                  //         borderRadius: BorderRadius.circular(10.0),
                  //         borderSide: const BorderSide(
                  //             color: Colors.grey), // Gray border when focused
                  //       ),
                  //     ),
                  //     validator: (value) {
                  //       if (value == null || value.isEmpty) {
                  //         return 'يرجى إدخال  البريد الالكتروني'; // Validation message in Arabic
                  //       }
                  //       return null;
                  //     },
                  //   ),
                  // ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "كلمة المرور",
                      style: GoogleFonts.cairo(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: const Color(0XFF121212),
                      ), // Use appropriate font size
                    ),
                  ),
                  SizedBox(height: 10.h),
                  SizedBox(
                    height: 55.h,
                    width: 343.w,
                    child: TextFormField(
                      controller: password,
                      obscureText: !isPasswordVisible,
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                                color: Colors.grey), // Gray border
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                                color: Colors.grey), // Gray border when enabled
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                                color: Colors.grey), // Gray border when focused
                          ),
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  isPasswordVisible = !isPasswordVisible;
                                });
                              },
                              icon: Icon(isPasswordVisible
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined))),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'يرجى إدخال كلمه المرور'; // Validation message in Arabic
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "تأكيد كلمة المرور",
                      style: GoogleFonts.cairo(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: const Color(0XFF121212),
                      ), // Use appropriate font size
                    ),
                  ),
                  SizedBox(height: 10.h),
                  SizedBox(
                    height: 55.h,
                    width: 343.w,
                    child: TextFormField(
                      obscureText: !isConfirmPasswordVisible,
                      controller: confirmPassword,
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                                color: Colors.grey), // Gray border
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                                color: Colors.grey), // Gray border when enabled
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                                color: Colors.grey), // Gray border when focused
                          ),
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  isConfirmPasswordVisible =
                                      !isConfirmPasswordVisible;
                                });
                              },
                              icon: Icon(isConfirmPasswordVisible
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined))),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'يرجى إدخال كلمه المرور'; // Validation message in Arabic
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      ResetPasswordCubit.get(context).resetPassword(
                          otp: widget.otp,
                          password: password.text,
                          confirmPassword: confirmPassword.text);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0XFF13A9CA), // Button color
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(10.0), // Rounded corners
                      ),
                      fixedSize: const Size(343, 50),
                    ),
                    child: Text(
                      " استرجاع كلمة المرور",
                      style: GoogleFonts.cairo(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(0XFFFDFCFC)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
