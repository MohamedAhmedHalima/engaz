import 'dart:convert';
import 'package:bloc/bloc.dart';
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

      if (response!.statusCode == 200 ) {
        print('data SEND Request: ${jsonEncode(response.data)}');
        loginModel = LoginModel.fromJson(response.data);
        print('Parsed status: ${loginModel?.status}');
        print('Parsed message: ${loginModel?.message}');
        await saveToken(loginModel?.data!.accessToken ?? "");
        await SharedPreferencesHelper.saveUser(loginModel!.data!.user!);
        print(SharedPreferencesHelper.userModel!.name??"");
        // Check if the status is "SUCCESS"
        emit(LoginSuccess(loginModel: loginModel!));

      } else {
        emit(LoginError(message: "No response from the server"));
      }
    } catch (error) {
      print('DioError: ${error.toString()}');
      emit(LoginError(message: error.toString()));
    }
  }

  Future<void> saveToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
    print('Token saved to SharedPreferences');
  }
}
