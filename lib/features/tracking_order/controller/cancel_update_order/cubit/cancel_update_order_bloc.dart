import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:engaz/core/network/api.dart';
import 'package:engaz/core/network/shared_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../model/traking_order_model.dart';
import '../../../widgets/order_details.dart';



part 'cancel_update_order_event.dart';

class CancelUpdateOrderCubit extends Cubit<CancelUpdateOrderState> {
  CancelUpdateOrderCubit() : super(CancelUpdateOrderInitial());
  ListOrdersResponse? listOrdersResponse;
  static const String _updateEndpoint = 'orders/update/order/';
  static const String _cancelEndpoint = 'checkout/cancel/order/';
  static CancelUpdateOrderCubit get(context) => BlocProvider.of(context);

  Future<void> updateOrder({required int id ,required List<ProductUpdate> updatesList}) async {
    emit(UpdateOrderLoading());

    try {
      final token = await SharedPreferencesHelper.getToken();
      if (token == null || token.isEmpty) {
        emit(UpdateOrderError(message: 'Token is null or empty'));
        return;
      }

      final response = await DioHelper.postData(
        url: _updateEndpoint+id.toString(),
        data: {
          "updates":updatesList
        },
        token: token,
      );

      if (response?.statusCode == 200) {
        listOrdersResponse = ListOrdersResponse.fromJson(response?.data);

        emit(UpdateOrderSuccess());

      } else if (response?.statusCode == 404) {
        emit(UpdateOrderError(message: 'No products found for this user.'));
      } else {
             emit(UpdateOrderError(message: "الخدمة غير متاحة حاليًا، جرّب مرة تانية لاحقًا."));
        }
        } on DioException catch (e) {
        if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout ||
        e.type == DioExceptionType.unknown) {
        // ❌ دي غالبًا مشكلة إنترنت
        emit(UpdateOrderError(message: "تأكد من اتصالك بالإنترنت وحاول مرة أخرى."));
        } else if (e.response?.statusCode != null && e.response!.statusCode! >= 500) {
        // 🔥 مشكلة من السيرفر نفسه
        emit(UpdateOrderError(message: "الخدمة غير متاحة الآن، يرجى المحاولة لاحقًا."));
        } else {
        // ✴️ أي حاجة غير كده (زي 400، 404، إلخ)
        emit(UpdateOrderError(message: "حدث خطأ غير متوقع، حاول مرة أخرى."));
        }
        } catch (e) {
          // ✴️ fallback لو حصل استثناء غير معروف
          emit(UpdateOrderError(message: "حدث خطأ غير متوقع، حاول لاحقًا."));
        }
  }
  Future<void> cancelOrder({required int id }) async {
    emit(CancelOrderLoading());

    try {
      final token = await SharedPreferencesHelper.getToken();
      if (token == null || token.isEmpty) {
        emit(CancelOrderError(message: 'Token is null or empty'));
        return;
      }

      final response = await DioHelper.postData(
        url: _cancelEndpoint+id.toString(),
        token: token,
      );

      if (response?.statusCode == 200) {
        // listOrdersResponse = ListOrdersResponse.fromJson(response?.data);

        emit(CancelOrderSuccess());

      } else if (response?.statusCode == 404) {
        emit(CancelOrderError(message: 'No products found for this user.'));
      } else {
             emit(CancelOrderError(message: "الخدمة غير متاحة حاليًا، جرّب مرة تانية لاحقًا."));
        }
        } on DioException catch (e) {
        if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout ||
        e.type == DioExceptionType.unknown) {
        // ❌ دي غالبًا مشكلة إنترنت
        emit(CancelOrderError(message: "تأكد من اتصالك بالإنترنت وحاول مرة أخرى."));
        } else if (e.response?.statusCode != null && e.response!.statusCode! >= 500) {
        // 🔥 مشكلة من السيرفر نفسه
        emit(CancelOrderError(message: "الخدمة غير متاحة الآن، يرجى المحاولة لاحقًا."));
        } else {
        // ✴️ أي حاجة غير كده (زي 400، 404، إلخ)
        emit(CancelOrderError(message: "حدث خطأ غير متوقع، حاول مرة أخرى."));
        }
        } catch (e) {
          // ✴️ fallback لو حصل استثناء غير معروف
          emit(CancelOrderError(message: "حدث خطأ غير متوقع، حاول لاحقًا."));
        }
  }
}
