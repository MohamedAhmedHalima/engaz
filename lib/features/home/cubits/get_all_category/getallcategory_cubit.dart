import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/network/api.dart';
import '../../../../core/network/shared_preferences.dart';
import '../../models/get_all_category_model.dart';

part 'getallcategory_state.dart';

class GetallcategoryCubit extends Cubit<GetallcategoryState> {
  GetallcategoryCubit() : super(GetallcategoryInitial());
  GetAllCategoryModel? getAllCategoryModel;
  static const String _getAllCategoryEndpoint = 'categories';

  static GetallcategoryCubit get(context) => BlocProvider.of(context);

  Future<void> getAllCategory() async {
    emit(GetallcategoryLoading());

    try {
      final token = await SharedPreferencesHelper.getToken();
      if (token == null || token.isEmpty) {
        emit(GetallcategoryError(message: 'Token is null or empty'));
        return;
      }

      final response = await DioHelper.getData(
        url: _getAllCategoryEndpoint,
        token: token,
      );

      if (response?.statusCode == 200) {
        getAllCategoryModel = GetAllCategoryModel.fromJson(response?.data);

        print(getAllCategoryModel?.data!.data);

        if (getAllCategoryModel?.data!.data!.isEmpty ?? true) {
          emit(GetallcategoryError(message: 'No categories found.'));
        } else {
          emit(
              GetallcategorySuccess(getAllCategoryModel: getAllCategoryModel!));
        }
      } else if (response?.statusCode == 404) {
        emit(
            GetallcategoryError(message: 'No categories found for this user.'));
      } else {
             emit(GetallcategoryError(message: "الخدمة غير متاحة حاليًا، جرّب مرة تانية لاحقًا."));
        }
        } on DioException catch (e) {
        if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout ||
        e.type == DioExceptionType.unknown) {
        // ❌ دي غالبًا مشكلة إنترنت
        emit(GetallcategoryError(message: "تأكد من اتصالك بالإنترنت وحاول مرة أخرى."));
        } else if (e.response?.statusCode != null && e.response!.statusCode! >= 500) {
        // 🔥 مشكلة من السيرفر نفسه
        emit(GetallcategoryError(message: "الخدمة غير متاحة الآن، يرجى المحاولة لاحقًا."));
        } else {
        // ✴️ أي حاجة غير كده (زي 400، 404، إلخ)
        emit(GetallcategoryError(message: "حدث خطأ غير متوقع، حاول مرة أخرى."));
        }
        } catch (e) {
          // ✴️ fallback لو حصل استثناء غير معروف
          emit(GetallcategoryError(message: "حدث خطأ غير متوقع، حاول لاحقًا."));
        }
  }
}
