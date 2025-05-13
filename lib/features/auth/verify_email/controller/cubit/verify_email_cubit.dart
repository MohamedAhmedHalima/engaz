import 'package:bloc/bloc.dart';
import 'package:engaz/core/network/api.dart';
import 'package:engaz/features/auth/verify_email/model/verify_email_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'verify_email_state.dart';

class VerifyEmailCubit extends Cubit<VerifyEmailState> {
  VerifyEmailCubit() : super(VerifyEmailInitial());
  static VerifyEmailCubit get(context) => BlocProvider.of(context);
  VerifyEmailModel? verifyEmailModel;
  Future<void> verifyEmail({
    required int? id,
    required String? otp,
  }) async {
    emit(VerifyEmailLoading());

    try {
      final response = await DioHelper.postData(
        url: 'verify',
        data: {"user_id": id, "verification_code": otp},
      );
      if (response?.statusCode == 200) {
        emit(VerifyEmailSuccess(verifyEmailModel: VerifyEmailModel.fromJson(response!.data!)));
      } else {
        emit(VerifyEmailError(
            message:
                "Something went wrong. Server returned: ${response?.data["message"]}"));
      }
    } catch (error) {
      print("Error : $error");
      emit(VerifyEmailError(message: "Error : $error"));
    }
  }
}
