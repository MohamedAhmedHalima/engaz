part of 'add_to_cart_cubit.dart';

@immutable
sealed class AddProductToCartListState {}

final class AddProductToCartListInitial
extends AddProductToCartListState {}

final class AddProductToCartListLoading
extends AddProductToCartListState {}

final class AddProductToCartListError extends AddProductToCartListState {
final String? message;

AddProductToCartListError({required this.message});
}

final class AddProductToCartListSuccess
extends AddProductToCartListState {}

final class RemoveProductToCartListLoading
extends AddProductToCartListState {}

final class RemoveProductToCartListError extends AddProductToCartListState {
final String? message;

RemoveProductToCartListError({required this.message});
}

final class RemoveProductToCartListSuccess
extends AddProductToCartListState {}
