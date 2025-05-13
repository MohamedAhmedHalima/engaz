import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../home/screens/drawer_screen.dart';
import '../../home/widgets/app_bar.dart';
import '../widgets/chat_card_item.dart';
import '../widgets/search_bar.dart';
import 'display_chat_screen.dart';

class DliveryManChatScreen extends StatelessWidget {
  static const String routeName = "DliveryManChatScreen";

  const DliveryManChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const CustomDrawer(),
      body: SafeArea(
        child: Column(
          children: [
            CustomeAppBar(),
            SizedBox(height: 10.h),
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
                  SizedBox(width: 2.5.w),
                  Text(
                    "شات مندوب التوصيل",
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
            SizedBox(height: 20.h),
            CustomeSearchBarInChat(),
            Expanded(
              child: ListView.separated(
                itemCount: 20,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // Navigate to the ChatDetailScreen with name and image
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DisplayChatScreen(
                            name:
                                "محمد عمر", // Replace with dynamic name if needed
                            imagePath:
                                "assets/images/chat_person.png", // Replace with dynamic image path if needed
                          ),
                        ),
                      );
                    },
                    child: const ChatCardItem(
                      imagePath: "assets/images/chat_person.png",
                      message: "شكرا لك! , انا فى طريقى اليك",
                      name: "محمد عمر",
                      time: "4:30",
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: 30.h); // Space between items
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
