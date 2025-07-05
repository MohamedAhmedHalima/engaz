// import 'package:engaz/features/tracking_order/widgets/re_order_button.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import '../../home/widgets/custome_search_bar.dart';
// import '../model/traking_order_model.dart';
// import 'edit_cancel_buttons.dart';
//
// class OrderCardItem extends StatefulWidget {
//   final bool showEditCancelButtons;
//   final bool showDriverName;
//   final bool showDriverNumber;
//   final bool showReOrderButton;
//   final OrderLine ?model;
//
//   const OrderCardItem({
//     super.key,
//     this.model,
//     this.showReOrderButton = false,
//     this.showEditCancelButtons = true,
//     this.showDriverName = false,
//     this.showDriverNumber = false,
//   });
//
//   @override
//   _OrderCardItemState createState() => _OrderCardItemState();
// }
//
// class _OrderCardItemState extends State<OrderCardItem> {
//   int _quantity = 12;
//
//   void _increment() {
//     setState(() {
//       _quantity++;
//     });
//   }
//
//   void _decrement() {
//     setState(() {
//       if (_quantity > 1) {
//         _quantity--;
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return    Column(
//       children: [
//         Container(
//           width: 343.w,
//           height: 457.h,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(8),
//             border: Border.all(color: Colors.grey, width: 0.25),
//           ),
//           child: Stack(
//             children: [
//               Positioned(
//                 top: 8,
//                 right: 5,
//                 child: Container(
//                   height: 80,
//                   width: 75,
//                   decoration: BoxDecoration(
//                     color: const Color(0XFFB0E2ED),
//                     borderRadius: BorderRadius.circular(4),
//                   ),
//                   child: Image.network(widget.model!.product!.images![0]),
//                 ),
//               ),
//               Positioned(
//                 top: 15,
//                 right: 90,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     // Order Number
//                     RichText(
//                       text: TextSpan(
//                         text: 'رقم الطلب: ',
//                         style: GoogleFonts.cairo(
//                           textStyle: TextStyle(
//                             color: const Color(0XFF7A7A7A),
//                             fontSize: 16.sp,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                         children: [
//                           TextSpan(
//                             text: '552254',
//                             style: GoogleFonts.cairo(
//                               textStyle: TextStyle(
//                                 fontSize: 16.sp,
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(height: 20.h),
//                     // Order Time
//                     RichText(
//                       text: TextSpan(
//                         text: 'الوقت: ',
//                         style: GoogleFonts.cairo(
//                           textStyle: TextStyle(
//                             color: const Color(0XFF7A7A7A),
//                             fontSize: 16.sp,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                         children: [
//                           TextSpan(
//                             text: 'السبت 26-10-2024 7 مساءا',
//                             style: GoogleFonts.cairo(
//                               textStyle: TextStyle(
//                                 fontSize: 16.sp,
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(height: 25.h),
//                     // Price Info
//                     Row(
//                       children: [
//                         RichText(
//                           text: TextSpan(
//                             text: 'السعر قبل الخصم: ',
//                             style: GoogleFonts.cairo(
//                               textStyle: TextStyle(
//                                 color: const Color(0XFF7A7A7A),
//                                 fontSize: 16.sp,
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                             children: [
//                               TextSpan(
//                                 text: '2000 EGP',
//                                 style: GoogleFonts.cairo(
//                                   textStyle: TextStyle(
//                                     fontSize: 16.sp,
//                                     fontWeight: FontWeight.w500,
//                                     color: const Color(0XFF121212),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         SizedBox(width: 20.w),
//                         Container(
//                           decoration: BoxDecoration(
//                             color: const Color(0XFFDBEFB8),
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           height: 16.h,
//                           child: Center(
//                             child: Text(
//                               "خصم 500 ج",
//                               style: GoogleFonts.cairo(
//                                 textStyle: TextStyle(
//                                   fontSize: 8.sp,
//                                   fontWeight: FontWeight.w400,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 20.h),
//                     // Total Price
//                     RichText(
//                       text: TextSpan(
//                         text: 'اجمالى السعر: ',
//                         style: GoogleFonts.cairo(
//                           textStyle: TextStyle(
//                             color: const Color(0XFF7A7A7A),
//                             fontSize: 16.sp,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                         children: [
//                           TextSpan(
//                             text: '1500 EGP',
//                             style: GoogleFonts.cairo(
//                               textStyle: TextStyle(
//                                 fontSize: 16.sp,
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     // Order Details
//                     Text(
//                       "تفاصيل الطلب:",
//                       style: GoogleFonts.cairo(
//                         textStyle: TextStyle(
//                           color: const Color(0XFF7A7A7A),
//                           fontSize: 16.sp,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                     ),
//                     Row(
//                       children: [
//                         Text(
//                           "كرتونة لبن المراعى",
//                           style: GoogleFonts.cairo(
//                             textStyle: TextStyle(
//                               fontSize: 16.sp,
//                               fontWeight: FontWeight.w500,
//                               color: const Color(0XFF13A9CA),
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: 10.h),
//                         Text(
//                           " (كرتونة=12 علبة , سعر العلبة= 20 EGP, الاجمالى=240 EGP)",
//                           style: GoogleFonts.cairo(
//                             textStyle: TextStyle(
//                               fontSize: 16.sp,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//               if (widget.showEditCancelButtons)
//                 const Positioned(
//                   bottom: 10,
//                   right: 5,
//                   child: EditCancelButtons(),
//                 ),
//               if (widget.showDriverName)
//                 Positioned(
//                   bottom: 50,
//                   right: 100,
//                   child: Text(
//                     "اسم المندوب: محمد احمد",
//                     style: GoogleFonts.cairo(
//                       textStyle: TextStyle(
//                         fontSize: 16.sp,
//                         fontWeight: FontWeight.w500,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ),
//                 ),
//               if (widget.showDriverNumber)
//                 Positioned(
//                   bottom: 30,
//                   right: 100,
//                   child: Text(
//                     "رقم المندوب: 01012345678",
//                     style: GoogleFonts.cairo(
//                       textStyle: TextStyle(
//                         fontSize: 16.sp,
//                         fontWeight: FontWeight.w500,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ),
//                 ),
//               if (widget.showReOrderButton)
//                 Positioned(
//                   bottom: 10,
//                   left: 5,
//                   child: const ReorderButton(),
//                 ),
//             ],
//           ),
//         ),
//       ],
//     );
//
//   }
// }
//
