import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:html/parser.dart' show parse;

import '../../../core/network/shared.dart';
import '../../home/widgets/custome_search_bar.dart';
import '../model/traking_order_model.dart';
import 'edit_cancel_buttons.dart';
import 'order_card_Item.dart';

class OrderCardItem extends StatefulWidget {
  final bool showEditCancelButtons;
  final bool showDriverName;
  final bool showDriverNumber;
  final bool showReOrderButton;
  final OrderModel  model;

  const OrderCardItem({
    super.key,
    required this.model,
    this.showReOrderButton = false,
    this.showEditCancelButtons = true,
    this.showDriverName = false,
    this.showDriverNumber = false,
  });

  @override
  _OrderCardItemState createState() => _OrderCardItemState();
}

class _OrderCardItemState extends State<OrderCardItem> {
  bool updateOrder=true;
  List<ProductUpdate> updatesList=[];

  @override
  void initState() {
    // TODO: implement initState
    widget.model!.lines!.forEach((item){
      updatesList.add(ProductUpdate(quantity:item.productQuantity,productId: item.product!.id));
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Order Details",
          style: GoogleFonts.cairo(
            textStyle: TextStyle(
              color: const Color(0XFF94CF29),
              fontSize: 24.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Color(0XFF13A9CA),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
              CustomeSearchBar(),
            SizedBox(height: 10.h),
            TrackingOrderCard(model: widget.model!,),
            SizedBox(height: 10.h),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount:  widget.model!.lines!.length, // Number of items
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                  EdgeInsets.only(bottom: 10.h), // Space between items
                  child:  OrderCard(model: widget.model!.lines![index],isEdit: updateOrder, onValueChanged: (int value) {
                    updatesList =[];
                    widget.model!.lines!.forEach((item){
                      print(value);
                      if(widget.model!.lines![index].product!.id==item.product!.id){
                        updatesList.add(ProductUpdate(quantity:value,productId: item.product!.id));
                      }else{
                        updatesList.add(ProductUpdate(quantity:item.productQuantity,productId: item.product!.id));
                      }
                    });
                  },
                    onTap: () {
                    updatesList =[];
                    widget.model!.lines!.forEach((item){

                      if(widget.model!.lines![index].product!.id==item.product!.id){

                       }else{
                        updatesList.add(ProductUpdate(quantity:item.productQuantity,productId: item.product!.id));
                      }
                    });
                    widget.model!.lines!.removeWhere((item)=>widget.model!.lines![index].product!.id==item.product!.id);
                     setState(() {

                     });
                   },),
                );
              },
            ),
            // Column(
            //   children: [
            //     Container(
            //       width: 343.w,
            //       height: 457.h,
            //       decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(8),
            //         border: Border.all(color: Colors.grey, width: 0.25),
            //       ),
            //       child: Stack(
            //         children: [
            //           Positioned(
            //             top: 8,
            //             right: 5,
            //             child: Container(
            //               height: 80,
            //               width: 75,
            //               decoration: BoxDecoration(
            //                 color: const Color(0XFFB0E2ED),
            //                 borderRadius: BorderRadius.circular(4),
            //               ),
            //               child: Image.network(widget.model!.product!.images![0]),
            //             ),
            //           ),
            //           Positioned(
            //             top: 15,
            //             right: 90,
            //             child: Column(
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               children: [
            //                 // Order Number
            //                 RichText(
            //                   text: TextSpan(
            //                     text: 'رقم الطلب: ',
            //                     style: GoogleFonts.cairo(
            //                       textStyle: TextStyle(
            //                         color: const Color(0XFF7A7A7A),
            //                         fontSize: 16.sp,
            //                         fontWeight: FontWeight.w500,
            //                       ),
            //                     ),
            //                     children: [
            //                       TextSpan(
            //                         text: '552254',
            //                         style: GoogleFonts.cairo(
            //                           textStyle: TextStyle(
            //                             fontSize: 16.sp,
            //                             fontWeight: FontWeight.w500,
            //                           ),
            //                         ),
            //                       ),
            //                     ],
            //                   ),
            //                 ),
            //                 SizedBox(height: 20.h),
            //                 // Order Time
            //                 RichText(
            //                   text: TextSpan(
            //                     text: 'الوقت: ',
            //                     style: GoogleFonts.cairo(
            //                       textStyle: TextStyle(
            //                         color: const Color(0XFF7A7A7A),
            //                         fontSize: 16.sp,
            //                         fontWeight: FontWeight.w500,
            //                       ),
            //                     ),
            //                     children: [
            //                       TextSpan(
            //                         text: 'السبت 26-10-2024 7 مساءا',
            //                         style: GoogleFonts.cairo(
            //                           textStyle: TextStyle(
            //                             fontSize: 16.sp,
            //                             fontWeight: FontWeight.w500,
            //                           ),
            //                         ),
            //                       ),
            //                     ],
            //                   ),
            //                 ),
            //                 SizedBox(height: 25.h),
            //                 // Price Info
            //                 Row(
            //                   children: [
            //                     RichText(
            //                       text: TextSpan(
            //                         text: 'السعر قبل الخصم: ',
            //                         style: GoogleFonts.cairo(
            //                           textStyle: TextStyle(
            //                             color: const Color(0XFF7A7A7A),
            //                             fontSize: 16.sp,
            //                             fontWeight: FontWeight.w500,
            //                           ),
            //                         ),
            //                         children: [
            //                           TextSpan(
            //                             text: '2000 EGP',
            //                             style: GoogleFonts.cairo(
            //                               textStyle: TextStyle(
            //                                 fontSize: 16.sp,
            //                                 fontWeight: FontWeight.w500,
            //                                 color: const Color(0XFF121212),
            //                               ),
            //                             ),
            //                           ),
            //                         ],
            //                       ),
            //                     ),
            //                     SizedBox(width: 20.w),
            //                     Container(
            //                       decoration: BoxDecoration(
            //                         color: const Color(0XFFDBEFB8),
            //                         borderRadius: BorderRadius.circular(10),
            //                       ),
            //                       height: 16.h,
            //                       child: Center(
            //                         child: Text(
            //                           "خصم 500 ج",
            //                           style: GoogleFonts.cairo(
            //                             textStyle: TextStyle(
            //                               fontSize: 8.sp,
            //                               fontWeight: FontWeight.w400,
            //                             ),
            //                           ),
            //                         ),
            //                       ),
            //                     ),
            //                   ],
            //                 ),
            //                 SizedBox(height: 20.h),
            //                 // Total Price
            //                 RichText(
            //                   text: TextSpan(
            //                     text: 'اجمالى السعر: ',
            //                     style: GoogleFonts.cairo(
            //                       textStyle: TextStyle(
            //                         color: const Color(0XFF7A7A7A),
            //                         fontSize: 16.sp,
            //                         fontWeight: FontWeight.w500,
            //                       ),
            //                     ),
            //                     children: [
            //                       TextSpan(
            //                         text: '1500 EGP',
            //                         style: GoogleFonts.cairo(
            //                           textStyle: TextStyle(
            //                             fontSize: 16.sp,
            //                             fontWeight: FontWeight.w500,
            //                           ),
            //                         ),
            //                       ),
            //                     ],
            //                   ),
            //                 ),
            //                 // Order Details
            //                 Text(
            //                   "تفاصيل الطلب:",
            //                   style: GoogleFonts.cairo(
            //                     textStyle: TextStyle(
            //                       color: const Color(0XFF7A7A7A),
            //                       fontSize: 16.sp,
            //                       fontWeight: FontWeight.w500,
            //                     ),
            //                   ),
            //                 ),
            //                 Row(
            //                   children: [
            //                     Text(
            //                       "كرتونة لبن المراعى",
            //                       style: GoogleFonts.cairo(
            //                         textStyle: TextStyle(
            //                           fontSize: 16.sp,
            //                           fontWeight: FontWeight.w500,
            //                           color: const Color(0XFF13A9CA),
            //                         ),
            //                       ),
            //                     ),
            //                     SizedBox(height: 10.h),
            //                     Text(
            //                       " (كرتونة=12 علبة , سعر العلبة= 20 EGP, الاجمالى=240 EGP)",
            //                       style: GoogleFonts.cairo(
            //                         textStyle: TextStyle(
            //                           fontSize: 16.sp,
            //                           fontWeight: FontWeight.w500,
            //                         ),
            //                       ),
            //                     ),
            //                   ],
            //                 ),
            //               ],
            //             ),
            //           ),
            //           if (widget.showEditCancelButtons)
            //             const Positioned(
            //               bottom: 10,
            //               right: 5,
            //               child: EditCancelButtons(),
            //             ),
            //           if (widget.showDriverName)
            //             Positioned(
            //               bottom: 50,
            //               right: 100,
            //               child: Text(
            //                 "اسم المندوب: محمد احمد",
            //                 style: GoogleFonts.cairo(
            //                   textStyle: TextStyle(
            //                     fontSize: 16.sp,
            //                     fontWeight: FontWeight.w500,
            //                     color: Colors.black,
            //                   ),
            //                 ),
            //               ),
            //             ),
            //           if (widget.showDriverNumber)
            //             Positioned(
            //               bottom: 30,
            //               right: 100,
            //               child: Text(
            //                 "رقم المندوب: 01012345678",
            //                 style: GoogleFonts.cairo(
            //                   textStyle: TextStyle(
            //                     fontSize: 16.sp,
            //                     fontWeight: FontWeight.w500,
            //                     color: Colors.black,
            //                   ),
            //                 ),
            //               ),
            //             ),
            //           if (widget.showReOrderButton)
            //             Positioned(
            //               bottom: 10,
            //               left: 5,
            //               child: const ReorderButton(),
            //             ),
            //         ],
            //       ),
            //     ),
            //   ],
            // )
          if(widget.model.status!.contains("ordered"))...[  SizedBox(height: 10.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                EditCancelButtons(onTap: (){
                  setState(() {

                  });
                  updateOrder=!updateOrder;
                }, updatesList:updatesList, id: widget.model!.orderNumber!,),
              ],
            ),],
            SizedBox(height: 10.h,)
          ],
        ),
      ),
    );
  }
}

