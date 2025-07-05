import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:engaz/features/favorite/models/get_all_list_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/network/api.dart';
import '../../../../../core/network/shared_preferences.dart';
import '../../model/cart_model.dart';

part 'get_cart_item_state.dart';

class GetAllCartListCubit extends Cubit<GetAllCartListState> {
  GetAllCartListCubit() : super(GetAllCartListInitial());
  CartModel? cartListModel;
  static GetAllCartListCubit get(context) => BlocProvider.of(context);
  Future<void> getCartList( ) async {
    emit(GetAllCartListLoading());
    try {
      final token = await SharedPreferencesHelper.getToken();
      if (token == null || token.isEmpty) {
        emit(GetAllCartListError(message: 'Token is null or empty'));
        return;
      }

      final response = await DioHelper.getData(
        url: "cart",
        token: token,
      );
      if (response?.statusCode == 200) {
        cartListModel = CartModel.fromJson(response?.data);

        print(cartListModel?.data);

        if (cartListModel?.data!.isEmpty ?? true) {
          emit(GetAllCartListError(message: 'No categories found.'));
        } else {
          emit(
              GetAllCartListSuccess(cartListModel: cartListModel!));
        }
      }
      else if (response?.statusCode == 404) {
        emit(
            GetAllCartListError(message: 'No categories found for this user.'));
      } else {
            emit(GetAllCartListError(message: "الخدمة غير متاحة حاليًا، جرّب مرة تانية لاحقًا."));
        }
        } on DioException catch (e) {
        if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout ||
        e.type == DioExceptionType.unknown) {
        // ❌ دي غالبًا مشكلة إنترنت
        emit(GetAllCartListError(message: "تأكد من اتصالك بالإنترنت وحاول مرة أخرى."));
        } else if (e.response?.statusCode != null && e.response!.statusCode! >= 500) {
        // 🔥 مشكلة من السيرفر نفسه
        emit(GetAllCartListError(message: "الخدمة غير متاحة الآن، يرجى المحاولة لاحقًا."));
        } else {
        // ✴️ أي حاجة غير كده (زي 400، 404، إلخ)
        emit(GetAllCartListError(message: "حدث خطأ غير متوقع، حاول مرة أخرى."));
        }
        } catch (e) {
          // ✴️ fallback لو حصل استثناء غير معروف
          emit(GetAllCartListError(message: "حدث خطأ غير متوقع، حاول لاحقًا."));
        }
  }
}
