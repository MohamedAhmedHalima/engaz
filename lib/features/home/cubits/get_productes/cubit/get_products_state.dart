part of 'get_products_cubit.dart';

@immutable
sealed class GetProductsState {}

final class GetProductsInitial extends GetProductsState {}

final class GetProductsLoading extends GetProductsState {}

final class GetProductsSuccess extends GetProductsState {
  ProductModel productModel;
  GetProductsSuccess({required this.productModel});
}

final class GetProductsError extends GetProductsState {
  final String? message;
  GetProductsError({required this.message});
}
