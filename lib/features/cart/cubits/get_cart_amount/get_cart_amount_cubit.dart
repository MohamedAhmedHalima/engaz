import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/network/api.dart';
import '../../../../../core/network/shared_preferences.dart';

part 'get_cart_amount_state.dart';

class GetAmountCubit extends Cubit<GetAmountState> {
  GetAmountCubit() : super(GetAmountInitial());

  static GetAmountCubit get(context) => BlocProvider.of(context);
  Future<void> getCartAmount( ) async {
    emit(GetAmountLoading());
    try {
      final token = await SharedPreferencesHelper.getToken();
      if (token == null || token.isEmpty) {
        emit(GetAmountError(message: 'Token is null or empty'));
        return;
      }

      final response = await DioHelper.getData(
        url: "cart/amount",
        token: token,
      );
      if (response?.statusCode == 200) {
        emit(  GetAmountSuccess(amount: response!.data["data"]["total"].toString(), count: response!.data["data"]["count"].toString()));
        print(GetAmountSuccess);
      }
      else if (response?.statusCode == 404) {
        emit(
            GetAmountError(message: 'No categories found for this user.'));
      } else {
            emit(GetAmountError(message: "الخدمة غير متاحة حاليًا، جرّب مرة تانية لاحقًا."));
        }
        } on DioException catch (e) {
        if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout ||
        e.type == DioExceptionType.unknown) {
        // ❌ دي غالبًا مشكلة إنترنت
        emit(GetAmountError(message: "تأكد من اتصالك بالإنترنت وحاول مرة أخرى."));
        } else if (e.response?.statusCode != null && e.response!.statusCode! >= 500) {
        // 🔥 مشكلة من السيرفر نفسه
        emit(GetAmountError(message: "الخدمة غير متاحة الآن، يرجى المحاولة لاحقًا."));
        } else {
        // ✴️ أي حاجة غير كده (زي 400، 404، إلخ)
        emit(GetAmountError(message: "حدث خطأ غير متوقع، حاول مرة أخرى."));
        }
        } catch (e) {
          // ✴️ fallback لو حصل استثناء غير معروف
          emit(GetAmountError(message: "حدث خطأ غير متوقع، حاول لاحقًا."));
        }
  }
}
