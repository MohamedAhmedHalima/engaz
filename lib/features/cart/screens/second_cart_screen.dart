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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const CustomeAppBar(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: Color(0XFF13A9CA),
                    ),
                  ),
                  Text(
                    "اتمام الطلب",
                    style: GoogleFonts.cairo(
                      textStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Color(0XFF94CF29),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: _isFirstContainerVisible
                  ? PaymentMethodContainer(
                      initialVisibility: true,
                      onButtonPressed: () {
                        setState(() {
                          _isFirstContainerVisible = false;
                        });
                      },
                    )
                  : DetermineDataContainer(
                      initialVisibility: false,
                      onButtonPressed: () {
                        setState(() {
                          _isFirstContainerVisible = true;
                        });
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
