import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../home/screens/drawer_screen.dart';
import '../../home/widgets/app_bar.dart';
import '../widgets/determine_data_container.dart';
import '../widgets/payment_method_container.dart';

class SecondCartScreen extends StatefulWidget {
  static const String routeName = "SecondCartScreen";
  const SecondCartScreen({super.key});

  @override
  State<SecondCartScreen> createState() => _SecondCartScreenState();
}

class _SecondCartScreenState extends State<SecondCartScreen> {
  bool _isFirstContainerVisible = true;
  String ? paymentSelectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const CustomeAppBar(),
             Expanded(
              child: _isFirstContainerVisible
                  ? PaymentMethodContainer(
                      initialVisibility: true,
                      onButtonPressed: () {
                        setState(() {
                          _isFirstContainerVisible = false;
                        });
                      }, selectedValue: (String value) {
                paymentSelectedValue= value;
              },
                    )
                  : DetermineDataContainer(
                      initialVisibility: false,
                paymentSelectedValue: paymentSelectedValue!,
                //
                // onButtonPressed: () {
                //         setState(() {
                //           _isFirstContainerVisible = true;
                //         });
                //       },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
