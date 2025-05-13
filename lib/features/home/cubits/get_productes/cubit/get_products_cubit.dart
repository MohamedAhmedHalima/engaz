import 'package:bloc/bloc.dart';
import 'package:engaz/core/network/api.dart';
import 'package:engaz/core/network/shared_preferences.dart';
import 'package:engaz/features/home/models/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'get_products_state.dart';

class GetProductsCubit extends Cubit<GetProductsState> {
  GetProductsCubit() : super(GetProductsInitial());
  ProductModel? productModel;
   static const String _getProductesEndpoint = 'products/category/';
  static GetProductsCubit get(context) => BlocProvider.of(context);

  Future<void> getProduct({
    // String? subCategory,
    // String? sortBy,
    // String? company,
    // String? category,
    String ? getProductesEndpoint,
      int ?id

  }) async {
    emit(GetProductsLoading());
    getProductesEndpoint=  getProductesEndpoint!=null?getProductesEndpoint:_getProductesEndpoint;
    try {
      final token = await SharedPreferencesHelper.getToken();
      if (token == null || token.isEmpty) {
        emit(GetProductsError(message: 'Token is null or empty'));
        return;
      }

      // طباعة قيمة sortBy للتأكد
      print("______________________________________");
      // print('Sort By in Cubit: $sortBy');
      // print('subCategory in Cubit: $subCategory');
      // print('category in Cubit: $category');
      // print('company in Cubit: $company');
      print("______________________________________");
      final response = await DioHelper.getData(
        // data: {
        //   'category': category,
        //   'company': company,
        //   'sortBy': sortBy,
        //   'subCategory': subCategory,
        // },
        url: getProductesEndpoint+(id!=null?"$id":""),
        token: token,
      );

      if (response?.statusCode == 200) {
        productModel = ProductModel.fromJson(response?.data);
        if (productModel!.data!.products!.isEmpty) {
          emit(GetProductsError(message: 'No products found.'));
        } else {
          emit(GetProductsSuccess(productModel: productModel!));
        }
      } else if (response?.statusCode == 404) {
        emit(GetProductsError(message: 'No products found for this user.'));
      } else {
        emit(GetProductsError(
            message: 'Unexpected error: ${response?.statusCode}'));
      }
    } catch (e, stackTrace) {
      print('Error: $e');
      print('Stack Trace: $stackTrace');
      emit(GetProductsError(
          message: 'Failed to fetch products: ${e.toString()}'));
    }
  }
}
