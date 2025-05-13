import 'package:engaz/features/home/screens/main_export.dart';
import 'package:engaz/features/target/widgets/progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProgressBarWithTarget extends StatefulWidget {
  const ProgressBarWithTarget({super.key});

  @override
  State<ProgressBarWithTarget> createState() => _ProgressBarWithTargetState();
}

class _ProgressBarWithTargetState extends State<ProgressBarWithTarget> {
  final _progressBarKey = GlobalKey<LinearProgressBarState>();
  double _currentProgress = 0.0;
  void _updateProgressBasedOnMouse(PointerEvent details, BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final relativeX = details.localPosition.dx.clamp(0.0, screenWidth);
    final newProgress = relativeX / screenWidth;

    setState(() {
      _currentProgress = newProgress;
      _progressBarKey.currentState?.updateProgress(_currentProgress);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "الحافز: ${(_currentProgress * 100).toStringAsFixed(0)}%",
          style:
              GoogleFonts.cairo(fontSize: 14, color: const Color(0XFF94CF29)),
        ),
        SizedBox(
          height: 20.h,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 270,
                    height: 15,
                    child: MouseRegion(
                      onHover: (details) =>
                          _updateProgressBasedOnMouse(details, context),
                      child: LinearProgressBar(
                        key: _progressBarKey,
                        initialProgress: _currentProgress,
                        color: const Color(0XFF13A9CA),
                        backgroundColor: Colors.grey[300]!,
                        endImagePath: 'assets/images/target_icon.png',
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "0EGP",
                      style: GoogleFonts.cairo(
                          textStyle: TextStyle(
                              fontSize: 10.sp, fontWeight: FontWeight.w500)),
                    ),
                    Text("2000EGP",
                        style: GoogleFonts.cairo(
                            textStyle: TextStyle(
                                fontSize: 10.sp, fontWeight: FontWeight.w500))),
                    Text("5000EGP",
                        style: GoogleFonts.cairo(
                            textStyle: TextStyle(
                                fontSize: 10.sp, fontWeight: FontWeight.w500))),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
