import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/network/shared_preferences.dart';
import '../../auth/sign_up/model/sign_up_model.dart';
import '../../chat/screens/chat_types_screen.dart';
import '../screens/main_home.dart';

class CustomeAppBar extends StatefulWidget {
  const CustomeAppBar({Key? key}) : super(key: key);

  @override
  State<CustomeAppBar> createState() => _CustomeAppBarState();
}

class _CustomeAppBarState extends State<CustomeAppBar> {
  @override
  void initState() {
    // getName();
    super.initState();
  }
  // getName()async{
  //   await SharedPreferencesHelper.getUser();
  //   // TODO: implement initState
  // }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: FutureBuilder<UserData?>(
        // 1. Don’t await here—just pass the Future.
        future: SharedPreferencesHelper.getUser(),
        builder: (context, snapshot) {
          // 2. Loading state
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          // 3. Error state
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          // 4. Data state
          final user = snapshot.data;
          return Row(
            children: [
              IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => ChatTypesScreen()),
                ),
                child: Image.asset(
                  "assets/images/chat_icon.png",
                  height: 20.h,
                  width: 20.w,
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      // 5. Safely unwrap name (or show empty string)
                      user?.marketName ?? "",
                      style: GoogleFonts.cairo(
                        textStyle: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(width: 5.w),
                    const Icon(Icons.location_on_outlined, size: 20),
                  ],
                ),
              ),
              SizedBox(width: 10.w),
              InkWell(
                onTap: (){
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => MainHome()),
                        (Route<dynamic> route) => false,
                  );
                },
                child: Image.asset(
                  "assets/images/logo.png",
                  height: 30.h,
                  width: 43.w,
                ),
              )
            ],
          );
        },
      ),
    );

  }
}
