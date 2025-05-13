import 'package:engaz/features/auth/login/screens/login_screen.dart';
import 'package:engaz/features/auth/reset_password/view/in_put_new_password.dart';
import 'package:engaz/features/auth/sign_up/controller/resend_opt_cubit/cubit/resend_otp_cubit.dart';
import 'package:engaz/features/auth/verify_email/controller/cubit/verify_email_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class VerifyEmail extends StatelessWidget {
  static const String routeName = "VerifyEmail";
  final String email;
  final int id ;
  final TextEditingController code = TextEditingController();
  VerifyEmail({super.key, required this.email, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VerifyEmailCubit, VerifyEmailState>(
      listener: (context, state) {
        if (state is VerifyEmailSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.verifyEmailModel.message)),
          );
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute<void>(builder: (BuildContext context) => LoginScreen()),
                (Route<void> route) => false,
          );
        } else
        if (state is VerifyEmailError) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message??"",)));
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            title: Text(
              "تأكيد الحساب",
              style: GoogleFonts.cairo(
                textStyle: TextStyle(
                  color: const Color(0XFF94CF29),
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 40.h,
                ),
                const Center(
                  child: Image(
                    image: AssetImage("assets/images/reset_password_image.png"),
                  ),
                ),
                Text(
                  "  ادخل الكود المرسل  ",
                  style: GoogleFonts.cairo(
                    textStyle: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0XFF121212),
                    ),
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 35.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: SizedBox(
                    height: 64.h,
                    width: 280.w,
                    child: TextFormField(
                      controller: code,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(7),
                        FilteringTextInputFormatter.digitsOnly,
                        TextInputFormatter.withFunction((oldValue, newValue) {
                          String newText = newValue.text.replaceAll('-', '');
                          if (newValue.text.length >= oldValue.text.length) {
                            final buffer = StringBuffer();
                            for (int i = 0; i < newText.length; i++) {
                              buffer.write(newText[i]);

                              if (i < newText.length - 1) buffer.write('-');
                            }
                            return TextEditingValue(
                              text: buffer.toString(),
                              selection: TextSelection.collapsed(
                                  offset: buffer.length),
                            );
                          }
                          return newValue;
                        }),
                      ],
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.0),
                          borderSide: const BorderSide(
                              color: Color(0XFFB9B6B6), width: 1.5),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(
                              color: Color(0XFFB9B6B6), width: 1.5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(
                              color: Color(0XFFB9B6B6), width: 1.5),
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 7.h),
                      ),
                      textAlign: TextAlign.center,
                      style: GoogleFonts.cairo(
                        textStyle: TextStyle(
                          fontSize: 32.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 60.h),
                ElevatedButton(
                  onPressed: () {
                    String otp = code.text;
                    if (otp.length == 4) {
                      VerifyEmailCubit.get(context).verifyEmail(
                        id: id,
                        otp: otp,
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please enter a 4-digit OTP'),
                        ),
                      );
                    }
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
                    "    تأكيد الحساب",
                    style: GoogleFonts.cairo(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0XFFFDFCFC)),
                  ),
                ),
                SizedBox(height: 20.h),
                BlocConsumer<ResendOtpCubit, ResendOtpState>(
                  listener: (context, state) {
                    if (state is ResendOtpSuccess) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('تم اعاده ارسال الكود')),
                      );
                    } else if (state is ResendOtpError) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "تم اعاده الارسال   ",
                            style: GoogleFonts.cairo(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                          backgroundColor:
                              Colors.green, // Green background for success
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(15.0), // Rounded corners
                          ),
                          behavior: SnackBarBehavior.floating, // Floating style
                          margin: EdgeInsets.all(
                              10.0), // Margin around the SnackBar
                          elevation: 10.0, // Shadow for depth
                          duration:
                              Duration(seconds: 4), // Duration for display
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    return GestureDetector(
                      onTap: () {
                        ResendOtpCubit.get(context)
                            .resendOtp(phone: email,id: id);
                      },
                      child: Text(
                        "اعاده ارسال الكود",
                        style: GoogleFonts.cairo(
                          textStyle: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: Color(0XFF13A9CA),
                            decoration: TextDecoration.underline,
                            decorationColor: Color(0XFF13A9CA),
                          ),
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
