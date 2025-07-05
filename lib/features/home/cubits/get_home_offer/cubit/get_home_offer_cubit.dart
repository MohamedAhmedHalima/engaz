import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:engaz/core/network/api.dart';
import 'package:engaz/core/network/shared_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../models/home_offer_model.dart';
import '../../../models/slider_model.dart';
part 'get_home_offer_state.dart';

class HomeOfferCubit extends Cubit<HomeOfferState> {
  HomeOfferCubit() : super(HomeOfferInitial());
  HomeOfferModel? offerModel;
  int pageNumber = 1;
  int pageSize = 10;
  List<OfferModel> offerList = [];
  static const String _getHomeOfferEndpoint = 'products/offers/list';
  // String? gUrl;

  static HomeOfferCubit get(context) => BlocProvider.of(context);

  Future<void> getHomeOffer() async {
    emit(HomeOfferLoading());

    try {
      final token = await SharedPreferencesHelper.getToken();
      if (token == null || token.isEmpty) {
        emit(HomeOfferError(message: 'Token is null or empty'));
        return;
      }

      final response = await DioHelper.getData(
        url: "${_getHomeOfferEndpoint!}?limit=$pageSize&page=$pageNumber",
        token: token,
      );
      // OfferModel (id:3,name:"عرض الملوك ",amount:5,discount:1,image:"https://order.webbing-agency.com/storage/01JYVS2P0BFF5MZ6VKB0N5FJHZ.png"),
      if (response?.statusCode == 200) {
        offerModel = HomeOfferModel.fromJson(response?.data);
        offerList = offerModel!.data!.data!;
        if (offerModel!.data!.data!.isEmpty) {
          emit(HomeOfferError(message: 'لا توجد عروض'));
        } else {
          emit(HomeUpdateOfferSuccess(offerList: offerList));
        }
      }
      else if (response?.statusCode == 404) {
        emit(HomeOfferError(
            message: 'No SubCategories found for this user.'));
      } else {
             emit(HomeOfferError(message: "الخدمة غير متاحة حاليًا، جرّب مرة تانية لاحقًا."));
        }
        } on DioException catch (e) {
        if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout ||
        e.type == DioExceptionType.unknown) {
        // ❌ دي غالبًا مشكلة إنترنت
        emit(HomeOfferError(message: "تأكد من اتصالك بالإنترنت وحاول مرة أخرى."));
        } else if (e.response?.statusCode != null && e.response!.statusCode! >= 500) {
        // 🔥 مشكلة من السيرفر نفسه
        emit(HomeOfferError(message: "الخدمة غير متاحة الآن، يرجى المحاولة لاحقًا."));
        } else {
        // ✴️ أي حاجة غير كده (زي 400، 404، إلخ)
        emit(HomeOfferError(message: "حدث خطأ غير متوقع، حاول مرة أخرى."));
        }
        } catch (e) {
          // ✴️ fallback لو حصل استثناء غير معروف
          emit(HomeOfferError(message: "حدث خطأ غير متوقع، حاول لاحقًا."));
        }
  }
  Future<void> getUpdateHomeOffer() async {
    emit(HomeUpdateOfferLoading());
    List<OfferModel> list = [];
    try {
      pageNumber++;

      final token = await SharedPreferencesHelper.getToken();
      if (token == null || token.isEmpty) {
        emit(HomeOfferError(message: 'Token is null or empty'));
        return;
      }

      final response = await DioHelper.getData(
        url: "${_getHomeOfferEndpoint!}?limit=$pageSize&page=$pageNumber",
        token: token,
      );

      if (response?.statusCode == 200) {
        offerModel = HomeOfferModel.fromJson(response?.data);
        list = offerModel!.data!.data!;

        if (list.isNotEmpty) {
          List<OfferModel>? updateProductList = List.from(offerList);
          updateProductList.addAll(list);
          offerList = [];
          offerList!.addAll(updateProductList);
        }
        emit(HomeOfferSuccess(offerList: offerList));
        if (list.isEmpty) {
          emit(HomeOfferEmpty());
        }
        list = [];
      }
      else if (response?.statusCode == 404) {
        emit(HomeOfferError(
            message: 'No SubCategories found for this user.'));
      } else {
             emit(HomeOfferError(message: "الخدمة غير متاحة حاليًا، جرّب مرة تانية لاحقًا."));
        }
        } on DioException catch (e) {
        if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout ||
        e.type == DioExceptionType.unknown) {
        // ❌ دي غالبًا مشكلة إنترنت
        emit(HomeOfferError(message: "تأكد من اتصالك بالإنترنت وحاول مرة أخرى."));
        } else if (e.response?.statusCode != null && e.response!.statusCode! >= 500) {
        // 🔥 مشكلة من السيرفر نفسه
        emit(HomeOfferError(message: "الخدمة غير متاحة الآن، يرجى المحاولة لاحقًا."));
        } else {
        // ✴️ أي حاجة غير كده (زي 400، 404، إلخ)
        emit(HomeOfferError(message: "حدث خطأ غير متوقع، حاول مرة أخرى."));
        }
        } catch (e) {
          // ✴️ fallback لو حصل استثناء غير معروف
          emit(HomeOfferError(message: "حدث خطأ غير متوقع، حاول لاحقًا."));
        }
  }
}
