part of 'forget_password_cubit.dart';

@immutable
sealed class ForgetPasswordState {}

final class ForgetPasswordInitial extends ForgetPasswordState {}

final class ForgetPasswordLoading extends ForgetPasswordState {}

final class ForgetPasswordSuccess extends ForgetPasswordState {
  final SendOtpModel sendOtpModel;
  ForgetPasswordSuccess({required this.sendOtpModel});
}

final class ForgetPasswordError extends ForgetPasswordState {
  final String message;
  ForgetPasswordError({required this.message});
}
