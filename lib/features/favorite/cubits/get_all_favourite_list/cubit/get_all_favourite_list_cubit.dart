import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:engaz/features/favorite/models/get_all_list_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/network/api.dart';
import '../../../../../core/network/shared_preferences.dart';
import '../../../../home/models/product_model.dart';

part 'get_all_favourite_list_state.dart';

class GetAllFavouriteListCubit extends Cubit<GetAllFavouriteListState> {
  GetAllFavouriteListCubit() : super(GetAllFavouriteListInitial());
  FavouriteListModel? favouriteListModel;
  static GetAllFavouriteListCubit get(context) => BlocProvider.of(context);
  Future<void> getFavouriteList( ) async {
    emit(GetAllFavouriteListLoading());
    try {
      final token = await SharedPreferencesHelper.getToken();
      if (token == null || token.isEmpty) {
        emit(GetAllFavouriteListError(message: 'Token is null or empty'));
        return;
      }

      final response = await DioHelper.getData(
        url: "wishlist",
        token: token,
      );
      if (response?.statusCode == 200) {
        favouriteListModel = FavouriteListModel.fromJson(response?.data);

        print(favouriteListModel?.data);

        if (favouriteListModel?.data! .isEmpty ?? true) {
          emit(GetAllFavouriteListError(message: 'No categories found.'));
        } else {
          emit(
              GetAllFavouriteListSuccess(favouriteListModel: favouriteListModel!));
        }
      }
      else if (response?.statusCode == 404) {
        emit(
            GetAllFavouriteListError(message: 'No categories found for this user.'));
      } else {
        emit(GetAllFavouriteListError(message: "الخدمة غير متاحة حاليًا، جرّب مرة تانية لاحقًا."));
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.unknown) {
        // ❌ دي غالبًا مشكلة إنترنت
        emit(GetAllFavouriteListError(message: "تأكد من اتصالك بالإنترنت وحاول مرة أخرى."));
      } else if (e.response?.statusCode != null && e.response!.statusCode! >= 500) {
        // 🔥 مشكلة من السيرفر نفسه
        emit(GetAllFavouriteListError(message: "الخدمة غير متاحة الآن، يرجى المحاولة لاحقًا."));
      } else {
        // ✴️ أي حاجة غير كده (زي 400، 404، إلخ)
        emit(GetAllFavouriteListError(message: "حدث خطأ غير متوقع، حاول مرة أخرى."));
      }
    } catch (e) {
      // ✴️ fallback لو حصل استثناء غير معروف
      emit(GetAllFavouriteListError(message: "حدث خطأ غير متوقع، حاول لاحقًا."));
    }
  }
}
