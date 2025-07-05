import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:engaz/core/network/api.dart';
import 'package:engaz/core/network/shared_preferences.dart';
import 'package:engaz/features/home/models/get_all_company_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'get_all_company_state.dart';

class GetAllCompanyCubit extends Cubit<GetAllCompanyState> {
  GetAllCompanyCubit() : super(GetAllCompanyInitial());
  static const String _getAllCompanyEndpoint = 'companies';
  int pageNumber = 1;
  int pageSize = 10;
  List<Company> companyList = [];
  GetAllCompanyModel? getAllCompanyModel;
  static GetAllCompanyCubit get(context) => BlocProvider.of(context);
  String? gUrl;
  Future<void> getAllComapny({required String url}) async {
    emit(GetAllCompanyLoading());
    gUrl = url;
    try {
      final token = await SharedPreferencesHelper.getToken();
      if (token == null || token.isEmpty) {
        emit(GetAllCompanyError(message: 'Token is null or empty'));
        return;
      }
      final response = await DioHelper.getData(
        url: "${url!}&limit=$pageSize&page=$pageNumber",
        token: token,
      );

      if (response?.statusCode == 200) {
        getAllCompanyModel = GetAllCompanyModel.fromJson(response?.data);
        companyList = getAllCompanyModel!.data!.data!;
        if (getAllCompanyModel!.data!.data!.isEmpty) {
          emit(GetAllCompanyError(message: 'No products found.'));
        } else {
          emit(GetAllCompanySuccess(companyList: companyList));
        }
      }
      else if (response?.statusCode == 404) {
        emit(GetAllCompanyError(message: 'No products found for this user.'));
      }
      else {
        emit(GetAllCompanyError(
            message: "الخدمة غير متاحة حاليًا، جرّب مرة تانية لاحقًا."));
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.unknown) {
        // ❌ دي غالبًا مشكلة إنترنت
        emit(GetAllCompanyError(
            message: "تأكد من اتصالك بالإنترنت وحاول مرة أخرى."));
      }
      else if (e.response?.statusCode != null &&
          e.response!.statusCode! >= 500) {
        // 🔥 مشكلة من السيرفر نفسه
        emit(GetAllCompanyError(
            message: "الخدمة غير متاحة الآن، يرجى المحاولة لاحقًا."));
      }
      else {
        // ✴️ أي حاجة غير كده (زي 400، 404، إلخ)
        emit(GetAllCompanyError(message: "حدث خطأ غير متوقع، حاول مرة أخرى."));
      }
    } catch (e) {
      // ✴️ fallback لو حصل استثناء غير معروف
      emit(GetAllCompanyError(message: "حدث خطأ غير متوقع، حاول لاحقًا."));
    }
  }

  Future<void> updateAllComapny() async {
    emit(GetUpdateAllCompanyLoading());
    List<Company> list = [];
    try {
      pageNumber++;

      final token = await SharedPreferencesHelper.getToken();
      if (token == null || token.isEmpty) {
        emit(GetAllCompanyError(message: 'Token is null or empty'));
        return;
      }

      final response = await DioHelper.getData(
        url: "${gUrl!}&limit=$pageSize&page=$pageNumber",
        token: token,
      );

      if (response?.statusCode == 200) {
        getAllCompanyModel = GetAllCompanyModel.fromJson(response?.data);
        list = getAllCompanyModel!.data!.data!;

        if (list.isNotEmpty) {
          List<Company>? updateProductList = List.from(companyList);
          updateProductList.addAll(list);
          companyList = [];
          companyList!.addAll(updateProductList);
        }
        emit(GetUpdateAllCompanySuccess(companyList: companyList));
        if (list.isEmpty) {
          emit(GetUpdateAllCompanyEmpty());
        }
        list = [];
      } else if (response?.statusCode == 404) {
        emit(GetAllCompanyError(message: 'No products found for this user.'));
      } else {
        emit(GetAllCompanyError(
            message: "الخدمة غير متاحة حاليًا، جرّب مرة تانية لاحقًا."));
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.unknown) {
        // ❌ دي غالبًا مشكلة إنترنت
        emit(GetAllCompanyError(
            message: "تأكد من اتصالك بالإنترنت وحاول مرة أخرى."));
      } else if (e.response?.statusCode != null &&
          e.response!.statusCode! >= 500) {
        // 🔥 مشكلة من السيرفر نفسه
        emit(GetAllCompanyError(
            message: "الخدمة غير متاحة الآن، يرجى المحاولة لاحقًا."));
      } else {
        // ✴️ أي حاجة غير كده (زي 400، 404، إلخ)
        emit(GetAllCompanyError(message: "حدث خطأ غير متوقع، حاول مرة أخرى."));
      }
    } catch (e) {
      // ✴️ fallback لو حصل استثناء غير معروف
      emit(GetAllCompanyError(message: "حدث خطأ غير متوقع، حاول لاحقًا."));
    }
  }
}
