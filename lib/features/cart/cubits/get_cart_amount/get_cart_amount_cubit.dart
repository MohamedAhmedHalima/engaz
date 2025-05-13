import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/network/api.dart';
import '../../../../../core/network/shared_preferences.dart';

part 'get_cart_amount_state.dart';

class GetAmountCubit extends Cubit<GetAmountState> {
  GetAmountCubit() : super(GetAmountInitial());

  static GetAmountCubit get(context) => BlocProvider.of(context);
  Future<void> getCartAmount( ) async {
    emit(GetAmountLoading());
    try {
      final token = await SharedPreferencesHelper.getToken();
      if (token == null || token.isEmpty) {
        emit(GetAmountError(message: 'Token is null or empty'));
        return;
      }

      final response = await DioHelper.getData(
        url: "cart/amount",
        token: token,
      );
      if (response?.statusCode == 200) {
        emit(  GetAmountSuccess(amount: response!.data["data"].toString()));
        print(GetAmountSuccess);
      }
      else if (response?.statusCode == 404) {
        emit(
            GetAmountError(message: 'No categories found for this user.'));
      } else {
        emit(GetAmountError(
            message: 'Unexpected error: ${response?.statusCode}'));
      }
    } catch (e) {
      emit(GetAmountError(
          message: 'Failed to fetch categories: ${e.toString()}'));
    }
  }
}
