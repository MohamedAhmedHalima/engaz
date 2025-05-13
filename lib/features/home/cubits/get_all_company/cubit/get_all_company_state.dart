part of 'get_all_company_cubit.dart';

@immutable
sealed class GetAllCompanyState {}

final class GetAllCompanyInitial extends GetAllCompanyState {}

final class GetAllCompanyLoading extends GetAllCompanyState {}

final class GetAllCompanySuccess extends GetAllCompanyState {
  GetAllCompanyModel getAllCompanyModel;
  GetAllCompanySuccess({required this.getAllCompanyModel});
}

final class GetAllCompanyError extends GetAllCompanyState {
  final String? message;
  GetAllCompanyError({required this.message});
}
