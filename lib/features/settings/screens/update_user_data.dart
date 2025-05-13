import 'dart:io';

import 'package:engaz/features/home/screens/main_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../../auth/sign_up/controller/sign_up_cubit/sign_up_cubit.dart';
import '../../auth/sign_up/view/widgets/dropdown_widget.dart';
import '../controller/get_user_data/cubit/get_user_data_cubit.dart';
import '../controller/update_user_data/cubit/update_user_data_cubit.dart';
import '../widgets/cutome_text_field.dart';

class UpdateUserData extends StatefulWidget {
  static const String routeName = "UpdateUserData";

  const UpdateUserData({super.key});

  @override
  _UpdateUserDataState createState() => _UpdateUserDataState();
}

class _UpdateUserDataState extends State<UpdateUserData> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController name = TextEditingController();
  final TextEditingController marketName = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController phone2 = TextEditingController();
  late int city;
  late int government;
  late int counties;
  late String businessTypes;
  bool isFirstGovernorate = true;
  late List<DropdownModel> listGovernorate;
  bool isFirstBusinessTypes = true;
  List<DropdownModel> listFirstBusinessTypes = [];
  bool isFirstCities = true;
  List<DropdownModel> listCities = [];
  bool isFirstCounties = true;
  bool isGetValue = true;
  List<DropdownModel> listCounties = [];

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

  @override
  void initState() {
    GetUserDataCubit.get(context).getUserData();
    GetGovernmentCubit.get(context).getGovernment();
    GetBusinessTypesCubit.get(context).getBusinessTypes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "تعديل بيانات المستخدم",
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
      body: BlocConsumer<GetUserDataCubit, GetUserDataState>(
        listener: (context, state) {
          if (state is GetUserDataSuccess) {
            // Navigator.pushReplacement(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => LoginScreen(),
            //   ),
            // );
          }
          if (state is GetUserDataError) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(
              state.message!,
            )));
          }
        },
        builder: (context, state) {
          if(state is GetUserDataSuccess){
            if(isGetValue){
              name.text=state.userModl.name??"";
              marketName.text=state.userModl.marketName??"";
              phone.text=state.userModl.firstPhone.toString()??"";
              phone2.text=state.userModl.secondPhone.toString()??"";
             city=state.userModl.city!.id??0;
             government=state.userModl.governorate!.id??0;
             counties=state.userModl.county!.id??0;

              isGetValue=false;
            }
            return Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
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

                      BlocConsumer<GetBusinessTypesCubit, BusinessTypesState>(
                        listener: (context, state) {},
                        builder: (context, state) {
                          if (state is BusinessTypesSuccess) {
                            if (isFirstGovernorate) {
                              listFirstBusinessTypes = [];
                              state.businessTypesModel.data!.forEach((element) {
                                listFirstBusinessTypes.add(DropdownModel(
                                    name: element.name ?? "",
                                    id: element.id ?? 1));
                              });
                              isFirstBusinessTypes = false;
                            }
                            return DropDownSearchWidget(
                              list: listFirstBusinessTypes,
                              selected: (value) {
                                // businessTypes =listFirstBusinessTypes.firstWhere((item)=>item.id==value).name ;
                                businessTypes = listFirstBusinessTypes
                                        .firstWhere(
                                          (item) => item.id == value,
                                        )
                                        ?.name ??
                                    '';
                              },
                              labelText: ' نوع النشاط',
                            );
                          } else {
                            return const Center(
                                child: CircularProgressIndicator());
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
                          isValid: false),

                      BlocConsumer<GetGovernmentCubit, GovernoratesState>(
                        listener: (context, state) {},
                        builder: (context, state) {
                          if (state is GovernoratesSuccess) {
                            if (isFirstGovernorate) {
                              listGovernorate = [];
                              state.governoratesModel.data!.forEach((element) {
                                listGovernorate.add(DropdownModel(
                                    name: element.nameAr ?? "",
                                    id: element.id ?? 1));
                              });
                              isFirstGovernorate = false;
                            }
                          }
                          if (state is GovernoratesSuccess) {
                            return DropDownSearchWidget(
                              list: listGovernorate,
                              selected: (value) {
                                government = value;
                                GetCitiesCubit.get(context)
                                    .getCities(id: value);
                                isFirstCities = true;
                              },
                              labelText: 'المحافظه',
                            );
                          } else {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                        },
                      ),
                      BlocConsumer<GetCitiesCubit, GetCitiesState>(
                        listener: (context, state) {},
                        builder: (context, state) {
                          if (state is CitiesSuccess) {
                            if (isFirstCities) {
                              listCities = [];
                              state.citiesModel.data!.forEach((element) {
                                listCities.add(DropdownModel(
                                    name: element.nameAr ?? "",
                                    id: element.id ?? 1));
                              });
                              isFirstCities = true;
                            }
                          }
                          if (state is CitiesLoading) {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                          {
                            return DropDownSearchWidget(
                              list: listCities,
                              selected: (value) {
                                city = value;
                                GetCountiesCubit.get(context)
                                    .getCounties(id: value);
                              },
                              labelText: 'المدينه',
                            );
                          }
                        },
                      ),
                      BlocConsumer<GetCountiesCubit, GetCountiesState>(
                        listener: (context, state) {},
                        builder: (context, state) {
                          if (state is CountiesSuccess) {
                            if (isFirstCounties) {
                              listCounties = [];
                              state.countiesModel.data!.forEach((element) {
                                listCounties.add(DropdownModel(
                                    name: element.nameAr ?? "",
                                    id: element.id ?? 1));
                              });
                              isFirstCounties = false;
                            }
                          }
                          if (state is CountiesLoading) {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                          {
                            return DropDownSearchWidget(
                              list: listCounties,
                              selected: (value) {
                                counties = value;
                              },
                              labelText: 'الحى',
                            );
                          }
                        },
                      ),

                      // CustomTextFieldWithLabel(
                      //   controller: location,
                      //   labelText: 'العنوان',
                      // ),
                      SizedBox(height: 20.h),
                      BlocConsumer<UpdateUserDataCubit, UpdateUserDataState>(
                          listener: (context, state) {
                        if (state is UpdateUserDataSuccess) {
                          // Navigator.pushReplacement(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => LoginScreen(),
                          //   ),
                          // );
                        }
                        if (state is UpdateUserDataError) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                            state.message!,
                          )));
                        }
                      }, builder: (context, state) {
                        return ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0XFFB0E2ED),
                            fixedSize: const Size(72, 61),
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                          ),
                          onPressed: _pickImages,
                          child: const Icon(
                            Icons.add,
                            size: 24,
                            color: Colors.black,
                          ),
                        );
                      }),

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
                      state is UpdateUserDataLoading
                          ? const Center(child: CircularProgressIndicator())
                          : ElevatedButton(
                              onPressed: () async {
                                if (_formKey.currentState?.validate() ??
                                    false) {
                                  List<File> imageFiles = _images!
                                      .map((xfile) => File(xfile.path))
                                      .toList();
                                  UpdateUserDataCubit.get(context).signUp(
                                    nameClient: name.text,
                                    phone: phone.text,
                                    otherPhone: phone2.text,
                                    governorate: government.toString(),
                                    City: city.toString(),
                                    District: counties.toString(),
                                    storeName: marketName.text,
                                    businessType: businessTypes,
                                    images: imageFiles,
                                  );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color(0XFF13A9CA), // Button color
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      10.0), // Rounded corners
                                ),
                                fixedSize: const Size(343, 48),
                              ),
                              child: Text(
                                "تعديل حساب",
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
              ),
            );
          }
          else{
            return const Center(child: CircularProgressIndicator(),);
          }
        },
      ),
    );
  }
}
