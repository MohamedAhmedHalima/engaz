import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../settings/widgets/cutome_text_field.dart';
import 'location.dart';

class SignUpTextFields extends StatefulWidget {


  static const String routeName = "SignUpTextFields";

  @override
  _SignUpTextFieldsState createState() => _SignUpTextFieldsState();
}

class _SignUpTextFieldsState extends State<SignUpTextFields> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController name = TextEditingController();
  final TextEditingController marketName = TextEditingController();
  final TextEditingController type = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController phone2 = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController password2 = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  List<XFile>? _images = [];

  Future<void> _pickImages() async {
    final List<XFile>? selectedImages = await _picker.pickMultiImage();
    if (selectedImages != null) {
      setState(() {
        _images = selectedImages;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomTextFieldWithLabel(
              labelText: 'اسم العميل', controller: name,),
            CustomTextFieldWithLabel(
              labelText: 'اسم الماركت', controller: marketName,),
            CustomTextFieldWithLabel(
              labelText: ' نوع النشاط', controller: marketName,),
            CustomTextFieldWithLabel(
              labelText: 'رقم الهاتف', controller: phone,),
            CustomTextFieldWithLabel(
              labelText: 'رقم هاتف اخر', controller: phone2,),
            CustomTextFieldWithLabel(
              labelText: 'كلمة المرور', controller: password,isPassword: true,),
            CustomTextFieldWithLabel(
              labelText: 'تأكيد كلمة المرور', controller: password2,isPassword: true
              ,),
            SizedBox(height: 20.h),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0XFFB0E2ED),
                fixedSize: const Size(72, 61),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
              onPressed: _pickImages,
              child: const Icon(
                Icons.add,
                size: 24,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20.h),
            _images != null && _images!.isNotEmpty
                ? Wrap(
              spacing: 10,
              runSpacing: 10,
              children: _images!.map((image) {
                return Image.file(
                  File(image.path),
                  width: 100.w,
                  height: 100.h,
                  fit: BoxFit.cover,
                );
              }).toList(),
            )
                : Text(
              "لم يتم تحميل الصور",
              style:
              GoogleFonts.cairo(fontSize: 14.sp, color: Colors.grey),
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState?.validate() ?? false) {

                }

              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0XFF13A9CA), // Button color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0), // Rounded corners
                ),
                fixedSize: const Size(343, 48),
              ),
              child: Text(
                "متابعه",
                style: GoogleFonts.cairo(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w400,
                    color: const Color(0XFFFDFCFC)),
              ),
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}

