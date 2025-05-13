import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class SeeMoreContainer extends StatefulWidget {
  const SeeMoreContainer({super.key});

  @override
  State<SeeMoreContainer> createState() => _SeeMoreContainerState();
}

class _SeeMoreContainerState extends State<SeeMoreContainer> {
  bool _isExpanded = false;
  void _toggleExpansion() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        height: _isExpanded ? 50.h : 50.h,
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0XFF13A9CA), width: 1),
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 3),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "كرتونة = 12 علبة",
                    style: GoogleFonts.cairo(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  GestureDetector(
                    onTap: _toggleExpansion,
                    child: const Image(
                      image: AssetImage('assets/images/arrow-circle-down.png'),
                    ),
                  ),
                ],
              ),
              if (_isExpanded)
                Padding(
                  padding: const EdgeInsets.only(top: 3.0),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      " (سعر العلبة =eGP 20)",
                      // Additional text when expanded
                      style: GoogleFonts.cairo(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0XFF94CF29),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
