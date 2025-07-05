import 'package:engaz/features/as_you_like_order/screens/all_polices_screen.dart';
import 'package:engaz/features/cart/widgets/tracking_bar.dart';
import 'package:engaz/features/home/screens/main_export.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentMethodContainer extends StatefulWidget {
  final bool initialVisibility;
  final VoidCallback onButtonPressed;
  final void Function(String value) selectedValue;

  const PaymentMethodContainer({
    Key? key,
    required this.initialVisibility,
    required this.onButtonPressed, required this.selectedValue,
  }) : super(key: key);

  @override
  State<PaymentMethodContainer> createState() => _PaymentMethodContainerState();
}

class _PaymentMethodContainerState extends State<PaymentMethodContainer> {
  String? selectedValue; // For tracking the selected radio button

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Column(
        children: [
          const TrackingBarInPayment(),
          ..._buildRadioRows([
            "كاش عند التوصيل",
            // "بطاقة الإئتمان",
            // "فورى",
            "انستا باى",
            "اورانج كاش",
            "فودافون كاش",
            "إتصالات كاش",
          ]),
          SizedBox(height: 10.h,),
          Text("فى خدمات الدفع الالكترونى يتحمل العميل 1% خدمة السحب",
            style: GoogleFonts.cairo(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: Colors.red,
          ),
          ),
          SizedBox(height: 10.h,),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextButton(
                onPressed:selectedValue!=null ?widget.onButtonPressed:null,
                style: TextButton.styleFrom(
                  backgroundColor:selectedValue!=null ? const Color(0xFF13A9CA):Colors.grey,
                  minimumSize: const Size(double.infinity, 48),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  "التالى",
                  style: GoogleFonts.cairo(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildRadioRows(List<String> options) {
    return options.map((option) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              option,
              style: GoogleFonts.cairo(
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
            Radio<String>(
              value: option,
              groupValue: selectedValue,
              onChanged: (value) {
                setState(() {
                  selectedValue = value;
                  widget.selectedValue(selectedValue!);
                });
              },
            ),
          ],
        ),
      );
    }).toList();
  }
}
