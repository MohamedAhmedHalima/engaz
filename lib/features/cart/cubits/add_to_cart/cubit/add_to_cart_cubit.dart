import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:engaz/core/network/api.dart';
import 'package:engaz/features/home/models/add_fav_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'add_to_cart_state.dart';

class AddProductToCartListCubit extends Cubit<AddProductToCartListState> {
  AddProductToCartListCubit() : super(AddProductToCartListInitial());
  // FavouriteModel? favouriteModel;
  static const String _AddProductToCartList = 'cart/store';
  static const String _RemoveProductToCartList = 'cart/remove';
  static AddProductToCartListCubit get(context) => BlocProvider.of(context);

  Future<void> addToCartList({required int ? productId,required int ? quantity,required int ? unitId}) async {
    emit(AddProductToCartListLoading());
    try {
      final response = await DioHelper.postData(
          url: _AddProductToCartList, data: {
            "unit_id":unitId,
        "product_id": productId,
        "quantity": quantity
      });
      if (response!.statusCode == 200) {
        print('data SEND Request: ${jsonEncode(response.data)}');
        // favouriteModel = FavouriteModel.fromJson(response.data);
        emit(AddProductToCartListSuccess());
        print("AddProductToCartListSuccess");

      } else {
        emit(AddProductToCartListError(message: "الخدمة غير متاحة حاليًا، جرّب مرة تانية لاحقًا."));
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.unknown) {
        // ❌ دي غالبًا مشكلة إنترنت
        emit(AddProductToCartListError(message: "تأكد من اتصالك بالإنترنت وحاول مرة أخرى."));
      } else if (e.response?.statusCode != null && e.response!.statusCode! >= 500) {
        // 🔥 مشكلة من السيرفر نفسه
        emit(AddProductToCartListError(message: "الخدمة غير متاحة الآن، يرجى المحاولة لاحقًا."));
      } else {
        // ✴️ أي حاجة غير كده (زي 400، 404، إلخ)
        emit(AddProductToCartListError(message: "حدث خطأ غير متوقع، حاول مرة أخرى."));
      }
    } catch (e) {
      // ✴️ fallback لو حصل استثناء غير معروف
      emit(AddProductToCartListError(message: "حدث خطأ غير متوقع، حاول لاحقًا."));
    }
  }
  Future<void> addBundleToCartList({required int ? bundleId}) async {
    emit(AddBundleToCartListLoading());
    try {
      final response = await DioHelper.postData(
          url: "bundles/$bundleId", );
      if (response!.statusCode == 200) {
        print('data SEND Request: ${jsonEncode(response.data)}');
        // favouriteModel = FavouriteModel.fromJson(response.data);
        emit(AddBundleToCartListSuccess());

        print("AddBundleToCartListSuccess");

      } else {
        emit(AddBundleToCartListError(message: "الخدمة غير متاحة حاليًا، جرّب مرة تانية لاحقًا."));
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.unknown) {
        // ❌ دي غالبًا مشكلة إنترنت
        emit(AddBundleToCartListError(message: "تأكد من اتصالك بالإنترنت وحاول مرة أخرى."));
      } else if (e.response?.statusCode != null && e.response!.statusCode! >= 500) {
        // 🔥 مشكلة من السيرفر نفسه
        emit(AddBundleToCartListError(message: "الخدمة غير متاحة الآن، يرجى المحاولة لاحقًا."));
      } else {
        // ✴️ أي حاجة غير كده (زي 400، 404، إلخ)
        emit(AddBundleToCartListError(message: "حدث خطأ غير متوقع، حاول مرة أخرى."));
      }
    } catch (e) {
      // ✴️ fallback لو حصل استثناء غير معروف
      emit(AddBundleToCartListError(message: "حدث خطأ غير متوقع، حاول لاحقًا."));
    }
  }
  Future<void> removeToCartList({required int ? productId}) async {
    emit(RemoveProductToCartListLoading());
    try {
      final response = await DioHelper.deleteData(
          url: _RemoveProductToCartList+"/$productId",);
      if (response!.statusCode == 200) {
        print('data SEND Request: ${jsonEncode(response.data)}');
        emit(RemoveProductToCartListSuccess());

      } else {
        emit(RemoveProductToCartListError(message: "يوجد خطأ من السرفر"));
      }
    } catch (error) {
      emit(RemoveProductToCartListError(message: error.toString()));
    }
  }
  Future<void> removeALLCartList() async {
    emit(RemoveALLCartListLoading());
    try {
      final response = await DioHelper.deleteData(
          url:"cart/clean",);
      if (response!.statusCode == 200) {
        print('data SEND Request: ${jsonEncode(response.data)}');
        emit(RemoveALLCartListSuccess());

      } else {     emit(RemoveALLCartListError(message: "الخدمة غير متاحة حاليًا، جرّب مرة تانية لاحقًا."));
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.unknown) {
        // ❌ دي غالبًا مشكلة إنترنت
        emit(RemoveALLCartListError(message: "تأكد من اتصالك بالإنترنت وحاول مرة أخرى."));
      } else if (e.response?.statusCode != null && e.response!.statusCode! >= 500) {
        // 🔥 مشكلة من السيرفر نفسه
        emit(RemoveALLCartListError(message: "الخدمة غير متاحة الآن، يرجى المحاولة لاحقًا."));
      } else {
        // ✴️ أي حاجة غير كده (زي 400، 404، إلخ)
        emit(RemoveALLCartListError(message: "حدث خطأ غير متوقع، حاول مرة أخرى."));
      }
    } catch (e) {
      // ✴️ fallback لو حصل استثناء غير معروف
      emit(RemoveALLCartListError(message: "حدث خطأ غير متوقع، حاول لاحقًا."));
    }
  }
}
