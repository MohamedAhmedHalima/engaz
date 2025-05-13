part of 'get_user_data_cubit.dart';

@immutable
sealed class GetUserDataState {}

final class GetUserDataInitial extends GetUserDataState {}

final class GetUserDataLoading extends GetUserDataState {}

final class GetUserDataSuccess extends GetUserDataState {
UserData userModl;
GetUserDataSuccess({required this.userModl});
}

final class GetUserDataError extends GetUserDataState {
final String? message;
GetUserDataError({required this.message});
}
