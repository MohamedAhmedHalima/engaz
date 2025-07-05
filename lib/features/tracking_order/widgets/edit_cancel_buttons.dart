import 'package:engaz/features/tracking_order/controller/cancel_update_order/cubit/cancel_update_order_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controller/get_order_list_data/cubite/get_order_list_data_bloc.dart';
import 'dialog.dart';
import 'order_details.dart';

class EditCancelButtons extends StatefulWidget {
  final VoidCallback? onTap;
  final int id;
  final List<ProductUpdate> updatesList;

  const EditCancelButtons({super.key, this.onTap, required this.updatesList, required this.id});

  @override
  _EditCancelButtonsState createState() => _EditCancelButtonsState();
}

class _EditCancelButtonsState extends State<EditCancelButtons> {
  // A variable to track the button text state
  bool _isEditing = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CancelUpdateOrderCubit,CancelUpdateOrderState>(
    listener:  (context, state) {
      if(state is UpdateOrderSuccess){
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("تم تعديل المنتج بنجاح!", style: TextStyle(color: Colors.white)),
            duration: Duration(seconds: 2),
            behavior: SnackBarBehavior.floating,             // makes it float above content
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            backgroundColor: Colors.green,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),

          ),
        );
        BlocProvider.of<GetOrderListDataCubit>(context).getOrderListData();

      }   if(state is CancelOrderSuccess){
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("تم حذف المنتج بنجاح!", style: TextStyle(color: Colors.white)),
            duration: Duration(seconds: 2),
            behavior: SnackBarBehavior.floating,             // makes it float above content
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            backgroundColor: Colors.green,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),

          ),
        );
        BlocProvider.of<GetOrderListDataCubit>(context).getOrderListData();

        Navigator.pop(context);
      }
    },
        builder: (context, state) {
      if(state is CancelOrderLoading || state is  UpdateOrderLoading){
        return Center(child: CircularProgressIndicator(),);
      }
          return Row(
            children: [
              SizedBox(
                height: 50.h,
                width: 155.5.w,
                child: ElevatedButton(
                  onPressed: () {
                    if(widget.onTap!=null){
                      widget.onTap!();
                    }
                    setState(() {
                      // Toggle between editing and saving state
                      _isEditing = !_isEditing;
                    });
                    if(!_isEditing){
                      BlocProvider.of<CancelUpdateOrderCubit>(context)
                          .updateOrder(
                          id: widget.id, updatesList: widget.updatesList);
                    }

                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF13A9CA),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    _isEditing
                        ? "حفظ التعديل"
                        : "تعديل الطلب", // Change text based on state
                    style: GoogleFonts.cairo(
                        textStyle: const TextStyle(color: Colors.white),
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              SizedBox(
                width: 20.w,
              ),
              SizedBox(
                height: 50.h,
                width: 155.5.w,
                child: ElevatedButton(
                  onPressed: () {
                    DeleteDialog(context, id: widget.id);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: const BorderSide(color: Color(0XFFD42828)),
                    ),
                  ),
                  child: Text(
                    "إلغاء الطلب",
                    style: GoogleFonts.cairo(
                      textStyle: TextStyle(
                          color: const Color(0XFFD42828),
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ),
            ],
          );
        });
  }
}
