import 'package:engaz/features/auth/reset_password/controller/cubit/forget_password_cubit.dart';
import 'package:engaz/features/auth/reset_password/view/post_code_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class EnterPhoneNumberScreen extends StatelessWidget {
  static const String routeName = "EnterPhoneNumberScreen";
  final TextEditingController email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
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
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Color(0XFF13A9CA),
            ),
          )),
      body: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
        listener: (context, state) {
          if (state is ForgetPasswordSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  "تم ارسال الكود ",
                  style: GoogleFonts.cairo(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
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
                builder: (context) => PostCodeScreen(
                  email: email.text,
                ),
              ),
            );
          } else if (state is ForgetPasswordError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  "يوجد خطأ",
                  style: GoogleFonts.cairo(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                backgroundColor: const Color.fromARGB(
                    255, 76, 54, 244), // Red background for errors
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
          return SingleChildScrollView(
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "ادخل رقم الهاتف المربوط بحسابك لإستلام الرقم السرى المؤقت",
                    style: GoogleFonts.cairo(
                      textStyle: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0XFF121212),
                      ),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "رقم الهاتف",
                      style: GoogleFonts.cairo(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: const Color(0XFF121212),
                      ), // Use appropriate font size
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
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide:
                            const BorderSide(color: Colors.grey), // Gray border
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
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'يرجي ادخال رقم الهاتف'; // Validation message in Arabic
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 20.h),
                if (state is ForgetPasswordLoading)
                  CircularProgressIndicator(), // Show loading indicator

                SizedBox(height: 55.h),
                ElevatedButton(
                  onPressed: () {
                    if (email.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('برجاء ادخال رقم الهاتف'),
                          backgroundColor: Colors.orange, // A warning color
                        ),
                      );
                      return;
                    }
                    ForgetPasswordCubit.get(context).sendOtp(email: email.text);
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
          );
        },
      ),
    );
  }
}
