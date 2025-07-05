import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:engaz/core/network/api.dart';
import 'package:engaz/core/network/shared_preferences.dart';
import 'package:engaz/features/home/models/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../model/get_user_data_model.dart';


part 'get_user_data_state.dart';

class GetUserDataCubit extends Cubit<GetUserDataState> {
  GetUserDataCubit() : super(GetUserDataInitial());
  UserData? userModel;
  static const String _getProductesEndpoint = 'me/info';
  static GetUserDataCubit get(context) => BlocProvider.of(context);

  Future<void> getUserData() async {
    emit(GetUserDataLoading());

    // try {
      final token = await SharedPreferencesHelper.getToken();
      if (token == null || token.isEmpty) {
        emit(GetUserDataError(message: 'Token is null or empty'));
        return;
      }

      final response = await DioHelper.getData(
        url: _getProductesEndpoint,
        token: token,
      );

      if (response?.statusCode == 200) {
        userModel = UserData.fromJson(response?.data["data"]);

        emit(GetUserDataSuccess(userModl: userModel!,));

      }
    //   else if (response?.statusCode == 404) {
    //     emit(GetUserDataError(message: 'No products found for this user.'));
    //   } else {
    //     emit(GetUserDataError(message: "الخدمة غير متاحة حاليًا، جرّب مرة تانية لاحقًا."));
    //   }
    // } on DioException catch (e) {
    //   if (e.type == DioExceptionType.connectionTimeout ||
    //       e.type == DioExceptionType.receiveTimeout ||
    //       e.type == DioExceptionType.unknown) {
    //     // ❌ دي غالبًا مشكلة إنترنت
    //     emit(GetUserDataError(message: "تأكد من اتصالك بالإنترنت وحاول مرة أخرى."));
    //   } else if (e.response?.statusCode != null && e.response!.statusCode! >= 500) {
    //     // 🔥 مشكلة من السيرفر نفسه
    //     emit(GetUserDataError(message: "الخدمة غير متاحة الآن، يرجى المحاولة لاحقًا."));
    //   } else {
    //     // ✴️ أي حاجة غير كده (زي 400، 404، إلخ)
    //     emit(GetUserDataError(message: "حدث خطأ غير متوقع، حاول مرة أخرى."));
    //   }
    // } catch (e) {
    //   // ✴️ fallback لو حصل استثناء غير معروف
    //   emit(GetUserDataError(message: "حدث خطأ غير متوقع، حاول لاحقًا."));
    // }
  }
}
