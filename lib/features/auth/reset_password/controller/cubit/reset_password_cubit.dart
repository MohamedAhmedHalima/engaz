import 'dart:convert';

import 'package:bloc/bloc.dart';
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

        emit(ResetPasswordError(
            message: resetPasswordModel?.message ?? "Unknown error"));
      }
    } catch (error) {
      print('DioError: ${error.toString()}');
      String errorMessage = error.toString();
      if (errorMessage.contains("SocketException")) {
        errorMessage = "Network error. Please check your internet connection.";
      } else if (errorMessage.contains("TimeoutException")) {
        errorMessage = "The request timed out. Please try again.";
      }
      emit(ResetPasswordError(message: errorMessage));
    }
  }
}
