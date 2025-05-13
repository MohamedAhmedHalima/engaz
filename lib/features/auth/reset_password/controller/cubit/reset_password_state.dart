part of 'reset_password_cubit.dart';

@immutable
sealed class ResetPasswordState {}

final class ResetPasswordInitial extends ResetPasswordState {}

final class ResetPasswordLoading extends ResetPasswordState {}

final class ResetPasswordError extends ResetPasswordState {
  final String message;

  ResetPasswordError({required this.message});
}

final class ResetPasswordSuccess extends ResetPasswordState {
  ResetPasswordModel resetPasswordModel;
  ResetPasswordSuccess({required this.resetPasswordModel});
}
