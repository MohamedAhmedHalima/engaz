import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:engaz/core/network/api.dart';
import 'package:engaz/features/home/models/add_fav_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'add_product_to_favorit_list_state.dart';

class AddProductToFavoritListCubit extends Cubit<AddProductToFavoritListState> {
  AddProductToFavoritListCubit() : super(AddProductToFavoritListInitial());
  static const String _AddProductToFavoritList = 'wishlist/store';
  static const String _RemoveProductToFavoritList = 'wishlist/remove';
  static AddProductToFavoritListCubit get(context) => BlocProvider.of(context);

  Future<void> addToFavoritList({required int? productId}) async {
    emit(AddProductToFavoritListLoading());
    try {
      final response = await DioHelper.postData(
          url: _AddProductToFavoritList, data: {'product_id': productId});
      if (response!.statusCode == 200) {
        print('data SEND Request: ${jsonEncode(response.data)}');

        emit(AddProductToFavoritListSuccess());
      }
      else {
         emit(AddProductToFavoritListError(message: "الخدمة غير متاحة حاليًا، جرّب مرة تانية لاحقًا."));
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.unknown) {
        // ❌ دي غالبًا مشكلة إنترنت
        emit(AddProductToFavoritListError(message: "تأكد من اتصالك بالإنترنت وحاول مرة أخرى."));
      } else if (e.response?.statusCode != null && e.response!.statusCode! >= 500) {
        // 🔥 مشكلة من السيرفر نفسه
        emit(AddProductToFavoritListError(message: "الخدمة غير متاحة الآن، يرجى المحاولة لاحقًا."));
      } else {
        // ✴️ أي حاجة غير كده (زي 400، 404، إلخ)
        emit(AddProductToFavoritListError(message: "حدث خطأ غير متوقع، حاول مرة أخرى."));
      }
    } catch (e) {
      // ✴️ fallback لو حصل استثناء غير معروف
      emit(AddProductToFavoritListError(message: "حدث خطأ غير متوقع، حاول لاحقًا."));
    }
  }
  Future<void> removeToFavoritList({required int? productId}) async {
    emit(RemoveProductToFavoritListLoading());
    try {
      final response = await DioHelper.deleteData(
          url: _RemoveProductToFavoritList, data: {'product_id': productId});
      if (response!.statusCode == 200) {
        print('data SEND Request: ${jsonEncode(response.data)}');

        emit(RemoveProductToFavoritListSuccess());
      }

      else {
         emit(RemoveProductToFavoritListError(message: "الخدمة غير متاحة حاليًا، جرّب مرة تانية لاحقًا."));
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.unknown) {
        // ❌ دي غالبًا مشكلة إنترنت
        emit(RemoveProductToFavoritListError(message: "تأكد من اتصالك بالإنترنت وحاول مرة أخرى."));
      } else if (e.response?.statusCode != null && e.response!.statusCode! >= 500) {
        // 🔥 مشكلة من السيرفر نفسه
        emit(RemoveProductToFavoritListError(message: "الخدمة غير متاحة الآن، يرجى المحاولة لاحقًا."));
      } else {
        // ✴️ أي حاجة غير كده (زي 400، 404، إلخ)
        emit(RemoveProductToFavoritListError(message: "حدث خطأ غير متوقع، حاول مرة أخرى."));
      }
    } catch (e) {
      // ✴️ fallback لو حصل استثناء غير معروف
      emit(RemoveProductToFavoritListError(message: "حدث خطأ غير متوقع، حاول لاحقًا."));
    }
  }
  Future<void> removeAllFavoritList() async {
    emit(RemoveALLFavoritListLoading());
    try {
      final response = await DioHelper.deleteData(
          url: "wishlist/clean", );
      if (response!.statusCode == 200) {
        print('data SEND Request: ${jsonEncode(response.data)}');

        emit(RemoveALLFavoritListSuccess());
      }

      else {
        emit(RemoveALLFavoritListError(message: "الخدمة غير متاحة حاليًا، جرّب مرة تانية لاحقًا."));
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.unknown) {
        // ❌ دي غالبًا مشكلة إنترنت
        emit(RemoveALLFavoritListError(message: "تأكد من اتصالك بالإنترنت وحاول مرة أخرى."));
      } else if (e.response?.statusCode != null && e.response!.statusCode! >= 500) {
        // 🔥 مشكلة من السيرفر نفسه
        emit(RemoveALLFavoritListError(message: "الخدمة غير متاحة الآن، يرجى المحاولة لاحقًا."));
      } else {
        // ✴️ أي حاجة غير كده (زي 400، 404، إلخ)
        emit(RemoveALLFavoritListError(message: "حدث خطأ غير متوقع، حاول مرة أخرى."));
      }
    } catch (e) {
      // ✴️ fallback لو حصل استثناء غير معروف
      emit(RemoveALLFavoritListError(message: "حدث خطأ غير متوقع، حاول لاحقًا."));
    }
  }
}