class OrderCard extends StatefulWidget {
  final OrderLine model;
  final bool isEdit;  final ValueChanged<int> onValueChanged;
  final Function()  onTap;
  const OrderCard({Key? key,required this.model,this.isEdit=false, required this.onValueChanged, required this.onTap,}) : super(key: key);

  @override
  State<OrderCard> createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {

  String stripHtmlTags(String htmlString) {
    final document = parse(htmlString);
    return document.body?.text ?? '';
  }
  int number =1;
  @override
  void initState() {
    // TODO: implement initState
    number = widget.model.productQuantity??1;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Card(
      color:Colors.white,child: Column(
      children: [
        Row(
          children: [
            Container(
              margin: const EdgeInsets.all(4),
              height: 75.h,
              width: 71.w,

              child:   CachedNetworkImage(
                cacheManager: MyImageCacheManager.instance,  imageUrl: widget.model.product!.images!.length > 0
                    ? widget.model.product!.images![0] ?? ""
                    : widget.model.product!.image ?? "",
                height: 75.h,
                width: 71.w,
                placeholder: (context, url) => Center(
                  child: SizedBox(
                    width: 24.r,
                    height: 24.r,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                ),
                errorWidget: (context, url, error) =>
                const Icon(Icons.error),
              ),
            ),
            const Spacer(),
            Column(
              children: [
                Text(
                  widget.model.product!.name ?? "",
                  style: GoogleFonts.cairo(
                      textStyle:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500)),
                ),
                Text(
                 "  العدد = $number ",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 16),
                )
              ],
            ),
            const Spacer(),
            // if(!widget.isEdit)
            // InkWell(
            //   onTap:widget.onTap,
            //   child: const Image(image: AssetImage("assets/images/Delete 2.png")),
            // ),
            SizedBox(
              width: 10.w,
            )
          ],
        ),
        SizedBox(height: 5.h,),

        Text("${widget.model.product!.price} EGP"),
        SizedBox(height: 10.h,),
        if(!widget.isEdit)...[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 40.h,
                width: 40.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color(0xFF13A9CA), // Hex color with Flutter syntax
                    width: 2.0, // Set the border width
                  ),
                ),
                child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      // BlocProvider.of<AddProductToCartListCubit>(context).addToCartList(productId: widget.product.productId, quantity: 1);
                      setState(() {
                        number++;
                       widget.onValueChanged(number);

                      });
                    },
                    icon: const Icon(
                      Icons.add,
                      color: Color(0xFF13A9CA),
                    )),
              ),
              SizedBox(
                width: 25.w,
                child: Center(
                    child: Text(
                      '$number',
                      style: GoogleFonts.cairo(
                          textStyle:
                          TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400)),
                    )),
              ),
              Container(
                height: 40.h,
                width: 40.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color(0xFF13A9CA), // Hex color with Flutter syntax
                    width: 2.0, // Set the border width
                  ),
                ),
                child: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {

                    setState(() {
                      if (number > 1) {
                        number--;
                        widget.onValueChanged(number);
                      }
                    });
                  },
                  icon: const Icon(
                    Icons.remove,
                    color: Color(0xFF13A9CA),
                  ),
                ),
              ),
            ],
          ),
        SizedBox(height: 10.h,),]
      ],
    ),);
  }
}

// updates_model.dart

class UpdatesModel {
  final List<ProductUpdate>? updates;

  UpdatesModel({
    this.updates,
  });

  factory UpdatesModel.fromJson(Map<String, dynamic> json) {
    return UpdatesModel(
      updates: (json['updates'] as List<dynamic>?)
          ?.map((e) => ProductUpdate.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'updates': updates?.map((e) => e.toJson()).toList(),
    };
  }
}

class ProductUpdate {
  final int? productId;
  final int? quantity;

  ProductUpdate({
    this.productId,
    this.quantity,
  });

  factory ProductUpdate.fromJson(Map<String, dynamic> json) {
    return ProductUpdate(
      productId: json['product_id'] as int?,
      quantity: json['quantity'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'product_id': productId,
      'quantity': quantity,
    };
  }
}
