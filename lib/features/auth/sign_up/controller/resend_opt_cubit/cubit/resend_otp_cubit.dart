import 'dart:convert';

import 'package:bloc/bloc.dart';
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
        emit(ResendOtpError(
            message:
            "Something went wrong. Server returned: ${response?.data["message"]}"));
      }
    } catch (error) {
      print("Error : $error");
      emit(ResendOtpError(message: "Error : $error"));
    }
  }
}