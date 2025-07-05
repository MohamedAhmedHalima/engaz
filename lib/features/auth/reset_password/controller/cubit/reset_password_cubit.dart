import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:engaz/core/network/api.dart';
import 'package:engaz/features/auth/reset_password/model/reset_password_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit() : super(ResetPasswordInitial());
  ResetPasswordModel? resetPasswordModel;
  static ResetPasswordCubit get(context) => BlocProvider.of(context);
  Future<void> resetPassword({
    required String? otp,
    required String? password,
    required String? confirmPassword,
  }) async {
    emit(ResetPasswordLoading());
    try {
      final response = await DioHelper.postData(
        url: 'change/password',
        data: {
          'otp': otp,
          'password': password,
          'password_confirmation': confirmPassword
        },
      );

      if (response!.statusCode ==200) {
        print('data SEND Request: ${jsonEncode(response.data)}');

        resetPasswordModel = ResetPasswordModel.fromJson(response.data);
        print('Parsed status: ${resetPasswordModel?.status}');
        print('Parsed message: ${resetPasswordModel?.message}');
        emit(ResetPasswordSuccess(resetPasswordModel: resetPasswordModel!));

      } else {

        emit(ResetPasswordError(message: "الخدمة غير متاحة حاليًا، جرّب مرة تانية لاحقًا."));
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.unknown) {
        // ❌ دي غالبًا مشكلة إنترنت
        emit(ResetPasswordError(message: "تأكد من اتصالك بالإنترنت وحاول مرة أخرى."));
      } else if (e.response?.statusCode != null && e.response!.statusCode! >= 500) {
        // 🔥 مشكلة من السيرفر نفسه
        emit(ResetPasswordError(message: "الخدمة غير متاحة الآن، يرجى المحاولة لاحقًا."));
      } else {
        // ✴️ أي حاجة غير كده (زي 400، 404، إلخ)
        emit(ResetPasswordError(message: "حدث خطأ غير متوقع، حاول مرة أخرى."));
      }
    } catch (e) {
      // ✴️ fallback لو حصل استثناء غير معروف
      emit(ResetPasswordError(message: "حدث خطأ غير متوقع، حاول لاحقًا."));
    }

  }
}
