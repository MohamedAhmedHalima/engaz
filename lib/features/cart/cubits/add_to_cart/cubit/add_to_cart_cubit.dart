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

  Future<void> addToCartList({required int ? productId,required int ? quantity}) async {
    emit(AddProductToCartListLoading());
    try {
      final response = await DioHelper.postData(
          url: _AddProductToCartList, data: {
        "product_id": productId,
        "quantity": quantity
      });
      if (response!.statusCode == 200) {
        print('data SEND Request: ${jsonEncode(response.data)}');
        // favouriteModel = FavouriteModel.fromJson(response.data);
        emit(AddProductToCartListSuccess());
        print("AddProductToCartListSuccess");

      } else {
        emit(AddProductToCartListError(message: "يوجد خطأ من السرفر"));
      }
    } catch (error) {
      emit(AddProductToCartListError(message: error.toString()));
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
}
