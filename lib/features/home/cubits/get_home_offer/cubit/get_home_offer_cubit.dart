import 'package:bloc/bloc.dart';
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
  static const String _getHomeOfferEndpoint = 'products/offers/list';

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
        url: _getHomeOfferEndpoint,
        token: token,
      );

      print(response?.data);

      if (response?.statusCode == 200) {
        offerModel = HomeOfferModel.fromJson(response?.data);
        if (offerModel?.data!.data!.isEmpty ?? true) {
          emit(HomeOfferError(message: 'No SubCategories found.'));
        } else {
          emit(HomeOfferSuccess(offerModel: offerModel!));
        }
      } else if (response?.statusCode == 404) {
        emit(HomeOfferError(
            message: 'No SubCategories found for this user.'));
      } else {
        emit(HomeOfferError(
            message: 'Unexpected error: ${response?.statusCode}'));
      }
    } catch (e) {
      emit(HomeOfferError(
          message: 'Failed to fetch SubCategories: ${e.toString()}'));
    }
  }
}
