import 'package:engaz/features/home/screens/main_export.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectDateTimeWidget extends StatefulWidget {
  final void Function(
    String ?selectedDayOption,
   String ?selectedShiftOption,
   String ?note,
  ) selectedValue;

  const SelectDateTimeWidget({Key? key, required this.selectedValue}) : super(key: key);

  @override
  _SelectDateTimeWidgetState createState() => _SelectDateTimeWidgetState();
}

class _SelectDateTimeWidgetState extends State<SelectDateTimeWidget> {
  String? selectedDayOption;
  String? dateOption;
  String? selectedShiftOption;
  final TextEditingController note = TextEditingController();

  String getDatePlusDays(int daysToAdd) {
    final now = DateTime.now();
    final result = now.add(Duration(days: daysToAdd));

    final year = result.year.toString().padLeft(4, '0');
    final month = result.month.toString().padLeft(2, '0');
    final day = result.day.toString().padLeft(2, '0');

    return '$year-$month-$day';
  }
  String getPlusDays(int daysToAdd) {
    final now = DateTime.now();
    final result = now.add(Duration(days: daysToAdd));

    final year = result.year.toString().padLeft(4, '0');
    final month = result.month.toString().padLeft(2, '0');
    final day = result.day.toString().padLeft(2, '0');
    return '  يوم  $year-$month-$day';
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 35),
      child: Column(
        children: [
          // First dropdown
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Align(
              alignment: Alignment.topRight,
              child: Text("اليوم",
                  style: GoogleFonts.cairo(
                      textStyle: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: DropdownButtonFormField<String>(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.grey)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.grey)),
              ),
              value: selectedDayOption,
              hint: const Text("اختر الخيار"),
              icon: const Icon(
                Icons.arrow_drop_down_circle,
                color: Color(0XFF13A9CA),
              ),
              onChanged: (String? value) {
                setState(() {
                  selectedDayOption = value;
                  if(value!.contains( getPlusDays(1))){
                    dateOption =   getDatePlusDays(1);
                  }else{
                    dateOption =  getDatePlusDays(2);
                  }

                  widget.selectedValue( dateOption!,  "",note.text);
                });
              },
              items: [
                DropdownMenuItem(
                  value: getPlusDays(1),
                  child: Text(getPlusDays(1),
                      style: GoogleFonts.cairo(fontSize: 14)),
                ),
                DropdownMenuItem(
                  value: getPlusDays(2),
                  child: Text(getPlusDays(2),
                      style: GoogleFonts.cairo(fontSize: 14)),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Align(
              alignment: Alignment.topRight,
              child: Text("ملحوظة",
                  style: GoogleFonts.cairo(
                      textStyle: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500))),
            ),
          ),
          SizedBox(height: 10.h,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),child:
          TextField(
            controller: note,
            onChanged: (value){
              print(note.text);
              widget.selectedValue( dateOption!,  "",value.trim());
            },
            minLines: 3,
            maxLines: 5,
            decoration: InputDecoration(
              hintText: "اضف ملحوظاتك",
              contentPadding:
              EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(color: Colors.grey),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(color: Colors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(color: Colors.grey),
              ),
            ),
          ),)
          // Second dropdown
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 20),
          //   child: Align(
          //     alignment: Alignment.topRight,
          //     child: Text("الوقت",
          //         style: GoogleFonts.cairo(
          //             textStyle: const TextStyle(
          //                 fontSize: 16, fontWeight: FontWeight.w500))),
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          //   child: DropdownButtonFormField<String>(
          //     decoration: InputDecoration(
          //       border: OutlineInputBorder(
          //           borderRadius: BorderRadius.circular(10),
          //           borderSide: const BorderSide(color: Colors.white)),
          //       focusedBorder: OutlineInputBorder(
          //           borderRadius: BorderRadius.circular(10),
          //           borderSide: const BorderSide(color: Colors.white)),
          //     ),
          //     value: selectedShiftOption,
          //     hint: const Text("اختر الخيار"),
          //     icon: const Icon(
          //       Icons.arrow_drop_down_circle,
          //       color: Color(0XFF13A9CA),
          //     ),
          //     onChanged: (String? value) {
          //       setState(() {
          //         selectedShiftOption = value;
          //         widget.selectedValue( "الورديه الصباحيه",  selectedShiftOption!);
          //       });
          //     },
          //     items: [
          //       DropdownMenuItem(
          //         value: "الورديه الصباحيه",
          //         child: Text("الورديه الصباحيه",
          //             style: GoogleFonts.cairo(fontSize: 14)),
          //       ),
          //       DropdownMenuItem(
          //         value: "الورديه المسائيه",
          //         child: Text("الورديه المسائيه",
          //             style: GoogleFonts.cairo(fontSize: 14)),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
