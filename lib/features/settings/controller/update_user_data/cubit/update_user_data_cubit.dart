import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';

import 'package:dio/dio.dart';
import 'package:engaz/features/auth/sign_up/model/sign_up_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/network/api.dart';

part 'update_user_data_state.dart';

class UpdateUserDataCubit extends Cubit<UpdateUserDataState> {
  UpdateUserDataCubit() : super(UpdateUserDataInitial());

  static UpdateUserDataCubit get(context) => BlocProvider.of<UpdateUserDataCubit>(context);

  String nameClient = '';
  String phone = '';
  String otherPhone = '';
  String governorate = '';
  String City = '';
  String District = '';
  String location = '';
  String storeName = '';
  String businessType = '';
  SignUpModel? signUpModel;

  Future<void> signUp({
    required String nameClient,
    required String phone,
    required String otherPhone,
    required String governorate,
    required String City,
    required String District,
    required String storeName,
    required String businessType,
    required List<File> images, // قائمة الصور
  }) async {
    emit(UpdateUserDataLoading());

    try {
      // إنشاء FormData لإرسال البيانات والصور
      FormData formData = FormData.fromMap({
        'name': nameClient,
        // 'email': email,
        'first_phone': phone,
        'second_phone': otherPhone,
        'governorate_id': governorate,
        'city_id': City,
        'county_id': District,
        // 'location': location,
        'market_name': storeName,
        'activity_type': businessType,
      });

      // إضافة الصور إلى FormData إذا كانت هناك صور
      for (var image in images) {
        formData.files.add(MapEntry(
          "images[]", // تأكد من أن هذا الحقل يتطابق مع ما يتوقعه الـ API
          await MultipartFile.fromFile(
            image.path,
            filename:
            image.uri.pathSegments.last, // الحصول على اسم الملف من الـ URI
          ),
        ));
      }

      // إرسال الطلب باستخدام Dio

      final response = await DioHelper.postData(
        url: 'register',
        formData: formData,
      );

      // التحقق من الاستجابة
      if (response!.statusCode == 200) {
        print('Response Status: ${response.statusCode}');
        print('Response Data: ${response.data}');

        // تحليل البيانات المستلمة
        signUpModel = SignUpModel.fromJson(response.data);
        print('Parsed status: ${signUpModel?.status}');
        print('Parsed message: ${signUpModel?.message}');

        emit(UpdateUserDataSuccess(signUpModel: signUpModel!));
      }

      else {
        emit(UpdateUserDataError(
            message:
            "Something went wrong : ${response.data["message"]}"));
      }

    } catch (e) {
      print('Error: $e');
      emit(UpdateUserDataError(message: "An error occurred: $e"));
    }
  }


}