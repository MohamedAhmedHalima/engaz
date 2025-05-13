import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/sending_button.dart';
import '../widgets/system_message.dart';
import '../widgets/user_message.dart';

class DisplayChatScreen extends StatelessWidget {
  static const String routeName = "DisplayChatScreen";
  final String name;
  final String imagePath;

  const DisplayChatScreen({
    super.key,
    required this.name,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController messageController = TextEditingController();

    return Scaffold(
      backgroundColor: const Color(0XFFE7FBFF),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color(0XFF13A9CA),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              name,
              style: GoogleFonts.cairo(
                textStyle: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0XFF94CF29)),
              ),
            ),
            SizedBox(width: 10.w),
            CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage(imagePath),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  UserMessage(),
                  SizedBox(height: 20.h),
                  SystemMessage(),
                ],
              ),
            ),
          ),
          MessageInput(
            onSend: () {
              // Implement send message logic
              print("Message Sent: ${messageController.text}");
              messageController.clear();
            },
            onGallerySelect: () {
              // Implement gallery select logic
              print("Gallery Icon Pressed");
            },
            controller: messageController,
          ),
        ],
      ),
    );
  }
}
