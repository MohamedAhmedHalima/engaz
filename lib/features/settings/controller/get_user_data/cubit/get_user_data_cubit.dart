import 'package:bloc/bloc.dart';
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

    try {
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
        userModel = UserData.fromJson(response?.data);

        emit(GetUserDataSuccess(userModl: userModel!,));

      } else if (response?.statusCode == 404) {
        emit(GetUserDataError(message: 'No products found for this user.'));
      } else {
        emit(GetUserDataError(
            message: 'Unexpected error: ${response?.statusCode}'));
      }
    } catch (e, stackTrace) {
      print('Error: $e');
      print('Stack Trace: $stackTrace');
      emit(GetUserDataError(
          message: 'Failed to fetch products: ${e.toString()}'));
    }
  }
}
