import 'package:bloc/bloc.dart';
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

        if (getAllCategoryModel?.data!.data.isEmpty ?? true) {
          emit(GetallcategoryError(message: 'No categories found.'));
        } else {
          emit(
              GetallcategorySuccess(getAllCategoryModel: getAllCategoryModel!));
        }
      } else if (response?.statusCode == 404) {
        emit(
            GetallcategoryError(message: 'No categories found for this user.'));
      } else {
        emit(GetallcategoryError(
            message: 'Unexpected error: ${response?.statusCode}'));
      }
    } catch (e) {
      emit(GetallcategoryError(
          message: 'Failed to fetch categories: ${e.toString()}'));
    }
  }
}
