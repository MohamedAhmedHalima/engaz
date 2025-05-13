import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class HistoryCard extends StatelessWidget {
  const HistoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      width: 343.w,
      child: Card(
        color: Colors.white,
        elevation: 5.0,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            children: [
              Column(
                children: [Text("رقم الطلب"), Text("5454554")],
              ),
              Spacer(),
              Column(
                children: [Text("حاله الطلب"), Text("تم الالغاء")],
              ),
              Spacer(),
              Column(
                children: [Text("الاجمالى"), Text("1500 جنيه")],
              ),
              Spacer(),
              Column(
                children: [Text("التاريخ"), Text("21-7-2024")],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
