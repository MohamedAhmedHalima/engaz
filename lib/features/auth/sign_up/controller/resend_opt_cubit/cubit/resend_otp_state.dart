part of 'resend_otp_cubit.dart';

@immutable
sealed class ResendOtpState {}

final class ResendOtpInitial extends ResendOtpState {}

final class ResendOtpLoading extends ResendOtpState {}

final class ResendOtpError extends ResendOtpState {
  final String message;
  ResendOtpError({required this.message});
}

final class ResendOtpSuccess extends ResendOtpState {
  final ResendOtpModel resendOtpModel;

  ResendOtpSuccess({required this.resendOtpModel});
}
