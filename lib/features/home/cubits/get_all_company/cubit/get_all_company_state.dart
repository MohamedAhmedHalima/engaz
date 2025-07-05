part of 'get_all_company_cubit.dart';

@immutable
sealed class GetAllCompanyState {}

final class GetAllCompanyInitial extends GetAllCompanyState {}

final class GetAllCompanyLoading extends GetAllCompanyState {}

final class GetAllCompanySuccess extends GetAllCompanyState {
    List<Company>companyList ;
  GetAllCompanySuccess({required this.companyList});
}
final class GetUpdateAllCompanyLoading extends GetAllCompanyState {}
final class GetUpdateAllCompanyEmpty extends GetAllCompanyState {}

final class GetUpdateAllCompanySuccess extends GetAllCompanyState {
    List<Company>companyList ;
    GetUpdateAllCompanySuccess({required this.companyList});
}

final class GetAllCompanyError extends GetAllCompanyState {
  final String? message;
  GetAllCompanyError({required this.message});
}
