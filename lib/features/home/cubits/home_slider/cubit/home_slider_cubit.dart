import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:engaz/core/network/api.dart';
import 'package:engaz/core/network/shared_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../models/slider_model.dart';
part 'home_slider_state.dart';

class HomeSliderCubit extends Cubit<HomeSliderState> {
  HomeSliderCubit() : super(HomeSliderInitial());
  SliderModel? sliderModel;
  static const String _getHomeSliderEndpoint = 'sliders';

  static HomeSliderCubit get(context) => BlocProvider.of(context);

  Future<void> getHomeSlider() async {
    emit(HomeSliderLoading());

    try {
      final token = await SharedPreferencesHelper.getToken();
      if (token == null || token.isEmpty) {
        emit(HomeSliderError(message: 'Token is null or empty'));
        return;
      }

      final response = await DioHelper.getData(
        url: _getHomeSliderEndpoint,
        token: token,
      );

      print(response?.data);

      if (response?.statusCode == 200) {
        sliderModel = SliderModel.fromJson(response?.data);
        if (sliderModel?.data!.isEmpty ?? true) {
          emit(HomeSliderError(message: 'No SubCategories found.'));
        } else {
          emit(HomeSliderSuccess(sliderModel: sliderModel!));
        }
      }
      else if (response?.statusCode == 404) {
        emit(HomeSliderError(
            message: 'No SubCategories found for this user.'));
      }
      else {
             emit(HomeSliderError(message: "الخدمة غير متاحة حاليًا، جرّب مرة تانية لاحقًا."));
        }
        } on DioException catch (e) {
        if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout ||
        e.type == DioExceptionType.unknown) {
        // ❌ دي غالبًا مشكلة إنترنت
        emit(HomeSliderError(message: "تأكد من اتصالك بالإنترنت وحاول مرة أخرى."));
        } else if (e.response?.statusCode != null && e.response!.statusCode! >= 500) {
        // 🔥 مشكلة من السيرفر نفسه
        emit(HomeSliderError(message: "الخدمة غير متاحة الآن، يرجى المحاولة لاحقًا."));
        } else {
        // ✴️ أي حاجة غير كده (زي 400، 404، إلخ)
        emit(HomeSliderError(message: "حدث خطأ غير متوقع، حاول مرة أخرى."));
        }
        } catch (e) {
          // ✴️ fallback لو حصل استثناء غير معروف
          emit(HomeSliderError(message: "حدث خطأ غير متوقع، حاول لاحقًا."));
        }
  }
}
