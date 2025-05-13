import 'package:engaz/features/chat/screens/sales_representative_chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../home/screens/drawer_screen.dart';
import '../../home/widgets/app_bar.dart';
import '../widgets/chat_type_item.dart';
import 'dlivery_man_chat_screen.dart';

class ChatTypesScreen extends StatelessWidget {
  static const String routeName = "ChatTypesScreen";
  const ChatTypesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        drawer: const CustomDrawer(),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomeAppBar(),
                SizedBox(
                  height: 10.h,
                ),
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
                      SizedBox(
                        width: 2.5.w,
                      ),
                      Text(
                        "الشات",
                        style: GoogleFonts.cairo(
                            textStyle: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w500,
                                color: const Color(0XFF94CF29))),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                GestureDetector(
                  child: const ChatTypeItem(
                      image: "assets/images/customer_services.png",
                      text: "خدمة عملاء"),
                ),
                SizedBox(
                  height: 20.h,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SalesRepresentative()),
                    );
                  },
                  child: const ChatTypeItem(
                    text: "مندوب مبيعات",
                    image: "assets/images/sales_representative.png",
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DliveryManChatScreen()),
                    );
                  },
                  child: const ChatTypeItem(
                    image: "assets/images/delivery-man.png",
                    text: "مندوب التوصيل",
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
