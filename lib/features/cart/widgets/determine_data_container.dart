import 'package:engaz/features/cart/widgets/success_dialog.dart';
import 'package:engaz/features/cart/widgets/tracking_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'data_and_day.dart';
class DetermineDataContainer extends StatelessWidget {
  final bool initialVisibility;
  final VoidCallback onButtonPressed;

  const DetermineDataContainer({
    Key? key,
    required this.initialVisibility,
    required this.onButtonPressed,
  }) : super(key: key);

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
        SelectDateTimeWidget(),
        SizedBox(
          height: 50.h,
        ),
        Container(
          color: Colors.white,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextButton(
                onPressed: () {
                  SuccessDialog(context);
                },
                style: TextButton.styleFrom(
                  backgroundColor: const Color(0xFF13A9CA),
                  minimumSize: const Size(double.infinity, 48),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  "اتمام الطلب",
                  style: GoogleFonts.cairo(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
