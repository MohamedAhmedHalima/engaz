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
    required String location,
    required String District,
    required String storeName,
    required String businessType,
      String? password,
      String? password_confirmation,
      List<File> ?images, // قائمة الصور
  }) async {
    emit(UpdateUserDataLoading());

    try {
      // إنشاء FormData لإرسال البيانات والصور
      FormData formData = password!=null?FormData.fromMap({
        'name': nameClient,
        // 'email': email,
        'first_phone': phone,
        'second_phone': otherPhone,
        'governorate_id': governorate,
        'city_id': City,
        'county_id': District,
        'location': location,
        'market_name': storeName,
        'password': password,
        'password_confirmation': password_confirmation,
        'activity_type': businessType,
      }):FormData.fromMap({
        'name': nameClient,
        // 'email': email,
        'first_phone': phone,
        'second_phone': otherPhone,
        'governorate_id': governorate,
        'city_id': City,
        'county_id': District,
        'location': location,
        'market_name': storeName,
        'activity_type': businessType,
      });

      // إضافة الصور إلى FormData إذا كانت هناك صور
        if(images!=null)  {
        for (var image in images) {
          formData.files.add(MapEntry(
            "images[]", // تأكد من أن هذا الحقل يتطابق مع ما يتوقعه الـ API
            await MultipartFile.fromFile(
              image.path,
              filename: image
                  .uri.pathSegments.last, // الحصول على اسم الملف من الـ URI
            ),
          ));
        }
      }

      // إرسال الطلب باستخدام Dio

      final response = await DioHelper.postData(
        url: 'me/info/update',
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

        emit(UpdateUserDataSuccess());
      }

      else {
        emit(UpdateUserDataError(
            message:
            "Something went wrong : ${response.data["message"]}"));
      }

  } on DioException catch (e) {
  if (e.type == DioExceptionType.connectionTimeout ||
  e.type == DioExceptionType.receiveTimeout ||
  e.type == DioExceptionType.unknown) {
  // ❌ دي غالبًا مشكلة إنترنت
  emit(UpdateUserDataError(message: "تأكد من اتصالك بالإنترنت وحاول مرة أخرى."));
  } else if (e.response?.statusCode != null && e.response!.statusCode! >= 500) {
  // 🔥 مشكلة من السيرفر نفسه
  emit(UpdateUserDataError(message: "الخدمة غير متاحة الآن، يرجى المحاولة لاحقًا."));
  } else {
  // ✴️ أي حاجة غير كده (زي 400، 404، إلخ)
  emit(UpdateUserDataError(message: "حدث خطأ غير متوقع، حاول مرة أخرى."));
  }
  } catch (e) {
  // ✴️ fallback لو حصل استثناء غير معروف
  emit(UpdateUserDataError(message: "حدث خطأ غير متوقع، حاول لاحقًا."));
  }
  }
  Future<void> updateLocation({
    required String lat,
    required String long,
   }) async {
    emit(UpdateLocationLoading());

    try {
      // إنشاء FormData لإرسال البيانات والصور

      final response = await DioHelper.postData(
        url: 'user/location/update',
        data: {
          "lat": lat,
          "long": long
        }
      );

      // التحقق من الاستجابة
      if (response!.statusCode == 200) {

        emit(UpdateLocationSuccess());
      }

      else {
        emit(UpdateLocationError(
            message:
            "Something went wrong : ${response.data["message"]}"));
      }

  } on DioException catch (e) {
  if (e.type == DioExceptionType.connectionTimeout ||
  e.type == DioExceptionType.receiveTimeout ||
  e.type == DioExceptionType.unknown) {
  // ❌ دي غالبًا مشكلة إنترنت
  emit(UpdateLocationError(message: "تأكد من اتصالك بالإنترنت وحاول مرة أخرى."));
  } else if (e.response?.statusCode != null && e.response!.statusCode! >= 500) {
  // 🔥 مشكلة من السيرفر نفسه
  emit(UpdateLocationError(message: "الخدمة غير متاحة الآن، يرجى المحاولة لاحقًا."));
  } else {
  // ✴️ أي حاجة غير كده (زي 400، 404، إلخ)
  emit(UpdateLocationError(message: "حدث خطأ غير متوقع، حاول مرة أخرى."));
  }
  } catch (e) {
  // ✴️ fallback لو حصل استثناء غير معروف
  emit(UpdateLocationError(message: "حدث خطأ غير متوقع، حاول لاحقًا."));
  }
  }


}