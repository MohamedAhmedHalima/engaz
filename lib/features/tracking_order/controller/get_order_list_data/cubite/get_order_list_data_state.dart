part of 'get_order_list_data_bloc.dart';


@immutable
sealed class GetOrderListDataState {}

final class GetOrderListDataInitial extends GetOrderListDataState {}

final class GetOrderListDataLoading extends GetOrderListDataState {}

final class GetOrderListDataSuccess extends GetOrderListDataState {
ListOrdersResponse listOrdersResponse;
GetOrderListDataSuccess({required this.listOrdersResponse});
}

final class GetOrderListDataError extends GetOrderListDataState {
final String? message;
GetOrderListDataError({required this.message});
}
