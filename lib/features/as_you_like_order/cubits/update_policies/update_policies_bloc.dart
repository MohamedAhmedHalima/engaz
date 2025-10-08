import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/network/api.dart';
import '../../../../../core/network/shared_preferences.dart';

part 'update_policies_state.dart';

class UpdatePoliciesCubit extends Cubit<UpdatePoliciesState> {
  UpdatePoliciesCubit() : super(UpdatePoliciesInitial());
  static UpdatePoliciesCubit get(context) => BlocProvider.of(context);
  Future<void> getCartCheckout({required int policy_id ,}) async {
    emit(UpdatePoliciesLoading());
    try {
      final token = await SharedPreferencesHelper.getToken();
      if (token == null || token.isEmpty) {
        emit(UpdatePoliciesError(message: 'Token is null or empty'));
        return;
      }
      final response = await DioHelper.postData(
        url: "user/policy/update",
        data: {
          "policy_id": policy_id
        },
        token: token,
      );
      if (response?.statusCode == 200) {
        emit(UpdatePoliciesSuccess());
       }
      else if (response?.statusCode == 404) {
        emit(
            UpdatePoliciesError(message: 'No categories found for this user.'));
      }
      else {
             emit(UpdatePoliciesError(message: "الخدمة غير متاحة حاليًا، جرّب مرة تانية لاحقًا."));
        }
        } on DioException catch (e) {
        if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout ||
        e.type == DioExceptionType.unknown) {
        // ❌ دي غالبًا مشكلة إنترنت
        emit(UpdatePoliciesError(message: "تأكد من اتصالك بالإنترنت وحاول مرة أخرى."));
        } else if (e.response?.statusCode != null && e.response!.statusCode! >= 500) {
        // 🔥 مشكلة من السيرفر نفسه
        emit(UpdatePoliciesError(message: "الخدمة غير متاحة الآن، يرجى المحاولة لاحقًا."));
        } else {
        // ✴️ أي حاجة غير كده (زي 400، 404، إلخ)
        emit(UpdatePoliciesError(message: "حدث خطأ غير متوقع، حاول مرة أخرى."));
        }
        } catch (e) {
          // ✴️ fallback لو حصل استثناء غير معروف
          emit(UpdatePoliciesError(message: "حدث خطأ غير متوقع، حاول لاحقًا."));
        }
  }
}
