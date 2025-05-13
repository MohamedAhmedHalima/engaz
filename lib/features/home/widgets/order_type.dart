import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class OrderType extends StatelessWidget {
  const OrderType({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0XFF13A9CA),
              ),
              borderRadius: BorderRadius.circular(4)),
          height: 61.h,
          width: 163.w,
          child: Stack(
            children: [
              const Positioned(
                  top: 5,
                  child: Image(
                      image: AssetImage("assets/images/order_type_1.png"))),
              Positioned(
                  top: 4,
                  right: 60,
                  child: Text(
                    "طلبية",
                    style: GoogleFonts.cairo(
                        textStyle: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color(0XFF13A9CA))),
                  )),
              Positioned(
                  top: 25,
                  right: 60,
                  child: Text(
                    "اقل حد ادنى للطلب",
                    style: GoogleFonts.cairo(
                        textStyle: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(0XFF121212))),
                  ))
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color(0XFFE6E4E4),
            ),
            borderRadius: BorderRadius.circular(4),
            color: const Color(0XFFE6E4E4),
          ),
          height: 61.h,
          width: 163.w,
          child: Stack(
            children: [
              const Positioned(
                  top: 17,
                  right: 10,
                  child: Image(
                      image: AssetImage("assets/images/order_type_2.png"))),
              Positioned(
                  top: 7,
                  right: 45,
                  child: Text(
                    "طلبية جولد",
                    style: GoogleFonts.cairo(
                        textStyle: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color(0XFF7A7A7A))),
                  )),
              Positioned(
                  top: 30,
                  right: 45,
                  child: Text(
                    "طلبية اكبر سعر احسن",
                    style: GoogleFonts.cairo(
                        textStyle: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(0XFF7A7A7A))),
                  ))
            ],
          ),
        ),
      ],
    );
  }
}
