import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:engaz/core/network/api.dart';
import 'package:engaz/core/network/shared_preferences.dart';
import 'package:engaz/features/home/models/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'get_products_state.dart';

class GetProductsCubit extends Cubit<GetProductsState> {
  GetProductsCubit() : super(GetProductsInitial());
  int pageNumber =1;
  int pageSize =10;
  ProductModel? productModel;
  List<Products>productList=[];
   static const String _getProductesEndpoint = 'products/category/';
  static GetProductsCubit get(context) => BlocProvider.of(context);
  String ? url;
  Future<void> getProduct({
    String ? getProductesEndpoint,
  }) async {
    emit(GetProductsLoading());
    pageNumber =1;
    getProductesEndpoint=  getProductesEndpoint!=null?getProductesEndpoint:_getProductesEndpoint;
    try {
      final token = await SharedPreferencesHelper.getToken();
      if (token == null || token.isEmpty) {
        emit(GetProductsError(message: 'Token is null or empty'));
        return;
      }
      url=getProductesEndpoint;
      final response = await DioHelper.getData(
        url: "${url!}&limit=$pageSize&page=$pageNumber",
        token: token,
      );

      if (response?.statusCode == 200) {
        productModel = ProductModel.fromJson(response?.data);
        productList=productModel!.data!.products!;
        if (productModel!.data!.products!.isEmpty) {
          emit(GetProductsError(message: 'No products found.'));
        } else {
          emit(GetProductsSuccess(products: productList ));
        }
      }
      else if (response?.statusCode == 404) {
        emit(GetProductsError(message: 'No products found for this user.'));
      } else {
            emit(GetProductsError(message: "الخدمة غير متاحة حاليًا، جرّب مرة تانية لاحقًا."));
        }
        } on DioException catch (e) {
        if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout ||
        e.type == DioExceptionType.unknown) {
        // ❌ دي غالبًا مشكلة إنترنت
        emit(GetProductsError(message: "تأكد من اتصالك بالإنترنت وحاول مرة أخرى."));
        } else if (e.response?.statusCode != null && e.response!.statusCode! >= 500) {
        // 🔥 مشكلة من السيرفر نفسه
        emit(GetProductsError(message: "الخدمة غير متاحة الآن، يرجى المحاولة لاحقًا."));
        } else {
        // ✴️ أي حاجة غير كده (زي 400، 404، إلخ)
        emit(GetProductsError(message: "حدث خطأ غير متوقع، حاول مرة أخرى."));
        }
        } catch (e) {
          // ✴️ fallback لو حصل استثناء غير معروف
          emit(GetProductsError(message: "حدث خطأ غير متوقع، حاول لاحقًا."));
        }
  }
  Future<void> getProductUpdate( ) async {
    emit(GetProductsUpdateLoading());
    List<Products> list =[];
    try {
      pageNumber++;

      final token = await SharedPreferencesHelper.getToken();
      if (token == null || token.isEmpty) {
        emit(GetProductsError(message: 'Token is null or empty'));
        return;
      }

      final response = await DioHelper.getData(
        url: "${url!}&limit=$pageSize&page=$pageNumber",
        token: token,
      );

      if (response?.statusCode == 200) {
        productModel = ProductModel.fromJson(response?.data);
        list =productModel!.data!.products!;


          if(list.isNotEmpty){
            List<Products>? updateProductList =
            List.from(productList);
            updateProductList.addAll(list);
            productList=[];
            productList!.addAll(updateProductList);
          }
          emit(GetProductsUpdateSuccess(products: productList ));
          if(list.isEmpty) {
            emit(GetProductsUpdateEmpty());
          }
          list =[];


      } else if (response?.statusCode == 404) {
        emit(GetProductsError(message: 'No products found for this user.'));
      } else {
            emit(GetProductsError(message: "الخدمة غير متاحة حاليًا، جرّب مرة تانية لاحقًا."));
        }
        } on DioException catch (e) {
        if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout ||
        e.type == DioExceptionType.unknown) {
        // ❌ دي غالبًا مشكلة إنترنت
        emit(GetProductsError(message: "تأكد من اتصالك بالإنترنت وحاول مرة أخرى."));
        } else if (e.response?.statusCode != null && e.response!.statusCode! >= 500) {
        // 🔥 مشكلة من السيرفر نفسه
        emit(GetProductsError(message: "الخدمة غير متاحة الآن، يرجى المحاولة لاحقًا."));
        } else {
        // ✴️ أي حاجة غير كده (زي 400، 404، إلخ)
        emit(GetProductsError(message: "حدث خطأ غير متوقع، حاول مرة أخرى."));
        }
        } catch (e) {
          // ✴️ fallback لو حصل استثناء غير معروف
          emit(GetProductsError(message: "حدث خطأ غير متوقع، حاول لاحقًا."));
        }
  }

}
