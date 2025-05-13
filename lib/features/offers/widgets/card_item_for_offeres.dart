import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CardItemForOfferes extends StatefulWidget {
  const CardItemForOfferes({super.key});

  @override
  State<CardItemForOfferes> createState() => CardItemForOfferesState();
}

class CardItemForOfferesState extends State<CardItemForOfferes> {
  bool _isExpanded = false;
  bool _isSelected = false;

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
    return SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 1.0,
            mainAxisSpacing: 1,
            mainAxisExtent: 350.h,
          ),
          itemCount: 10,
          itemBuilder: (context, index) {
            return Card(
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
                        onTap: () {},
                        child: const Image(
                            image:
                                AssetImage("assets/images/refresh-circle.png")),
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
                      height: _isExpanded ? 50.h : 36.h,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color(0XFF13A9CA), width: 1),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 4, vertical: 3),
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
                                    image: AssetImage(
                                        'assets/images/arrow-circle-down.png'),
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
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 40.h,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: GestureDetector(
                              onTap: () {},
                              child: Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xFF13A9CA),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                padding: EdgeInsets.symmetric(vertical: 12.h),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceBetween, // Adjust alignment
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
                                    SizedBox(
                                      width: 10
                                          .w, // Adjusted width for smaller screens
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
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: _toggleImage,
                        child: Image(
                          image: AssetImage(
                            _isSelected
                                ? "assets/images/fav.png"
                                : "assets/images/heart.png",
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
