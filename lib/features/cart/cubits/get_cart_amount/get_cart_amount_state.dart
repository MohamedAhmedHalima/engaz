part of 'get_cart_amount_cubit.dart';

@immutable
sealed class GetAmountState {}

final class GetAmountInitial extends GetAmountState {}

final class GetAmountLoading extends GetAmountState {}

final class GetAmountSuccess extends GetAmountState {
String amount;
String count;
GetAmountSuccess({required this.amount,required this.count,});
}

final class GetAmountError extends GetAmountState {
final String? message;
GetAmountError({required this.message});
}
