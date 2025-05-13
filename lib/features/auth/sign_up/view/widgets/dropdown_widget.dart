import 'package:dropdown_search/dropdown_search.dart';
import 'package:engaz/features/home/screens/main_export.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DropDownSearchWidget extends StatefulWidget {
  final List<DropdownModel> list;
  final String labelText;
  final Function(int  id) selected;
  const DropDownSearchWidget({Key? key, required this.list, required this.selected, required this.labelText}) : super(key: key);

  @override
  State<DropDownSearchWidget> createState() => _DropDownSearchWidgetState();
}

class _DropDownSearchWidgetState extends State<DropDownSearchWidget> {
  List<String> item=[];
  final dropDownKey = GlobalKey<DropdownSearchState>();

  @override
  void initState() {
    // TODO: implement initState
    widget.list.forEach((element) {
      item.add(element.name!);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          Text(
            widget.labelText,
            style: GoogleFonts.cairo(
              textStyle: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(height: 5.h),
          DropdownSearch<String>(
            key: dropDownKey,
            items: (filter, infiniteScrollProps) => item,
            onChanged: (value) {
              print(widget.list[item.indexOf(value!)].id);
              widget.selected(widget.list[item.indexOf(value!)].id);
              // _getUserModel = state.model.result!.data![item.indexOf(value!)];
              // setState(() {});
            },
            decoratorProps: DropDownDecoratorProps(
              decoration: InputDecoration(
                // fillColor:CacheHelper.isDark?Colors.black: AppColors.white,
                // labelText: AppLocalize.of(context)!.trans('Choose Emtinan Employee Here: '),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10), // 👈 Rounded border here
                ),        ),
            ),
            popupProps:   PopupProps.menu(
              showSearchBox: true, fit: FlexFit.loose,  menuProps: MenuProps(

              // backgroundColor:                CacheHelper.isDark?Colors.black: AppColors.white,
            ),),

          )]);
  }
}
class DropdownModel{
  final String name;
  final int id;

  DropdownModel({required this.name, required this.id});
}