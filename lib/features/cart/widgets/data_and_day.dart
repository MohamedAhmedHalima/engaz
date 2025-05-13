import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectDateTimeWidget extends StatefulWidget {
  const SelectDateTimeWidget({Key? key}) : super(key: key);

  @override
  _SelectDateTimeWidgetState createState() => _SelectDateTimeWidgetState();
}

class _SelectDateTimeWidgetState extends State<SelectDateTimeWidget> {
  String? selectedDayOption;
  String? selectedShiftOption;
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
                });
              },
              items: [
                DropdownMenuItem(
                  value: "بعد 24 ساعه",
                  child: Text("بعد 24 ساعه",
                      style: GoogleFonts.cairo(fontSize: 14)),
                ),
                DropdownMenuItem(
                  value: "بعد 48 ساعه",
                  child: Text("بعد 48 ساعه",
                      style: GoogleFonts.cairo(fontSize: 14)),
                ),
              ],
            ),
          ),
          // Second dropdown
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Align(
              alignment: Alignment.topRight,
              child: Text("الوقت",
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
                    borderSide: const BorderSide(color: Colors.white)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.white)),
              ),
              value: selectedShiftOption,
              hint: const Text("اختر الخيار"),
              icon: const Icon(
                Icons.arrow_drop_down_circle,
                color: Color(0XFF13A9CA),
              ),
              onChanged: (String? value) {
                setState(() {
                  selectedShiftOption = value;
                });
              },
              items: [
                DropdownMenuItem(
                  value: "الورديه الصباحيه",
                  child: Text("الورديه الصباحيه",
                      style: GoogleFonts.cairo(fontSize: 14)),
                ),
                DropdownMenuItem(
                  value: "الورديه المسائيه",
                  child: Text("الورديه المسائيه",
                      style: GoogleFonts.cairo(fontSize: 14)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
