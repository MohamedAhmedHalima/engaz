part of 'code_cubit.dart';

@immutable
sealed class CodeState {}

final class CodeInitial extends CodeState {}

final class CodeLoading extends CodeState {}

final class CodeError extends CodeState {
  final String? message;

  CodeError({required this.message});
}

final class CodeSuccess extends CodeState {
  CodeModel codeModel;
  CodeSuccess({required this.codeModel});
}
