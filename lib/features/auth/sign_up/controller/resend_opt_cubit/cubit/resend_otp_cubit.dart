import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:engaz/core/network/api.dart';
import 'package:engaz/features/auth/sign_up/model/resend_otp_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'resend_otp_state.dart';

class ResendOtpCubit extends Cubit<ResendOtpState> {
  ResendOtpCubit() : super(ResendOtpInitial());

  ResendOtpModel? resendOtpModel;

  static ResendOtpCubit get(context) => BlocProvider.of(context);

  Future<void> resendOtp(
      {required String ?phone,required int? id }) async {
    emit(ResendOtpLoading());

    try {
      final response = await DioHelper.postData(
        url: "resendVerification",
        data: {
          "user_id": id,
          "phone": phone
        }
      );

      if (response?.statusCode == 200) {
        emit(ResendOtpSuccess(resendOtpModel: ResendOtpModel.fromJson(response!.data!)));
      } else {
        emit(ResendOtpError(message: "الخدمة غير متاحة حاليًا، جرّب مرة تانية لاحقًا."));
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.unknown) {
        // ❌ دي غالبًا مشكلة إنترنت
        emit(ResendOtpError(message: "تأكد من اتصالك بالإنترنت وحاول مرة أخرى."));
      } else if (e.response?.statusCode != null && e.response!.statusCode! >= 500) {
        // 🔥 مشكلة من السيرفر نفسه
        emit(ResendOtpError(message: "الخدمة غير متاحة الآن، يرجى المحاولة لاحقًا."));
      } else {
        // ✴️ أي حاجة غير كده (زي 400، 404، إلخ)
        emit(ResendOtpError(message: "حدث خطأ غير متوقع، حاول مرة أخرى."));
      }
    } catch (e) {
      // ✴️ fallback لو حصل استثناء غير معروف
      emit(ResendOtpError(message: "حدث خطأ غير متوقع، حاول لاحقًا."));
    }
  }
}