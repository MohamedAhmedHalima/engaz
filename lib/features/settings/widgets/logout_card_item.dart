import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/network/shared_preferences.dart';
import '../../auth/login/screens/login_screen.dart';
class LogoutCardItem extends StatelessWidget {
  const LogoutCardItem({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: (){

      SharedPreferencesHelper.removeToken().then((value) {
        SharedPreferencesHelper.removeUser().then((value) {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute<void>(builder: (BuildContext context) => LoginScreen()),
                (Route<void> route) => false,
          );
        });

      });
    },child: Card(
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
              Image.asset("assets/images/logout.png"),
              SizedBox(
                width: 10.w,
              ),
              Text(
                "تسجيل الخروج",
                style: GoogleFonts.cairo(
                    textStyle: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: const Color(0XFFD42828))),
              ),
            ],
          ),
        ),
      ),)
    );
  }
}
