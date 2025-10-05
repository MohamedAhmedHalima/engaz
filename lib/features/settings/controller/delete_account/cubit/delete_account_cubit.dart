import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:engaz/core/network/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/network/shared_preferences.dart';

part 'delete_account_state.dart';



class DeleteAccountCubit extends Cubit<DeleteAccountState> {
  DeleteAccountCubit() : super(DeleteAccountInitial());

  static DeleteAccountCubit get(context) => BlocProvider.of(context);

  Future<void> DeleteAccount() async {
    emit(DeleteAccountLoading());

    try {
      final token = await SharedPreferencesHelper.getToken();
      if (token == null || token.isEmpty) {
        emit(DeleteAccountError(message: 'Token is null or empty'));
        return;
      }
      final response = await DioHelper.postData(
        url: 'users/destroy',
      );

      if (response!.statusCode == 200) {

        emit(DeleteAccountSuccess());
      }
      else {
        // ⚠️ السيرفر شغال بس رجّع خطأ (مثلاً 500)
        emit(DeleteAccountError(message: "الخدمة غير متاحة حاليًا، جرّب مرة تانية لاحقًا."));
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.unknown) {
        // ❌ دي غالبًا مشكلة إنترنت
        emit(DeleteAccountError(message: "تأكد من اتصالك بالإنترنت وحاول مرة أخرى."));
      } else if (e.response?.statusCode != null && e.response!.statusCode! >= 500) {
        // 🔥 مشكلة من السيرفر نفسه
        emit(DeleteAccountError(message: "الخدمة غير متاحة الآن، يرجى المحاولة لاحقًا."));
      } else {
        // ✴️ أي حاجة غير كده (زي 400، 404، إلخ)
        emit(DeleteAccountError(message: "حدث خطأ غير متوقع، حاول مرة أخرى."));
      }
    } catch (e) {
      // ✴️ fallback لو حصل استثناء غير معروف
      emit(DeleteAccountError(message: "حدث خطأ غير متوقع، حاول لاحقًا."));
    }
  }

}
