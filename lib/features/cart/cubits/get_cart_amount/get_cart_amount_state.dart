part of 'get_cart_amount_cubit.dart';

@immutable
sealed class GetAmountState {}

final class GetAmountInitial extends GetAmountState {}

final class GetAmountLoading extends GetAmountState {}

final class GetAmountSuccess extends GetAmountState {
String amount;
GetAmountSuccess({required this.amount});
}

final class GetAmountError extends GetAmountState {
final String? message;
GetAmountError({required this.message});
}
