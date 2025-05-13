import 'package:flutter/material.dart';

class TrackingBarInPayment extends StatelessWidget {
  final Color activeCircleColor;
  final Color inactiveCircleColor;
  final Color lineColor;
  final Color activeInSideColor;
  final Color inactiveInsideColor;
  final Color iconColor;
  final IconData activeIcon;
  final IconData inactiveIcon;

  const TrackingBarInPayment({
    Key? key,
    this.iconColor = const Color(0XFFFDFDFD),
    this.activeInSideColor = const Color(0XFF13A9CA),
    this.inactiveInsideColor = const Color(0XFF13A9CA),
    this.activeCircleColor = const Color(0XFF13A9CA),
    this.inactiveCircleColor = const Color(0XFFB9B6B6),
    this.lineColor = const Color(0XFFB9B6B6),
    this.activeIcon = Icons.circle_sharp,
    this.inactiveIcon = Icons.circle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            color: activeInSideColor,
            shape: BoxShape.circle,
            border: Border.all(color: activeCircleColor),
          ),
          child: Icon(activeIcon, size: 15, color: iconColor),
        ),
        Container(
          height: 2,
          width: 240,
          color: lineColor,
        ),
        Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            border: Border.all(color: inactiveCircleColor),
            shape: BoxShape.circle,
          ),
          child: Icon(inactiveIcon, size: 15, color: inactiveCircleColor),
        ),
      ],
    );
  }
}
