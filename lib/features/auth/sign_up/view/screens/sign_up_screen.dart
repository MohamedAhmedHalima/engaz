import 'dart:io';

import 'package:engaz/features/auth/sign_up/controller/sign_up_cubit/sign_up_cubit.dart';
import 'package:engaz/features/auth/verify_email/view/screens/verify_email.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../settings/widgets/cutome_text_field.dart';
import '../../../login/screens/login_screen.dart';
import '../widgets/dropdown_widget.dart';
import '../widgets/get_current_location.dart';

class SignUpScreen extends StatefulWidget {
  static const String routeName = "SignUpScreen";

  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController marketName = TextEditingController();
  final TextEditingController businessType = TextEditingController();
  final TextEditingController type = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController phone2 = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController password2 = TextEditingController();
  late int city ;
  late int government ;
  late int counties ;
  late String businessTypes ;
  bool isFirstGovernorate=true;
  late List<DropdownModel> listGovernorate;
  bool isFirstBusinessTypes=true;
  late List<DropdownModel> listFirstBusinessTypes  ;
  bool isFirstCities=true;
   List<DropdownModel> listCities=[];
  bool isFirstCounties=true;
   List<DropdownModel> listCounties=[];

  final TextEditingController location = TextEditingController();
  // final String e_mail = "omarnabilsharnopu@gmail.com";
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
  Position? _position;
  String? _error;

  @override
  void initState() {
    super.initState();
    _initLocation();
    GetGovernmentCubit.get(context).getGovernment();
    GetBusinessTypesCubit.get(context).getBusinessTypes();
  }



  Future<void> _initLocation() async {
    try {
      // 1) لا تفتح الإعدادات تلقائياً إذا كانت الخدمة مقفولة
      final serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        await _showExplainDialog(
          context,
          title: 'تفعيل خدمة الموقع',
          message: 'لتسجيل حسابجديد يجب تفعيل خدمة الموقع. يمكنك تفعيلها من الإعدادات.',
          settingsAction: () async {
            // يفتح الإعدادات فقط بعد ضغط المستخدم
            await Geolocator.openLocationSettings();
          },
        );
        return; // أخرج بدون إجبار المستخدم
      }

      // 2) تحقّق من الإذن
      LocationPermission perm = await Geolocator.checkPermission();

      if (perm == LocationPermission.denied) {
        // (اختياري) شاشة تمهيدية قبل الطلب لتوضيح السبب
        // لا تفتح الإعدادات هنا؛ فقط اطلب الإذن النظامي
        perm = await Geolocator.requestPermission();
      }

      if (perm == LocationPermission.denied) {
        // المستخدم لسه رافض → لا تفتح الإعدادات تلقائي
        await _showExplainSnackBar(
          context,
          'يحتاج  التسجيل إذن الوصول للموقع. يمكنك تفعيله من الإعدادات لاحقًا.',
        );
        return;
      }

      if (perm == LocationPermission.deniedForever) {
        // مستخدم اختار "Don't Allow" بشكل دائم → اعرض دعوة لطيفة بزر يفتح الإعدادات
        await _showExplainDialog(
          context,
          title: 'السماح بالوصول للموقع',
          message:
          'قمت برفض الإذن سابقًا. هذه الميزة لن تعمل بدون إذن الموقع. هل تريد فتح الإعدادات للسماح؟',
          settingsAction: () async {
            await Geolocator.openAppSettings();
          },
        );
        return;
      }

      // 3) الإذن متاح → احصل على الموقع
      final pos = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      setState(() => _position = pos);
    } catch (e) {
      debugPrint('[Location] $e');
      setState(() => _error = e.toString());
    }
  }

