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
        emit(AddProductToFavoritListError(message: "يوجد خطأ من السرفر"));
      }
    } catch (error) {
      emit(AddProductToFavoritListError(message: error.toString()));
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
        emit(RemoveProductToFavoritListError(message: "يوجد خطأ من السرفر"));
      }
    } catch (error) {
      emit(RemoveProductToFavoritListError(message: error.toString()));
    }
  }
}
