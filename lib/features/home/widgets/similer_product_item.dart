import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../like_as_products/screens/products_screen.dart';

class SimilerProductItem extends StatefulWidget {
  @override
  State<SimilerProductItem> createState() => _BSimilerProductItemState();
}

class _BSimilerProductItemState extends State<SimilerProductItem> {
  bool _isExpanded = false;
  bool _isSelected = false;

  String _selectedOption = "كرتونة = 12 علبة";

  void _toggleImage() {
    setState(() {
      _isSelected = !_isSelected;
    });
  }

  void _toggleExpansion() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _isExpanded ? 370.h : 262.h,
      width: 230.w,
      child: Card(
        color: Colors.white,
        elevation: 5.0,
        child: Column(
          children: [
            SizedBox(height: 5.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 20.h,
                  width: 56.w,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        bottomLeft: Radius.circular(16)),
                    color: Color(0XFFF1DBB3),
                  ),
                  child: Center(
                    child: Text(
                      "خارج الخصم",
                      style: GoogleFonts.cairo(
                        textStyle: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(0XFF121212),
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProductsScreen()),
                    );
                  },
                  child: const Image(
                      image: AssetImage("assets/images/refresh-circle.png")),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            const Image(image: AssetImage("assets/images/image 77.png")),
            SizedBox(height: 10.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Text(
                    "جبن ابيض بالزيتون",
                    style: GoogleFonts.cairo(
                      textStyle: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0XFF121212),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Container(
                height: _isExpanded ? 90.h : 36.h,
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0XFF13A9CA), width: 1),
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 4, vertical: 3),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            _selectedOption,
                            style: GoogleFonts.cairo(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          GestureDetector(
                            onTap: _toggleExpansion,
                            child: const Image(
                              image: AssetImage(
                                  'assets/images/arrow-circle-down.png'),
                            ),
                          ),
                        ],
                      ),
                      if (_isExpanded)
                        DropdownButton<String>(
                          value: _selectedOption,
                          underline: const SizedBox(),
                          items: [
                            DropdownMenuItem(
                              value: "كرتونة = 12 علبة",
                              child: Text(
                                "كرتونة = 12 علبة",
                                style: GoogleFonts.cairo(fontSize: 10.sp),
                              ),
                            ),
                            DropdownMenuItem(
                              value: "علبة",
                              child: Text(
                                "علبة",
                                style: GoogleFonts.cairo(fontSize: 10.sp),
                              ),
                            ),
                          ],
                          onChanged: (value) {
                            setState(() {
                              _selectedOption = value!;
                              _isExpanded = false;
                            });
                          },
                        ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                children: [
                  Text(
                    " 200 EGP ",
                    style: GoogleFonts.cairo(
                        textStyle: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(0XFF13A9CA))),
                  ),
                  Text(
                    " EGP 240 ",
                    style: GoogleFonts.cairo(
                        textStyle: const TextStyle(
                            fontSize: 10,
                            decoration: TextDecoration.lineThrough,
                            color: Color(0XFFB9B6B6),
                            decorationThickness: 1.2)),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: 40.h,
                  width: 170.w,
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          backgroundColor: const Color(0xFF13A9CA),
                          padding: EdgeInsets.symmetric(vertical: 12.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "اضف إلى عربة التسوق",
                              style: GoogleFonts.cairo(
                                textStyle: TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Container(
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(4),
                                  topLeft: Radius.circular(4),
                                  bottomLeft: Radius.circular(4),
                                  bottomRight: Radius.circular(1),
                                ),
                                color: Colors.white,
                              ),
                              height: 16.h,
                              width: 16.w,
                              child: const Center(
                                child: Icon(
                                  Icons.add,
                                  size: 15,
                                  color: Color(0xFF13A9CA),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                ),
                GestureDetector(
                    onTap: _toggleImage,
                    child: Image(
                        image: AssetImage(
                      _isSelected
                          ? "assets/images/fav.png"
                          : "assets/images/heart.png",
                    ))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
