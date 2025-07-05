import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../home/screens/drawer_screen.dart';
import '../../home/widgets/app_bar.dart';
import '../../home/widgets/custome_search_bar.dart';
import 'operations_screen.dart';

class ForwardDealingScreen extends StatelessWidget {
  static const String routeName = "ForwardDealingScreen";

  const ForwardDealingScreen({super.key});

  Future<void> _pickFile(BuildContext context) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png', 'pdf', 'docx'],
    );
    if (result != null) {
      final file = result.files.first;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('File Selected: ${file.name}'),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No file selected'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  const CustomeAppBar(),
                    CustomeSearchBar(),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            "التعامل الاجل",
                            style: GoogleFonts.cairo(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 20.sp,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h),
                        Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            " املئ البيانات لتقديم الطلب",
                            style: GoogleFonts.cairo(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14.sp,
                                color: const Color(0XFF94CF29),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h),
                        _buildUploadSection(
                            context, 'Upload File 1', "رقم البطاقة الشخصية"),
                        const SizedBox(height: 30),
                        _buildUploadSection(
                            context, 'Upload File 2', "رقم السجل التجارى"),
                        const SizedBox(height: 30),
                        _buildUploadSection(
                            context, 'Upload File 3', "الرقم الضريبى"),
                        const SizedBox(
                            height: 100), // Leave space for the button
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.white, // Background for the button section
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OperationsScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: const Color(0XFF13A9CA), // Button color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    " تقديم طلب",
                    style: GoogleFonts.cairo(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUploadSection(
      BuildContext context, String label, String textAboveTextField) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          textAboveTextField, // Display specific text above each TextField
          style: GoogleFonts.cairo(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.grey, width: 0.5),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey, width: 0.5),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        const SizedBox(height: 10),
        DottedBorder(
          color: const Color(0XFFB9B6B6),
          borderType: BorderType.RRect,
          radius: const Radius.circular(15),
          dashPattern: const [8, 4],
          strokeWidth: 2,
          child: SizedBox(
            height: 99.h,
            width: 343.w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0XFFE6E4E4),
                  ),
                  child: IconButton(
                    icon: Image.asset("assets/images/upload_document.png"),
                    iconSize: 40,
                    color: const Color(0XFF13A9CA),
                    tooltip: label,
                    onPressed: () => _pickFile(context),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "الرجاء رفع ملف و صور البطاقة الشخصية",
                  style: GoogleFonts.cairo(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
