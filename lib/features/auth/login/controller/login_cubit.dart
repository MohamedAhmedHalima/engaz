import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:engaz/core/network/api.dart';
import 'package:engaz/features/auth/login/model/login_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/network/shared_preferences.dart';
import '../../sign_up/model/sign_up_model.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  LoginModel? loginModel;

  static LoginCubit get(context) => BlocProvider.of(context);

  Future<void> logIn({required String email, required String password}) async {
    emit(LoginLoading());

    try {
    final response = await DioHelper.postData(
      url: 'login',
      data: {
        'phone': email,
        'password': password,
      },
    );

    if (response!.statusCode == 200) {
      print('data SEND Request: ${jsonEncode(response.data)}');
      loginModel = LoginModel.fromJson(response.data);
      print('Parsed status: ${loginModel?.status}');
      print('Parsed message: ${loginModel?.message}');
      // await saveToken(loginModel?.data!.accessToken ?? "");
      await SharedPreferencesHelper.saveUser(loginModel!.data!.user!);
      await SharedPreferencesHelper.saveToken(loginModel?.data!.accessToken ?? "");
      print(SharedPreferencesHelper.userModel!.name ?? "");
      // Check if the status is "SUCCESS"
      emit(LoginSuccess(loginModel: loginModel!));
    }
      else {
        // ⚠️ السيرفر شغال بس رجّع خطأ (مثلاً 500)
        emit(LoginError(message: "الخدمة غير متاحة حاليًا، جرّب مرة تانية لاحقًا."));
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.unknown) {
        // ❌ دي غالبًا مشكلة إنترنت
        emit(LoginError(message: "تأكد من اتصالك بالإنترنت وحاول مرة أخرى."));
      } else if (e.response?.statusCode != null && e.response!.statusCode! >= 500) {
        // 🔥 مشكلة من السيرفر نفسه
        emit(LoginError(message: "الخدمة غير متاحة الآن، يرجى المحاولة لاحقًا."));
      } else {
        // ✴️ أي حاجة غير كده (زي 400، 404، إلخ)
        emit(LoginError(message: "حدث خطأ غير متوقع، حاول مرة أخرى."));
      }
    } catch (e) {
      // ✴️ fallback لو حصل استثناء غير معروف
      emit(LoginError(message: "حدث خطأ غير متوقع، حاول لاحقًا."));
    }
  }

}
