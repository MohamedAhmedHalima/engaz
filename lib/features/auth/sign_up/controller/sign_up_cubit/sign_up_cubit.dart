import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';

import 'package:dio/dio.dart';
import 'package:engaz/features/auth/sign_up/model/sign_up_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/network/api.dart';
import '../../model/business_types.dart';
import '../../model/governorates_model.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

  static SignUpCubit get(context) => BlocProvider.of<SignUpCubit>(context);

  String nameClient = '';
  String email = '';
  String phone = '';
  String otherPhone = '';
  String governorate = '';
  String City = '';
  String District = '';
  String location = '';
  String storeName = '';
  String businessType = '';
  String password = '';
  String confirmPassword = '';
  String lat = '';
  String long = '';
  SignUpModel? signUpModel;

  Future<void> signUp({
    required String nameClient,
    required String email,
    required String phone,
    required String otherPhone,
    required String governorate,
    required String City,
    required String District,
    required String location,
    required String storeName,
    required String businessType,
    required String password,
    required String lat,
    required String long,
    required String confirmPassword,
    required List<File> images, // قائمة الصور
  }) async {
    emit(SignUpLoading());

    try {
      // إنشاء FormData لإرسال البيانات والصور
      FormData formData = FormData.fromMap({
        'name': nameClient,
        // 'email': email,
        'first_phone': phone,
        'long': long,
        'lat': lat,
        'second_phone': otherPhone,
        'governorate_id': governorate,
        'city_id': City,
        'county_id': District,
        // 'location': location,
        'market_name': storeName,
        'activity_type': businessType,
        'password': password,
        'password_confirmation': confirmPassword,
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

        emit(SignUpSuccess(signUpModel: signUpModel!));
      }

      else {
        emit(SignUpError(
            message:
                "Something went wrong : ${response.data["message"]}"));
      }

    } catch (e) {
      print('Error: $e');
      emit(SignUpError(message: "An error occurred: $e"));
    }
  }


}
class GetGovernmentCubit extends Cubit<GovernoratesState> {
  GetGovernmentCubit() : super(GovernoratesState());

  static GetGovernmentCubit get(context) => BlocProvider.of<GetGovernmentCubit>(context);

  Future<void> getGovernment()async {
    emit(GovernoratesInitial());
    try{
      final response = await DioHelper.getData(url: "governorates");
      if(response!.statusCode==200){
        emit(GovernoratesSuccess(governoratesModel: GovernoratesModel.fromJson(response.data)));
      }else{
        emit(GovernoratesError(message:  "Something went wrong. Server returned: ${response.statusCode}"));
      }
    }catch(error){
      print("Error : $error");
      emit(GovernoratesError(message:  "Error : $error"));

    }
  }

}
class GetCitiesCubit extends Cubit<GetCitiesState> {
  GetCitiesCubit() : super(GetCitiesState());

  static GetCitiesCubit get(context) => BlocProvider.of<GetCitiesCubit>(context);


  Future<void> getCities({required int id}) async {
    // final connectivity = await Connectivity().checkConnectivity();
    // if (connectivity == ConnectivityResult.none) {
    //   emit(CitiesError(message: "لا يوجد اتصال بالإنترنت"));
    //   return;
    // }
    emit(CitiesLoading());
    try {
      final response = await DioHelper.getData(url: "cities/$id");
      if (response?.statusCode == 200) {
        emit(CitiesSuccess(
            citiesModel: GovernoratesModel.fromJson(response!.data)));
      } else {
        emit(CitiesError(
            message:
            "Something went wrong. Server returned: ${response?.statusCode}"));
      }
    } catch (error) {
      print("Error : $error");
      emit(CitiesError(message: "Error : $error"));
    }
  }
}
class GetCountiesCubit extends Cubit<GetCountiesState> {
  GetCountiesCubit() : super(GetCountiesState());

  static GetCountiesCubit get(context) => BlocProvider.of<GetCountiesCubit>(context);


  Future<void> getCounties({required int id}) async {
    // final connectivity = await Connectivity().checkConnectivity();
    // if (connectivity == ConnectivityResult.none) {
    //   emit(CitiesError(message: "لا يوجد اتصال بالإنترنت"));
    //   return;
    // }
    emit(CountiesLoading());
    try {
      final response = await DioHelper.getData(url: "counties/$id");
      if (response?.statusCode == 200) {
        emit(CountiesSuccess(
            countiesModel: GovernoratesModel.fromJson(response!.data)));
      } else {
        emit(CountiesError(
            message:
            "Something went wrong. Server returned: ${response?.statusCode}"));
      }
    } catch (error) {
      print("Error : $error");
      emit(CountiesError(message: "Error : $error"));
    }
  }
}
class GetBusinessTypesCubit extends Cubit<BusinessTypesState> {
  GetBusinessTypesCubit() : super(BusinessTypesState());

  static GetBusinessTypesCubit get(context) => BlocProvider.of<GetBusinessTypesCubit>(context);


  Future<void> getBusinessTypes() async {
    // final connectivity = await Connectivity().checkConnectivity();
    // if (connectivity == ConnectivityResult.none) {
    //   emit(CitiesError(message: "لا يوجد اتصال بالإنترنت"));
    //   return;
    // }
    emit(BusinessTypesLoading());
    try {
      final response = await DioHelper.getData(url: "business_types");
      if (response?.statusCode == 200) {
        emit(BusinessTypesSuccess(
            businessTypesModel: BusinessTypes.fromJson(response!.data)));
      } else {
        emit(BusinessTypesError(
            message:
            "Something went wrong. Server returned: ${response?.statusCode}"));
      }
    } catch (error) {
      print("Error : $error");
      emit(BusinessTypesError(message: "Error : $error"));
    }
  }
}
