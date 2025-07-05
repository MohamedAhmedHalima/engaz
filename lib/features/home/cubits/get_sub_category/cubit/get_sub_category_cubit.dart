import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:engaz/core/network/api.dart';
import 'package:engaz/core/network/shared_preferences.dart';
import 'package:engaz/features/home/models/get_sub_category_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
part 'get_sub_category_state.dart';

class GetSubCategoryCubit extends Cubit<GetSubCategoryState> {
  GetSubCategoryCubit() : super(GetSubCategoryInitial());
  SubCategoriesModel? subCategoriesModel;
  static const String _getSubCategoryEndpoint = 'product/subCategory';

  static GetSubCategoryCubit get(context) => BlocProvider.of(context);

  Future<void> getAllSubCategory({required String category}) async {
    emit(GetSubCategoryLoading());

    try {
      final token = await SharedPreferencesHelper.getToken();
      if (token == null || token.isEmpty) {
        emit(GetSubCategoryError(message: 'Token is null or empty'));
        return;
      }

      final response = await DioHelper.getData(
        data: {'category': category},
        url: _getSubCategoryEndpoint,
        token: token,
      );

      print(response?.data);

      if (response?.statusCode == 200) {
        subCategoriesModel = SubCategoriesModel.fromJson(response?.data);
        if (subCategoriesModel?.subCategories.isEmpty ?? true) {
          emit(GetSubCategoryError(message: 'No SubCategories found.'));
        } else {
          emit(GetSubCategorySuccess(subCategoriesModel: subCategoriesModel!));
        }
      } else if (response?.statusCode == 404) {
        emit(GetSubCategoryError(
            message: 'No SubCategories found for this user.'));
      } else {
             emit(GetSubCategoryError(message: "الخدمة غير متاحة حاليًا، جرّب مرة تانية لاحقًا."));
        }
        } on DioException catch (e) {
        if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout ||
        e.type == DioExceptionType.unknown) {
        // ❌ دي غالبًا مشكلة إنترنت
        emit(GetSubCategoryError(message: "تأكد من اتصالك بالإنترنت وحاول مرة أخرى."));
        } else if (e.response?.statusCode != null && e.response!.statusCode! >= 500) {
        // 🔥 مشكلة من السيرفر نفسه
        emit(GetSubCategoryError(message: "الخدمة غير متاحة الآن، يرجى المحاولة لاحقًا."));
        } else {
        // ✴️ أي حاجة غير كده (زي 400، 404، إلخ)
        emit(GetSubCategoryError(message: "حدث خطأ غير متوقع، حاول مرة أخرى."));
        }
        } catch (e) {
          // ✴️ fallback لو حصل استثناء غير معروف
          emit(GetSubCategoryError(message: "حدث خطأ غير متوقع، حاول لاحقًا."));
        }
  }
}
