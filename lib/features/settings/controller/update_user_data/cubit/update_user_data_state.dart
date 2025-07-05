part of 'update_user_data_cubit.dart';

@immutable
final class UpdateUserDataState {}

final class UpdateUserDataInitial extends UpdateUserDataState {}

final class UpdateUserDataLoading extends UpdateUserDataState {}

final class UpdateUserDataSuccess extends UpdateUserDataState {}

final class UpdateUserDataError extends UpdateUserDataState {
final String? message;
UpdateUserDataError({required this.message});
}
final class UpdateLocationLoading extends UpdateUserDataState {}

final class UpdateLocationSuccess extends UpdateUserDataState {}

final class UpdateLocationError extends UpdateUserDataState {
final String? message;
UpdateLocationError({required this.message});
}