// واجهات مساعدة لشرح السبب مع زر يفتح الإعدادات باختيار المستخدم
  Future<void> _showExplainDialog(
      BuildContext context, {
        required String title,
        required String message,
        required Future<void> Function() settingsAction,
      }) async {
    if (!context.mounted) return;
    await showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {   Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute<void>(builder: (BuildContext context) => LoginScreen()),
                  (Route<void> route) => false,
            );},
            child: const Text('لاحقًا'),
          ),
          TextButton(
            onPressed: () async {
              Navigator.of(ctx).pop();
              await settingsAction(); // فتح الإعدادات قرار من المستخدم
            },
            child: const Text('فتح الإعدادات'),
          ),
        ],
      ),
    );
  }

  Future<void> _showExplainSnackBar(BuildContext context, String text) async {
    if (!context.mounted) return;
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute<void>(builder: (BuildContext context) => LoginScreen()),
          (Route<void> route) => false,
    );
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(text)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "إنشاء حساب",
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
      body: BlocConsumer<SignUpCubit, SignUpState>(
        listener: (context, state) {
          if (state is SignUpSuccess) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => VerifyEmail(
                    id: state.signUpModel.data!.id!,
                    email: phone.text,
                  )),
            );
            // Navigator.pushReplacement(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => LoginScreen(),
            //   ),
            // );
          } if (state is SignUpError)  {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message!,)));
          }
        },
        builder: (context, state) {

         return Form(
           key: _formKey,
           child: SingleChildScrollView(
             child: Padding(
               padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 20.h),
               child: Column(
                 children: [
                   CustomTextFieldWithLabel(
                     labelText: 'اسم العميل',
                     controller: name,
                   ),
                   CustomTextFieldWithLabel(
                     labelText: 'اسم الماركت',
                     controller: marketName,
                   ),
                   // CustomTextFieldWithLabel(
                   //   labelText: 'الايميل',
                   //   controller: email,
                   // ),
                   // CustomTextFieldWithLabel(
                   //   labelText: ' نوع النشاط',
                   //   controller: businessType,
                   // ),
                   BlocConsumer<GetBusinessTypesCubit, BusinessTypesState>(
                     listener: (context, state) {

                     },
                     builder: (context, state) {
                       if (state is BusinessTypesSuccess) {
                         if(isFirstBusinessTypes)    {
                           listFirstBusinessTypes = [];
                           state.businessTypesModel.data!.forEach((element) {
                             listFirstBusinessTypes.add(DropdownModel(
                                 name: element.name ?? "",
                                 id: element.id ?? 1));
                           });
                           isFirstBusinessTypes=false;
                         }
                         return  DropDownSearchWidget(
                           list: listFirstBusinessTypes, selected: (value) {
                           // businessTypes =listFirstBusinessTypes.firstWhere((item)=>item.id==value).name ;
                           businessTypes = listFirstBusinessTypes.firstWhere(
                                 (item) => item.id == value,
                           )?.name ?? '';

                         }, labelText: ' نوع النشاط',);
                       }

                       else{
                         return  const Center(child: CircularProgressIndicator());
                       }
                     },
                   ),
                   CustomTextFieldWithLabel(
                     labelText: 'رقم الهاتف',
                     controller: phone,
                   ),
                   CustomTextFieldWithLabel(
                     labelText: 'رقم هاتف اخر',
                     controller: phone2,
                       isValid:false
                   ),
                   CustomTextFieldWithLabel(
                     labelText: 'كلمة المرور',
                     controller: password,
                     isPassword: true,
                   ),
                   CustomTextFieldWithLabel(
                     labelText: 'تأكيد كلمة المرور',
                     controller: password2,
                     isPassword: true,
                   ),
                   BlocConsumer<GetGovernmentCubit, GovernoratesState>(
                     listener: (context, state) {

                     },
                     builder: (context, state) {
                       if (state is GovernoratesSuccess) {
                         if(isFirstGovernorate)    {
                           listGovernorate = [];
                           state.governoratesModel.data!.forEach((element) {
                             listGovernorate.add(DropdownModel(
                                 name: element.nameAr ?? "",
                                 id: element.id ?? 1));
                           });
                           isFirstGovernorate=false;
                         }
                       }
                       if(state is GovernoratesSuccess) {
                         return  DropDownSearchWidget(
                           list: listGovernorate, selected: (value) {
                           government = value;
                           GetCitiesCubit.get(context).getCities(id: value);
                           isFirstCities=true;
                         }, labelText: 'المحافظه',);
                       }
                       else{
                         return  const Center(child: CircularProgressIndicator());
                       }
                     },
                   ),
                   BlocConsumer<GetCitiesCubit, GetCitiesState>(
                     listener: (context, state) {

                     },
                     builder: (context, state) {
                       if (state is CitiesSuccess) {
                         if(isFirstCities)    {
                           listCities = [];
                           state.citiesModel.data!.forEach((element) {
                             listCities.add(DropdownModel(
                                 name: element.nameAr ?? "",
                                 id: element.id ?? 1));
                           });
                           isFirstCities=true;
                         }
                       }
                       if( state is CitiesLoading ) {
                         return const Center(child: CircularProgressIndicator());
                       }
                       {
                         return DropDownSearchWidget(list: listCities, selected: (value) {
                           city = value;
                           isFirstCounties=true;
                           GetCountiesCubit.get(context).getCounties(id: value);
                         }, labelText: 'المدينه',);

                       }
                     },
                   ),
                   BlocConsumer<GetCountiesCubit, GetCountiesState>(
                     listener: (context, state) {

                     },
                     builder: (context, state) {
                       if (state is CountiesSuccess) {
                         if(isFirstCounties)    {
                           listCounties = [];
                           state.countiesModel.data!.forEach((element) {
                             listCounties.add(DropdownModel(
                                 name: element.nameAr ?? "",
                                 id: element.id ?? 1));
                           });
                           isFirstCounties=false;
                         }
                       }
                       if( state is CountiesLoading ) {
                         return const Center(child: CircularProgressIndicator());
                       }
                       {
                         return DropDownSearchWidget(list: listCounties, selected: (value) {
                           counties = value;
                         }, labelText: 'الحى',);

                       }
                     },
                   ),

                   CustomTextFieldWithLabel(
                     controller: location,
                     labelText: 'العنوان',
                   ),
                   SizedBox(height: 20.h),
                   ElevatedButton(
                     style: ElevatedButton.styleFrom(
                       backgroundColor: const Color(0XFFB0E2ED),
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
                     style: GoogleFonts.cairo(
                         fontSize: 14.sp, color: Colors.grey),
                   ),
                   state is SignUpLoading?const Center(child: CircularProgressIndicator()):
                   ElevatedButton(
                     onPressed: () async {
                       if (_formKey.currentState?.validate() ?? false) {
                         List<File> imageFiles =
                         _images!.map((xfile) => File(xfile.path)).toList();
                         SignUpCubit.get(context).signUp(
                             nameClient: name.text, email: email.text,
                             phone: phone.text, otherPhone: phone2.text,
                             governorate: government.toString(), City: city.toString(),
                             District: counties.toString(), location: location.text,
                             storeName: marketName.text, businessType: businessTypes,
                             password: password.text, confirmPassword: password2.text,
                             images: imageFiles, lat: _position!.latitude.toString()??"", long: _position!.longitude.toString()??"");
                       }
                     },
                     style: ElevatedButton.styleFrom(
                       backgroundColor: const Color(0XFF13A9CA), // Button color
                       shape: RoundedRectangleBorder(
                         borderRadius:
                         BorderRadius.circular(10.0), // Rounded corners
                       ),
                       fixedSize: const Size(343, 48),
                     ),
                     child: Text(
                       "إنشاء حساب",
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
               ),),
           ),
         );
        },
      ),
    );
  }
}

