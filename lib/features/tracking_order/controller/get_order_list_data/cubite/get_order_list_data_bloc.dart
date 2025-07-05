import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:engaz/core/network/api.dart';
import 'package:engaz/core/network/shared_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../model/traking_order_model.dart';



part 'get_order_list_data_state.dart';

class GetOrderListDataCubit extends Cubit<GetOrderListDataState> {
  GetOrderListDataCubit() : super(GetOrderListDataInitial());
  ListOrdersResponse? listOrdersResponse;
  static const String _getProductesEndpoint = 'checkout/orders';
  static GetOrderListDataCubit get(context) => BlocProvider.of(context);

  Future<void> getOrderListData() async {
    emit(GetOrderListDataLoading());

    // try {
      final token = await SharedPreferencesHelper.getToken();
      if (token == null || token.isEmpty) {
        emit(GetOrderListDataError(message: 'Token is null or empty'));
        return;
      }

      final response = await DioHelper.getData(
        url: _getProductesEndpoint,
        token: token,
      );

      if (response?.statusCode == 200) {
        listOrdersResponse = ListOrdersResponse.fromJson(response?.data);

        emit(GetOrderListDataSuccess(listOrdersResponse: listOrdersResponse!,));

      }
      // else if (response?.statusCode == 404) {
      //   emit(GetOrderListDataError(message: 'No products found for this user.'));
      // } else {
      //        emit(GetOrderListDataError(message: "الخدمة غير متاحة حاليًا، جرّب مرة تانية لاحقًا."));
      //   }
      //   } on DioException catch (e) {
      //   if (e.type == DioExceptionType.connectionTimeout ||
      //   e.type == DioExceptionType.receiveTimeout ||
      //   e.type == DioExceptionType.unknown) {
      //   // ❌ دي غالبًا مشكلة إنترنت
      //   emit(GetOrderListDataError(message: "تأكد من اتصالك بالإنترنت وحاول مرة أخرى."));
      //   } else if (e.response?.statusCode != null && e.response!.statusCode! >= 500) {
      //   // 🔥 مشكلة من السيرفر نفسه
      //   emit(GetOrderListDataError(message: "الخدمة غير متاحة الآن، يرجى المحاولة لاحقًا."));
      //   } else {
      //   // ✴️ أي حاجة غير كده (زي 400، 404، إلخ)
      //   emit(GetOrderListDataError(message: "حدث خطأ غير متوقع، حاول مرة أخرى."));
      //   }
      //   } catch (e) {
      //     // ✴️ fallback لو حصل استثناء غير معروف
      //     emit(GetOrderListDataError(message: "حدث خطأ غير متوقع، حاول لاحقًا."));
      //   }
  }
}
