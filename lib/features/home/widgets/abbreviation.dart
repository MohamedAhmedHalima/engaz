import 'package:engaz/features/home/widgets/offer_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'bundles_screen.dart';

class Abbreviation extends StatelessWidget {
  const Abbreviation({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(children: [
        Align(
          alignment: Alignment.topRight,
          child: Text(
            "الاختصارات",
            style: GoogleFonts.cairo(
              textStyle: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18.sp,
              ),
            ),
          ),
        ),
        SizedBox(height: 10.h,),
        Row(
          children: [
            // First circular image container with text
            InkWell(
              onTap: (){

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BundlesScreen(titleName: 'باقات التوفير',),
                  ),
                );
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 48.h,
                    width: 48.w,
                    decoration: BoxDecoration(
                      color: Colors.white, // Background color
                      shape: BoxShape.circle, // Circular shape
                      border: Border.all(
                        color: Colors.grey, // Border color
                        width: .5, // Border width
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5), // Shadow color
                          spreadRadius: 1,
                          blurRadius: 7,
                          offset: Offset(0, 2), // Shadow position
                        ),
                      ],
                    ),
                    child: Center( // Center the image within the container
                      child: ClipOval(
                        child: Container(
                          height: 32.h, // Adjust this value to control image size
                          width: 32.w, // Adjust this value to control image size
                          child: Image.asset(
                            "assets/images/Group 18308.png", // Your image path
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 8.h), // Spacing between the image and text
                  Text(
                      'باقات التوفير', // Change this to your desired text
                      style: GoogleFonts.cairo(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400
                      ) // Adjust text size as needed
                  ),
                ],
              ),
            ),
            SizedBox(width: 20.w), // Add spacing between images if needed

            // Second circular image container with text
            InkWell(
              onTap: (){

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OfferProduct(titleName: ' منتجات جديدة', getProductesEndpoint: "products?category_id="),
                  ),
                );
              },
              child:  Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 48.h,
                    width: 48.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.grey,
                        width: .5,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 7,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Center(
                      child: ClipOval(
                        child: Container(
                          height: 32.h, // Adjust this value to control image size
                          width: 32.w, // Adjust this value to control image size
                          child: Image.asset(
                            "assets/images/Group.png", // Your image path
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                      ' منتجات جديدة',
                      style: GoogleFonts.cairo(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400
                      ) // Adjust text size as needed
                  ),
                ],
              ),
            )

            // Add more circular containers with text as needed
          ],
        ),

      ]),
    );
  }
}
