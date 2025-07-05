// import 'package:engaz/features/home/screens/main_export.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// import '../../home/widgets/custome_search_bar.dart';
// import 'order_card_Item.dart';
// import 'order_details.dart';
//
// class TrackingOrderTabs extends StatefulWidget {
//   final int initialTabIndex;
//
//   const TrackingOrderTabs({super.key, this.initialTabIndex = 2});
//
//   @override
//   _TrackingOrderTabsState createState() => _TrackingOrderTabsState();
// }
//
// class _TrackingOrderTabsState extends State<TrackingOrderTabs>
//     with SingleTickerProviderStateMixin {
//   late TabController _tabController;
//
//   // @override
//   // void didChangeDependencies() {
//   //   super.didChangeDependencies();
//   //   _tabController = TabController(
//   //       length: 4, vsync: this, initialIndex: widget.initialTabIndex);
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         title: Text(
//           "Order Details",
//           style: GoogleFonts.cairo(
//             textStyle: TextStyle(
//               color: const Color(0XFF94CF29),
//               fontSize: 24.sp,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//         ),
//         leading: GestureDetector(
//           onTap: () {
//             Navigator.pop(context);
//           },
//           child: const Icon(
//             Icons.arrow_back_ios,
//             color: Color(0XFF13A9CA),
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             const CustomeSearchBar(),
//             SizedBox(height: 30.h),
//
//         //    Column(
//         //   children: [
//         //     Padding(
//         //       padding: const EdgeInsets.symmetric(horizontal: 15.0),
//         //       child: IgnorePointer(
//         //         // ignoring: true,
//         //         child: TabBar(
//         //           controller: _tabController,
//         //           labelColor: Colors.blue,
//         //           unselectedLabelColor: Colors.grey,
//         //           indicatorColor: Colors.blue,
//         //           tabs: const [
//         //             Tab(text: "تم الطلب"),
//         //             Tab(text: "قيد التجهيز"),
//         //             Tab(text: "فى الطريق"),
//         //             Tab(text: "تم التوصيل"),
//         //           ],
//         //         ),
//         //       ),
//         //     ),
//         //     const SizedBox(height: 15.0),
//         //     Expanded(child:  TabBarView(
//         //       controller: _tabController,
//         //       // physics: const NeverScrollableScrollPhysics(),
//         //       children: [
//         //         ListView.builder(
//         //           itemCount: 5,
//         //           itemBuilder: (context, index) {
//         //             return const Center(child: OrderCardItem());
//         //           },
//         //         ),
//         //         ListView.builder(
//         //           itemCount: 7,
//         //           itemBuilder: (context, index) {
//         //             return const Center(
//         //                 child: OrderCardItem(
//         //                   showEditCancelButtons: false,
//         //                   showDriverName: false,
//         //                   showDriverNumber: false,
//         //                 ));
//         //           },
//         //         ),
//         //         ListView.builder(
//         //           itemCount: 7,
//         //           itemBuilder: (context, index) {
//         //             return const Center(
//         //                 child: OrderCardItem(
//         //                   showEditCancelButtons: false,
//         //                   showDriverName: true,
//         //                   showDriverNumber: true,
//         //                 ));
//         //           },
//         //         ),
//         //         ListView.builder(
//         //           itemCount: 7,
//         //           itemBuilder: (context, index) {
//         //             return const Center(
//         //                 child: OrderCardItem(
//         //                   showEditCancelButtons: false,
//         //                   showDriverName: false,
//         //                   showDriverNumber: false,
//         //                   showReOrderButton: true,
//         //                 ));
//         //           },
//         //         ),
//         //       ],
//         //     ),)
//         //   ],
//         // )
//           ],
//         ),
//       ),
//     );
//
//
//   }
//
//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }
// }
