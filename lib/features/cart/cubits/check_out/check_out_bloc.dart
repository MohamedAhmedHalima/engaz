import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/network/api.dart';
import '../../../../../core/network/shared_preferences.dart';

part 'check_out_state.dart';

class CheckOutCubit extends Cubit<CheckOutState> {
  CheckOutCubit() : super(CheckOutInitial());
  static CheckOutCubit get(context) => BlocProvider.of(context);
  Future<void> getCartCheckout({required String date ,required String payment_method  ,  String?note  ,required String delivery_shift  ,}) async {
    emit(CheckOutLoading());
    try {
      final token = await SharedPreferencesHelper.getToken();
      if (token == null || token.isEmpty) {
        emit(CheckOutError(message: 'Token is null or empty'));
        return;
      }
      final response = await DioHelper.postData(
        url: "checkout",
        data: {
          "date":date,
          "note":note,
          "payment_method":payment_method ,
          "delivery_shift":delivery_shift ,
},
        token: token,
      );
      if (response?.statusCode == 200) {
        emit(CheckOutSuccess());
       }
      else if (response?.statusCode == 404) {
        emit(
            CheckOutError(message: 'No categories found for this user.'));
      }
      else {
             emit(CheckOutError(message: "الخدمة غير متاحة حاليًا، جرّب مرة تانية لاحقًا."));
        }
        } on DioException catch (e) {
        if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout ||
        e.type == DioExceptionType.unknown) {
        // ❌ دي غالبًا مشكلة إنترنت
        emit(CheckOutError(message: "تأكد من اتصالك بالإنترنت وحاول مرة أخرى."));
        } else if (e.response?.statusCode != null && e.response!.statusCode! >= 500) {
        // 🔥 مشكلة من السيرفر نفسه
        emit(CheckOutError(message: "الخدمة غير متاحة الآن، يرجى المحاولة لاحقًا."));
        } else {
        // ✴️ أي حاجة غير كده (زي 400، 404، إلخ)
        emit(CheckOutError(message: "حدث خطأ غير متوقع، حاول مرة أخرى."));
        }
        } catch (e) {
          // ✴️ fallback لو حصل استثناء غير معروف
          emit(CheckOutError(message: "حدث خطأ غير متوقع، حاول لاحقًا."));
        }
  }
}
