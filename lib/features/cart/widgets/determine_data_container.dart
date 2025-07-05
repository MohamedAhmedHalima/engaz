import 'package:engaz/features/cart/widgets/success_dialog.dart';
import 'package:engaz/features/cart/widgets/tracking_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../cubits/check_out/check_out_bloc.dart';
import 'data_and_day.dart';
 class DetermineDataContainer extends StatefulWidget {
   final bool initialVisibility;
   final String paymentSelectedValue;

   const DetermineDataContainer({
     Key? key,
     required this.initialVisibility, required this.paymentSelectedValue    }) : super(key: key);


  @override
  State<DetermineDataContainer> createState() => _DetermineDataContainerState();
}

class _DetermineDataContainerState extends State<DetermineDataContainer> {
    String ?selectedDayOptionValue;
    String ?selectedShiftOptionValue;
    String ?note;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TrackingBarInPayment(
          inactiveCircleColor: Color(0XFF13A9CA),
          activeCircleColor: Color(0XFF13A9CA),
          activeIcon: Icons.check,
          inactiveIcon: Icons.circle,
          lineColor: Color(0XFF13A9CA),
        ),
        SizedBox(
          height: 20.h,
        ),
        SelectDateTimeWidget(selectedValue: ( selectedDayOption,  selectedShiftOption,selectedNote) {
          selectedDayOptionValue=selectedDayOption;
          selectedShiftOptionValue=selectedShiftOption;
          note=selectedNote;
          setState(() {

          });
          print(note);
        },),
        SizedBox(
          height: 50.h,
        ),
        BlocConsumer<CheckOutCubit, CheckOutState>(
          listener: (context, state) {
            if(state is CheckOutSuccess){
              SuccessDialog(context);
            }
          },
          builder: (context, state) {
            if(state is CheckOutLoading){
              return CircularProgressIndicator();
            }
            return   Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextButton(
                onPressed:(selectedDayOptionValue!=null&&selectedShiftOptionValue!=null) ?() {
                  BlocProvider.of<CheckOutCubit>(context).getCartCheckout(date: selectedDayOptionValue!, note: note,payment_method: widget.paymentSelectedValue, delivery_shift: selectedShiftOptionValue!);
                }:null,
                style: TextButton.styleFrom(
                  backgroundColor:(selectedDayOptionValue!=null&&selectedShiftOptionValue!=null) ? const Color(0xFF13A9CA):Colors.grey, // Background color
                  minimumSize: const Size(double.infinity, 48), // Width is dynamic, height is fixed
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Border radius
                  ),
                ),
                child: Text(
                  "اتمام الطلب",
                  style: GoogleFonts.cairo(
                    textStyle: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.white, // Text color
                    ),
                  ),
                ),
              ),
            );
          },
        ),

      ],
    );
  }
}
