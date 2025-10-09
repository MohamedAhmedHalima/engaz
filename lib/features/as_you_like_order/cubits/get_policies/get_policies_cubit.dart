import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/network/api.dart';
import '../../../../../core/network/shared_preferences.dart';
import '../../model/policies_model.dart';

part 'get_policies_state.dart';

class GetAllPoliciesCubit extends Cubit<GetAllPoliciesState> {
  GetAllPoliciesCubit() : super(GetAllPoliciesInitial());
  PoliciesModel? policiesModel;
  static GetAllPoliciesCubit get(context) => BlocProvider.of(context);
  Future<void> getPolicies( ) async {
    emit(GetAllPoliciesLoading());
    try {
      final token = await SharedPreferencesHelper.getToken();
      if (token == null || token.isEmpty) {
        emit(GetAllPoliciesError(message: 'Token is null or empty'));
        return;
      }

      final response = await DioHelper.getData(
        url: "policies",
        token: token,
      );
      if (response?.statusCode == 200) {
        policiesModel = PoliciesModel.fromJson(response?.data);

        print(policiesModel?.data);

        if (policiesModel?.data!.isEmpty ?? true) {
          emit(GetAllPoliciesError(message: 'No categories found.'));
        } else {
          emit(
              GetAllPoliciesSuccess(policiesModel: policiesModel!));
        }
      }
      else if (response?.statusCode == 404) {
        emit(
            GetAllPoliciesError(message: 'No categories found for this user.'));
      } else {
            emit(GetAllPoliciesError(message: "الخدمة غير متاحة حاليًا، جرّب مرة تانية لاحقًا."));
        }
        } on DioException catch (e) {
        if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout ||
        e.type == DioExceptionType.unknown) {
        // ❌ دي غالبًا مشكلة إنترنت
        emit(GetAllPoliciesError(message: "تأكد من اتصالك بالإنترنت وحاول مرة أخرى."));
        } else if (e.response?.statusCode != null && e.response!.statusCode! >= 500) {
        // 🔥 مشكلة من السيرفر نفسه
        emit(GetAllPoliciesError(message: "الخدمة غير متاحة الآن، يرجى المحاولة لاحقًا."));
        } else {
        // ✴️ أي حاجة غير كده (زي 400، 404، إلخ)
        emit(GetAllPoliciesError(message: "حدث خطأ غير متوقع، حاول مرة أخرى."));
        }
        } catch (e) {
          // ✴️ fallback لو حصل استثناء غير معروف
          emit(GetAllPoliciesError(message: "حدث خطأ غير متوقع، حاول لاحقًا."));
        }
  }
}
