import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:engaz/core/network/api.dart';
import 'package:engaz/features/auth/reset_password/model/send_otp_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit() : super(ForgetPasswordInitial());
  SendOtpModel? sendOtpModel;

  static ForgetPasswordCubit get(context) => BlocProvider.of(context);

  Future<void> sendOtp({
    required String? email,
  }) async {
    emit(ForgetPasswordLoading());
    try {
      final response = await DioHelper.postData(
        url: 'reset/password',
        data: {
          'phone': email,
        },
      );

      if (response!.statusCode ==200) {
        print('data SEND Request: ${jsonEncode(response.data)}');

        sendOtpModel = SendOtpModel.fromJson(response.data);
        print('Parsed status: ${sendOtpModel?.status}');
        print('Parsed message: ${sendOtpModel?.message}');
        emit(ForgetPasswordSuccess(sendOtpModel: sendOtpModel!));

      } else {
    // ⚠️ السيرفر شغال بس رجّع خطأ (مثلاً 500)
    emit(ForgetPasswordError(message: "الخدمة غير متاحة حاليًا، جرّب مرة تانية لاحقًا."));
    }
    } on DioException catch (e) {
    if (e.type == DioExceptionType.connectionTimeout ||
    e.type == DioExceptionType.receiveTimeout ||
    e.type == DioExceptionType.unknown) {
    // ❌ دي غالبًا مشكلة إنترنت
    emit(ForgetPasswordError(message: "تأكد من اتصالك بالإنترنت وحاول مرة أخرى."));
    } else if (e.response?.statusCode != null && e.response!.statusCode! >= 500) {
    // 🔥 مشكلة من السيرفر نفسه
    emit(ForgetPasswordError(message: "الخدمة غير متاحة الآن، يرجى المحاولة لاحقًا."));
    } else {
    // ✴️ أي حاجة غير كده (زي 400، 404، إلخ)
    emit(ForgetPasswordError(message: "حدث خطأ غير متوقع، حاول مرة أخرى."));
    }
    } catch (e) {
    // ✴️ fallback لو حصل استثناء غير معروف
    emit(ForgetPasswordError(message: "حدث خطأ غير متوقع، حاول لاحقًا."));
    }
  }
}
