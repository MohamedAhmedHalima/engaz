import 'dart:convert';

import 'package:bloc/bloc.dart';
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
        emit(ForgetPasswordError(message: "No response from the server"));
      }
    } catch (error) {
      print('DioError: ${error.toString()}');
      String errorMessage = error.toString();
      if (errorMessage.contains("SocketException")) {
        errorMessage = "Network error. Please check your internet connection.";
      } else if (errorMessage.contains("TimeoutException")) {
        errorMessage = "The request timed out. Please try again.";
      }
      emit(ForgetPasswordError(message: errorMessage));
    }
  }
}
