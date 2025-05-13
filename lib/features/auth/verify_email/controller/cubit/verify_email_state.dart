part of 'verify_email_cubit.dart';

@immutable
sealed class VerifyEmailState {}

final class VerifyEmailInitial extends VerifyEmailState {}

final class VerifyEmailLoading extends VerifyEmailState {}

final class VerifyEmailError extends VerifyEmailState {
  final String? message;
  VerifyEmailError({required this.message});
}

final class VerifyEmailSuccess extends VerifyEmailState {
  VerifyEmailModel verifyEmailModel;

  VerifyEmailSuccess({required this.verifyEmailModel});
}
