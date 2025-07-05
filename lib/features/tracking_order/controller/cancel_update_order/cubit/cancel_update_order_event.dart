part of 'cancel_update_order_bloc.dart';


@immutable
final class CancelUpdateOrderState {}

final class CancelUpdateOrderInitial extends CancelUpdateOrderState {}

final class UpdateOrderLoading extends CancelUpdateOrderState {}

final class UpdateOrderSuccess extends CancelUpdateOrderState {}

final class UpdateOrderError extends CancelUpdateOrderState {
final String? message;
UpdateOrderError({required this.message});
}


final class CancelOrderLoading extends CancelUpdateOrderState {}

final class CancelOrderSuccess extends CancelUpdateOrderState {}

final class CancelOrderError extends CancelUpdateOrderState {
final String? message;
CancelOrderError({required this.message});
}
