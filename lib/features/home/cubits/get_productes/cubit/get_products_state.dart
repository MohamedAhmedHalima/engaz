part of 'get_products_cubit.dart';

@immutable
abstract class GetProductsState {}

class GetProductsInitial extends GetProductsState {}

class GetProductsLoading extends GetProductsState {}

class GetProductsSuccess extends GetProductsState {
  final List<Products> products;
  GetProductsSuccess({required this.products});
}

class GetProductsUpdateLoading extends GetProductsState {}
class GetProductsUpdateEmpty extends GetProductsState {}

class GetProductsUpdateSuccess extends GetProductsState {
  final List<Products> products;
  GetProductsUpdateSuccess({required this.products});
}

class GetProductsError extends GetProductsState {
  final String? message;
  GetProductsError({this.message});
}
