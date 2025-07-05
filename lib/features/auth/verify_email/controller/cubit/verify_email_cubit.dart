import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
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
            emit(VerifyEmailError(message: "الخدمة غير متاحة حاليًا، جرّب مرة تانية لاحقًا."));
        }
        } on DioException catch (e) {
        if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout ||
        e.type == DioExceptionType.unknown) {
        // ❌ دي غالبًا مشكلة إنترنت
        emit(VerifyEmailError(message: "تأكد من اتصالك بالإنترنت وحاول مرة أخرى."));
        } else if (e.response?.statusCode != null && e.response!.statusCode! >= 500) {
        // 🔥 مشكلة من السيرفر نفسه
        emit(VerifyEmailError(message: "الخدمة غير متاحة الآن، يرجى المحاولة لاحقًا."));
        } else {
        // ✴️ أي حاجة غير كده (زي 400، 404، إلخ)
        emit(VerifyEmailError(message: "حدث خطأ غير متوقع، حاول مرة أخرى."));
        }
        } catch (e) {
          // ✴️ fallback لو حصل استثناء غير معروف
          emit(VerifyEmailError(message: "حدث خطأ غير متوقع، حاول لاحقًا."));
        }
  }
}
