import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../home/screens/drawer_screen.dart';
import '../../home/widgets/app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/the_complaine_field.dart';

class SuggestionScreen extends StatelessWidget {
  static const String routeName = "SuggestionScreen";
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const CustomDrawer(),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(children: [
            const CustomeAppBar(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
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
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    "الاقتراحات",
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                "لا تترد فى اخبارنا اى اقتراح يدور فى ذهنك لنتمكن من خدمتك بشكل افضل",
                style: GoogleFonts.cairo(
                    textStyle: TextStyle(
                        fontSize: 16.sp, fontWeight: FontWeight.w400)),
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            CustomTextFieldWithButton(
              controller: _textController,
              buttonText: 'ارسال',
              onButtonPressed: () {},
            )
          ]),
        ));
  }
}
