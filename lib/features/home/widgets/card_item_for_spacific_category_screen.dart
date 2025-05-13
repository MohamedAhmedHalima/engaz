import 'package:engaz/features/home/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../like_as_products/screens/products_screen.dart';
import '../screens/details_screen.dart';

class CardItemForSpecificCategoryScreen extends StatefulWidget {
  final Products product;
  const CardItemForSpecificCategoryScreen({super.key, required this.product});

  @override
  State<CardItemForSpecificCategoryScreen> createState() =>
      _CardItemForSpecificCategoryScreenState();
}

class _CardItemForSpecificCategoryScreenState
    extends State<CardItemForSpecificCategoryScreen> {
  bool _isExpanded = false;
  bool _isSelected = false;
  String _selectedOption = "كرتونة = 12 علبة";

  void _toggleExpansion() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  void _toggleImage() {
    setState(() {
      _isSelected = !_isSelected;
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
            mainAxisExtent: _isExpanded
                ? 360.h
                : 320.h, // Change height based on _isExpanded
          ),
          itemCount: 10,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailsScreen(
                            product: widget.product,
                          )),
                );
              },
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
                              MaterialPageRoute(
                                  builder: (context) => ProductsScreen()),
                            );
                          },
                          child: const Image(
                              image: AssetImage(
                                  "assets/images/refresh-circle.png")),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    const Image(
                        image: AssetImage("assets/images/image 77.png")),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                        style:
                                            GoogleFonts.cairo(fontSize: 10.sp),
                                      ),
                                    ),
                                    DropdownMenuItem(
                                      value: "علبة",
                                      child: Text(
                                        "علبة",
                                        style:
                                            GoogleFonts.cairo(fontSize: 10.sp),
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
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 40.h,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
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
              ),
            );
          },
        ),
      ),
    );
  }
}
