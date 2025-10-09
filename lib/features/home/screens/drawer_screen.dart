import 'package:engaz/features/as_you_like_order/screens/all_polices_screen.dart';
import 'package:engaz/features/cart/screens/first_cart_screen.dart';
import 'package:engaz/features/favorite/screens/favorite_screen.dart';
import 'package:engaz/features/forwardealing/screens/instruction_screen.dart';
import 'package:engaz/features/mypurchases/screens/my_purchases_screen.dart';
import 'package:engaz/features/notifications/screens/notifications_screen.dart';
import 'package:engaz/features/offers/screens/offeres_screen.dart';
import 'package:engaz/features/points/screens/points_screen.dart';
import 'package:engaz/features/settings/screens/all_settings_screen.dart';
import 'package:engaz/features/suggestions/screens/all_categorios_screen.dart';
import 'package:engaz/features/target/screens/target_screen.dart';
import 'package:engaz/features/tracking_order/screens/first_tracking_order_screen.dart';
import 'package:engaz/features/wallet/screens/wallet_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'main_home.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  bool _isTapped = false;
  bool _isTapped2 = false;
  bool _isTapped3 = false;
  bool _isTapped4 = false;
  bool _isTapped5 = false;
  bool _isTapped6 = false;
  bool _isTapped7 = false;
  bool _isTapped8 = false;
  bool _isTapped9 = false;
  bool _isTapped10 = false;
  bool _isTapped11 = false;
  bool _isTapped12 = false;
  bool _isTapped13 = false;
  bool _isTapped14 = false;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Image(image: AssetImage("assets/images/logo1 3@2x.png")),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isTapped = !_isTapped;
                    });
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MainHome()),
                    );
                  },
                  child: Row(
                    children: [
                      ColorFiltered(
                        colorFilter: _isTapped
                            ? const ColorFilter.mode(
                                Color(0xFF94CF29), BlendMode.srcIn)
                            : const ColorFilter.mode(
                                Color(0XFF7A7A7A), BlendMode.dstIn),
                        child: Image(
                          image: const AssetImage("assets/images/home-2.png"),
                          height: 24.h,
                          width: 24.w,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        "الرئيسية",
                        style: GoogleFonts.cairo(
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                          color: _isTapped
                              ? const Color(0xFF94CF29)
                              : const Color(0XFF7A7A7A), // Change color
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  height: 0.75,
                  width: double.infinity,
                  color: const Color(0XFF7A7A7A),
                ),
                SizedBox(
                  height: 10.h,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isTapped2 = !_isTapped2;
                    });
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FavoriteScreen()),
                    );
                  },
                  child: Row(
                    children: [
                      ColorFiltered(
                        colorFilter: _isTapped2
                            ? const ColorFilter.mode(
                                Color(0xFF94CF29), BlendMode.srcIn)
                            : const ColorFilter.mode(
                                Color(0XFF7A7A7A), BlendMode.dstIn),
                        child: Image(
                          image: const AssetImage(
                              "assets/images/heart-circle.png"),
                          height: 24.h,
                          width: 24.w,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        "المفضلة",
                        style: GoogleFonts.cairo(
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                          color: _isTapped2
                              ? const Color(0xFF94CF29)
                              : const Color(0XFF7A7A7A), // Change color
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  height: 0.75,
                  width: double.infinity,
                  color: const Color(0XFF7A7A7A),
                ),
                SizedBox(
                  height: 10.h,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isTapped3 = !_isTapped3;
                    });
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FirstTrackingOrderScreen()),
                    );
                  },
                  child: Row(
                    children: [
                      ColorFiltered(
                        colorFilter: _isTapped3
                            ? const ColorFilter.mode(
                                Color(0xFF94CF29), BlendMode.srcIn)
                            : const ColorFilter.mode(
                                Color(0XFF7A7A7A), BlendMode.dstIn),
                        child: Image(
                          image:
                              const AssetImage("assets/images/truck-time.png"),
                          height: 24.h,
                          width: 24.w,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        "متابعة الطلبات",
                        style: GoogleFonts.cairo(
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                          color: _isTapped3
                              ? const Color(0xFF94CF29)
                              : const Color(0XFF7A7A7A), // Change color
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  height: 0.75,
                  width: double.infinity,
                  color: const Color(0XFF7A7A7A),
                ),
                SizedBox(
                  height: 10.h,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isTapped4 = !_isTapped4;
                    });
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => OfferesScreen()),
                    );
                  },
                  child: Row(
                    children: [
                      ColorFiltered(
                        colorFilter: _isTapped4
                            ? const ColorFilter.mode(
                                Color(0xFF94CF29), BlendMode.srcIn)
                            : const ColorFilter.mode(
                                Color(0XFF7A7A7A), BlendMode.dstIn),
                        child: Image(
                          image: const AssetImage(
                              "assets/images/percentage-square.png"),
                          height: 24.h,
                          width: 24.w,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        " العروض",
                        style: GoogleFonts.cairo(
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                          color: _isTapped4
                              ? const Color(0xFF94CF29)
                              : const Color(0XFF7A7A7A), // Change color
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  height: 0.75,
                  width: double.infinity,
                  color: const Color(0XFF7A7A7A),
                ),
                SizedBox(
                  height: 10.h,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isTapped5 = !_isTapped5;
                    });
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FirstCartScreen()),
                    );
                  },
                  child: Row(
                    children: [
                      ColorFiltered(
                        colorFilter: _isTapped5
                            ? const ColorFilter.mode(
                                Color(0xFF94CF29), BlendMode.srcIn)
                            : const ColorFilter.mode(
                                Color(0XFF7A7A7A), BlendMode.dstIn),
                        child: Image(
                          image: const AssetImage("assets/images/Group 47.png"),
                          height: 24.h,
                          width: 24.w,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        " عربة التسوق",
                        style: GoogleFonts.cairo(
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                          color: _isTapped5
                              ? const Color(0xFF94CF29)
                              : const Color(0XFF7A7A7A), // Change color
                        ),
                      ),
                    ],
                  ),
                ),
                // SizedBox(
                //   height: 10.h,
                // ),
                // Container(
                //   height: 0.75,
                //   width: double.infinity,
                //   color: const Color(0XFF7A7A7A),
                // ),
                // SizedBox(
                //   height: 10.h,
                // ),
                // GestureDetector(
                //   onTap: () {
                //     setState(() {
                //       _isTapped6 = !_isTapped6;
                //     });
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(builder: (context) => WalletScreen()),
                //     );
                //   },
                //   child: Row(
                //     children: [
                //       ColorFiltered(
                //         colorFilter: _isTapped6
                //             ? const ColorFilter.mode(
                //                 Color(0xFF94CF29), BlendMode.srcIn)
                //             : const ColorFilter.mode(
                //                 Color(0XFF7A7A7A), BlendMode.dstIn),
                //         child: Image(
                //           image: const AssetImage(
                //             "assets/images/black_wallet.png",
                //           ),
                //           height: 24.h,
                //           width: 24.w,
                //         ),
                //       ),
                //       SizedBox(width: 10.w),
                //       Text(
                //         "  محفظة العميل",
                //         style: GoogleFonts.cairo(
                //           fontWeight: FontWeight.w500,
                //           fontSize: 16.sp,
                //           color: _isTapped6
                //               ? const Color(0xFF94CF29)
                //               : const Color(0XFF7A7A7A), // Change color
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                // SizedBox(
                //   height: 10.h,
                // ),
                // Container(
                //   height: 0.75,
                //   width: double.infinity,
                //   color: const Color(0XFF7A7A7A),
                // ),
                // SizedBox(
                //   height: 10.h,
                // ),
                // GestureDetector(
                //   onTap: () {
                //     setState(() {
                //       _isTapped7 = !_isTapped7;
                //     });
                //     Navigator.pop(context);
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(builder: (context) => TargetScreen()),
                //     );
                //   },
                //   child: Row(
                //     children: [
                //       ColorFiltered(
                //         colorFilter: _isTapped7
                //             ? const ColorFilter.mode(
                //                 Color(0xFF94CF29), BlendMode.srcIn)
                //             : const ColorFilter.mode(
                //                 Color(0XFF7A7A7A), BlendMode.dstIn),
                //         child: Image(
                //           image: const AssetImage("assets/images/chart.png"),
                //           height: 24.h,
                //           width: 24.w,
                //         ),
                //       ),
                //       SizedBox(width: 10.w),
                //       Text(
                //         "   اهداف العميل",
                //         style: GoogleFonts.cairo(
                //           fontWeight: FontWeight.w500,
                //           fontSize: 16.sp,
                //           color: _isTapped7
                //               ? const Color(0xFF94CF29)
                //               : const Color(0XFF7A7A7A), // Change color
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                // SizedBox(
                //   height: 10.h,
                // ),
                // Container(
                //   height: 0.75,
                //   width: double.infinity,
                //   color: const Color(0XFF7A7A7A),
                // ),
                // SizedBox(
                //   height: 10.h,
                // ),
                // GestureDetector(
                //   onTap: () {
                //     setState(() {
                //       _isTapped8 = !_isTapped8;
                //     });
                //     Navigator.pop(context);
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(builder: (context) => PointsScreen()),
                //     );
                //   },
                //   child: Row(
                //     children: [
                //       ColorFiltered(
                //         colorFilter: _isTapped8
                //             ? const ColorFilter.mode(
                //                 Color(0xFF94CF29), BlendMode.srcIn)
                //             : const ColorFilter.mode(
                //                 Color(0XFF7A7A7A), BlendMode.dstIn),
                //         child: Image(
                //           image:
                //               const AssetImage("assets/images/ticket-star.png"),
                //           height: 24.h,
                //           width: 24.w,
                //         ),
                //       ),
                //       SizedBox(width: 10.w),
                //       Text(
                //         "النقاط",
                //         style: GoogleFonts.cairo(
                //           fontWeight: FontWeight.w500,
                //           fontSize: 16.sp,
                //           color: _isTapped8
                //               ? const Color(0xFF94CF29)
                //               : const Color(0XFF7A7A7A), // Change color
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                // SizedBox(
                //   height: 10.h,
                // ),
                // Container(
                //   height: 0.75,
                //   width: double.infinity,
                //   color: const Color(0XFF7A7A7A),
                // ),
                // SizedBox(
                //   height: 10.h,
                // ),
                // GestureDetector(
                //   onTap: () {
                //     setState(() {
                //       _isTapped9 = !_isTapped9;
                //     });
                //     Navigator.pop(context);
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //           builder: (context) => InstructionScreen()),
                //     );
                //   },
                //   child: Row(
                //     children: [
                //       ColorFiltered(
                //         colorFilter: _isTapped9
                //             ? const ColorFilter.mode(
                //                 Color(0xFF94CF29), BlendMode.srcIn)
                //             : const ColorFilter.mode(
                //                 Color(0XFF7A7A7A), BlendMode.dstIn),
                //         child: Image(
                //           image: const AssetImage(
                //               "assets/images/Frame 859 (1).png"),
                //           height: 24.h,
                //           width: 24.w,
                //         ),
                //       ),
                //       SizedBox(width: 10.w),
                //       Text(
                //         "التعامل الاجل",
                //         style: GoogleFonts.cairo(
                //           fontWeight: FontWeight.w500,
                //           fontSize: 16.sp,
                //           color: _isTapped9
                //               ? const Color(0xFF94CF29)
                //               : const Color(0XFF7A7A7A), // Change color
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                // SizedBox(
                //   height: 10.h,
                // ),
                // Container(
                //   height: 0.75,
                //   width: double.infinity,
                //   color: const Color(0XFF7A7A7A),
                // ),
                // SizedBox(
                //   height: 10.h,
                // ),
                // GestureDetector(
                //   onTap: () {
                //     setState(() {
                //       _isTapped10 = !_isTapped10;
                //     });
                //
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //           builder: (context) => AllCategoriosScreen()),
                //     );
                //   },
                //   child: Row(
                //     children: [
                //       ColorFiltered(
                //         colorFilter: _isTapped10
                //             ? const ColorFilter.mode(
                //                 Color(0xFF94CF29), BlendMode.srcIn)
                //             : const ColorFilter.mode(
                //                 Color(0XFF7A7A7A), BlendMode.dstIn),
                //         child: Image(
                //           image: const AssetImage(
                //               "assets/images/hugeicons_complaint.png"),
                //           height: 24.h,
                //           width: 24.w,
                //         ),
                //       ),
                //       SizedBox(width: 10.w),
                //       Text(
                //         " الشكاوى و الاقتراحات",
                //         style: GoogleFonts.cairo(
                //           fontWeight: FontWeight.w500,
                //           fontSize: 16.sp,
                //           color: _isTapped10
                //               ? const Color(0xFF94CF29)
                //               : const Color(0XFF7A7A7A), // Change color
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  height: 0.75,
                  width: double.infinity,
                  color: const Color(0XFF7A7A7A),
                ),
                SizedBox(
                  height: 10.h,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isTapped11 = !_isTapped11;
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AllPolicesScreen()),
                    );
                  },
                  child: Row(
                    children: [
                      ColorFiltered(
                        colorFilter: _isTapped11
                            ? const ColorFilter.mode(
                                Color(0xFF94CF29), BlendMode.srcIn)
                            : const ColorFilter.mode(
                                Color(0XFF7A7A7A), BlendMode.dstIn),
                        child: Image(
                          image: const AssetImage(
                              "assets/images/as_you_like_icon.png"),
                          height: 24.h,
                          width: 24.w,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        "اوردرك على كيفك",
                        style: GoogleFonts.cairo(
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                          color: _isTapped11
                              ? const Color(0xFF94CF29)
                              : const Color(0XFF7A7A7A), // Change color
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  height: 0.75,
                  width: double.infinity,
                  color: const Color(0XFF7A7A7A),
                ),
                SizedBox(
                  height: 10.h,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isTapped12 = !_isTapped12;
                    });

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AllSettingsScreen()),
                    );
                  },
                  child: Row(
                    children: [
                      ColorFiltered(
                        colorFilter: _isTapped12
                            ? const ColorFilter.mode(
                                Color(0xFF94CF29), BlendMode.srcIn)
                            : const ColorFilter.mode(
                                Color(0XFF7A7A7A), BlendMode.dstIn),
                        child: Image(
                          image: const AssetImage("assets/images/Union.png"),
                          height: 24.h,
                          width: 24.w,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        "اعدادات الحساب",
                        style: GoogleFonts.cairo(
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                          color: _isTapped12
                              ? const Color(0xFF94CF29)
                              : const Color(0XFF7A7A7A), // Change color
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  height: 0.75,
                  width: double.infinity,
                  color: const Color(0XFF7A7A7A),
                ),
                SizedBox(
                  height: 10.h,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isTapped13 = !_isTapped13;
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NotificationsScreen()),
                    );
                  },
                  child: Row(
                    children: [
                      ColorFiltered(
                        colorFilter: _isTapped13
                            ? const ColorFilter.mode(
                                Color(0xFF94CF29), BlendMode.srcIn)
                            : const ColorFilter.mode(
                                Color(0XFF7A7A7A), BlendMode.dstIn),
                        child: Image(
                          image: const AssetImage(
                              "assets/images/notification.png"),
                          height: 24.h,
                          width: 24.w,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        " الإشعارات",
                        style: GoogleFonts.cairo(
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                          color: _isTapped13
                              ? const Color(0xFF94CF29)
                              : const Color(0XFF7A7A7A), // Change color
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  height: 0.75,
                  width: double.infinity,
                  color: const Color(0XFF7A7A7A),
                ),
                SizedBox(
                  height: 10.h,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isTapped14 = !_isTapped14;
                    });

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MyPurchasesScreen()),
                    );
                  },
                  child: Row(
                    children: [
                      ColorFiltered(
                        colorFilter: _isTapped14
                            ? const ColorFilter.mode(
                                Color(0xFF94CF29), BlendMode.srcIn)
                            : const ColorFilter.mode(
                                Color(0XFF7A7A7A), BlendMode.dstIn),
                        child: Image(
                          image: const AssetImage("assets/images/bag.png"),
                          height: 24.h,
                          width: 24.w,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        "مشترياتى",
                        style: GoogleFonts.cairo(
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                          color: _isTapped14
                              ? const Color(0xFF94CF29)
                              : const Color(0XFF7A7A7A), // Change color
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  height: 0.75,
                  width: double.infinity,
                  color: const Color(0XFF7A7A7A),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
