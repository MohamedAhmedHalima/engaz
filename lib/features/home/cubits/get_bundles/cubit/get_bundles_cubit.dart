import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/network/api.dart';
import '../../../../../core/network/shared_preferences.dart';
import '../../../models/get_bundles_model.dart';


part 'get_bundles_event.dart';

class GetBundlesCubit extends Cubit<GetBundlesState> {
  GetBundlesCubit() : super(GetBundlesInitial());
  BundlesModel? getBundlesModel;
  static const String _getAllCategoryEndpoint = 'bundles';

  static GetBundlesCubit get(context) => BlocProvider.of(context);

  Future<void> getBundles() async {
    emit(GetBundlesLoading());

    try {
      final token = await SharedPreferencesHelper.getToken();
      if (token == null || token.isEmpty) {
        emit(GetBundlesError(message: 'Token is null or empty'));
        return;
      }

      final response = await DioHelper.getData(
        url: _getAllCategoryEndpoint,
        token: token,
      );

      if (response?.statusCode == 200) {
        getBundlesModel = BundlesModel.fromJson(response?.data);
        print(getBundlesModel);

        if (getBundlesModel?.data!.isEmpty ?? true) {
          emit(GetBundlesError(message: 'No categories found.'));
        } else {
          emit(
              GetBundlesSuccess(getBundlesModel: getBundlesModel!));
        }
      }
      else if (response?.statusCode == 404) {
        emit(
            GetBundlesError(message: 'No categories found for this user.'));
      } else {
             emit(GetBundlesError(message: "الخدمة غير متاحة حاليًا، جرّب مرة تانية لاحقًا."));
        }
        } on DioException catch (e) {
        if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout ||
        e.type == DioExceptionType.unknown) {
        // ❌ دي غالبًا مشكلة إنترنت
        emit(GetBundlesError(message: "تأكد من اتصالك بالإنترنت وحاول مرة أخرى."));
        } else if (e.response?.statusCode != null && e.response!.statusCode! >= 500) {
        // 🔥 مشكلة من السيرفر نفسه
        emit(GetBundlesError(message: "الخدمة غير متاحة الآن، يرجى المحاولة لاحقًا."));
        } else {
        // ✴️ أي حاجة غير كده (زي 400، 404، إلخ)
        emit(GetBundlesError(message: "حدث خطأ غير متوقع، حاول مرة أخرى."));
        }
        } catch (e) {
          // ✴️ fallback لو حصل استثناء غير معروف
          emit(GetBundlesError(message: "حدث خطأ غير متوقع، حاول لاحقًا."));
        }
  }
}
