import 'package:bloc/bloc.dart';
import 'package:engaz/core/network/api.dart';
import 'package:engaz/core/network/shared_preferences.dart';
import 'package:engaz/features/home/models/get_all_company_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'get_all_company_state.dart';

class GetAllCompanyCubit extends Cubit<GetAllCompanyState> {
  GetAllCompanyCubit() : super(GetAllCompanyInitial());
  static const String _getAllCompanyEndpoint = 'companies';
  GetAllCompanyModel? getAllCompanyModel;
  static GetAllCompanyCubit get(context) => BlocProvider.of(context);

  Future<void> getAllComapny({String? subCategory, int? category}) async {
    emit(GetAllCompanyLoading());

    try {
      final token = await SharedPreferencesHelper.getToken();
      if (token == null || token.isEmpty) {
        emit(GetAllCompanyError(message: 'Token is null or empty'));
        return;
      }

      final response = await DioHelper.getData(
        // data: {
        //   'category': category,
        //   'subCategory': subCategory,
        // },
        url: "companies?category_id=$category",
        token: token,
      );

      print(response?.data);

      if (response?.statusCode == 200) {
        getAllCompanyModel = GetAllCompanyModel.fromJson(response?.data);
        if (getAllCompanyModel!.data!.isEmpty ?? true) {
          emit(GetAllCompanyError(message: 'No productes found.'));
        } else {
          emit(GetAllCompanySuccess(getAllCompanyModel: getAllCompanyModel!));
        }
      } else if (response?.statusCode == 404) {
        emit(GetAllCompanyError(message: 'No products found for this user.'));
      } else {
        emit(GetAllCompanyError(
            message: 'Unexpected error: ${response?.statusCode}'));
      }
    } catch (e) {
      emit(GetAllCompanyError(
          message: 'Failed to fetch products: ${e.toString()}'));
    }
  }
}
