import 'package:engaz/features/tracking_order/widgets/re_order_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../model/traking_order_model.dart';
import 'Stepper_order.dart';
import 'edit_cancel_buttons.dart';


class TrackingOrderCard extends StatefulWidget {
  final OrderModel model;
  const TrackingOrderCard({Key? key, required this.model}) : super(key: key);

  @override
  State<TrackingOrderCard> createState() => _TrackingOrderCardState();
}

class _TrackingOrderCardState extends State<TrackingOrderCard> {
  int activeStep = 0;
  @override
  void initState() {
    // TODO: implement initState
    // activeStep =widget.model.status;
    getActiveStep(widget.model.status!);
    super.initState();
  }
    getActiveStep(String status){
      switch (status) {
        case "inprogress":
          activeStep =1;
          break;
        case "shipped":
          activeStep = 2;
          break;
        case "delivered":
          activeStep = 3;
          break;
        case "cancled":
          activeStep = 4;
          break;
        default://ordered
          activeStep = 0;
          break;
      }
  }
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(5.r),
    child: Card(
      color: activeStep!=4?Colors.white:Colors.grey[200],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: Colors.grey, width: 0.25),
        ),
        child: Padding(padding: EdgeInsets.all(15.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              activeStep!=4?
              StepperOrder(activeStep: activeStep,)
              :
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [  Container(
            height: 30.h,
            width: 70.w,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16)),
              color: Color(0XFFF1DBB3),
            ),
            child: Center(
              child:  Text(
                "تم الالغاء",
                style: GoogleFonts.cairo(
                  textStyle: TextStyle(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
          )],
        ),



              // Order Number
              RichText(
                text: TextSpan(
                  text: 'رقم الطلب: ',
                  style: GoogleFonts.cairo(
                    textStyle: TextStyle(
                      color: const Color(0XFF7A7A7A),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  children: [
                    TextSpan(
                      text: '${widget.model.orderNumber}',
                      style: GoogleFonts.cairo(
                        textStyle: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5.h),
              // Order Time
              RichText(
                text: TextSpan(
                  text: 'الوقت: ',
                  style: GoogleFonts.cairo(
                    textStyle: TextStyle(
                      color: const Color(0XFF7A7A7A),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  children: [
                    TextSpan(
                      text: '${widget.model.createdAt}',
                      style: GoogleFonts.cairo(
                        textStyle: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5.h),
              // Price Info
              Row(
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'السعر قبل الخصم: ',
                      style: GoogleFonts.cairo(
                        textStyle: TextStyle(
                          color: const Color(0XFF7A7A7A),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      children: [
                        TextSpan(
                          text: '${widget.model.totalBeforeDiscount} EGP',
                          style: GoogleFonts.cairo(
                            textStyle: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: const Color(0XFF121212),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 20.w),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0XFFDBEFB8),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 16.h,
                    child: Center(
                      child: Text(
                        "خصم${widget.model.discountAmount}ج",
                        style: GoogleFonts.cairo(
                          textStyle: TextStyle(
                            fontSize: 8.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5.h),
              // Total Price
              RichText(
                text: TextSpan(
                  text: 'اجمالى السعر: ',
                  style: GoogleFonts.cairo(
                    textStyle: TextStyle(
                      color: const Color(0XFF7A7A7A),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  children: [
                    TextSpan(
                      text: '${widget.model.totalAfterDiscount} EGP',
                      style: GoogleFonts.cairo(
                        textStyle: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),)
    ),);
  }
}
