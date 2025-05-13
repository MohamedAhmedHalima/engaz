part of 'update_user_data_cubit.dart';

@immutable
final class UpdateUserDataState {}

final class UpdateUserDataInitial extends UpdateUserDataState {}

final class UpdateUserDataLoading extends UpdateUserDataState {}

final class UpdateUserDataSuccess extends UpdateUserDataState {
final SignUpModel signUpModel;

UpdateUserDataSuccess({required this.signUpModel});
}

final class UpdateUserDataError extends UpdateUserDataState {
final String? message;
UpdateUserDataError({required this.message});
}
