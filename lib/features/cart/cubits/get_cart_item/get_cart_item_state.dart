part of 'get_cart_item_cubit.dart';

@immutable
sealed class GetAllCartListState {}

final class GetAllCartListInitial extends GetAllCartListState {}

final class GetAllCartListLoading extends GetAllCartListState {}

final class GetAllCartListSuccess extends GetAllCartListState {
CartModel cartListModel;
GetAllCartListSuccess({required this.cartListModel});
}

final class GetAllCartListError extends GetAllCartListState {
final String? message;
GetAllCartListError({required this.message});
}
