part of 'sign_up_cubit.dart';

@immutable
final class SignUpState {}

final class SignUpInitial extends SignUpState {}

final class SignUpLoading extends SignUpState {}

final class SignUpSuccess extends SignUpState {
  final SignUpModel signUpModel;

  SignUpSuccess({required this.signUpModel});
}

final class SignUpError extends SignUpState {
  final String? message;
  SignUpError({required this.message});
}

final class GovernoratesState {}

final class GovernoratesInitial extends GovernoratesState {}

final class GovernoratesLoading extends GovernoratesState {}

final class GovernoratesSuccess extends GovernoratesState {
  final GovernoratesModel governoratesModel;

  GovernoratesSuccess({required this.governoratesModel});
}

final class GovernoratesError extends GovernoratesState {
  final String? message;
  GovernoratesError({required this.message});
}


final class GetCitiesState {}

final class CitiesInitial extends GetCitiesState {}

final class CitiesLoading extends GetCitiesState {}

final class CitiesSuccess extends  GetCitiesState {
  final GovernoratesModel citiesModel;

  CitiesSuccess({required this.citiesModel});
}

final class CitiesError extends GetCitiesState {
  final String? message;
  CitiesError({required this.message});
}


final class GetCountiesState {}

final class CountiesInitial extends GetCountiesState {}

final class CountiesLoading extends GetCountiesState {}

final class CountiesSuccess extends  GetCountiesState {
  final GovernoratesModel countiesModel;

  CountiesSuccess({required this.countiesModel});
}

final class CountiesError extends GetCountiesState {
  final String? message;
  CountiesError({required this.message});
}
final class BusinessTypesState {}

final class BusinessTypesInitial extends BusinessTypesState {}

final class BusinessTypesLoading extends BusinessTypesState {}

final class BusinessTypesSuccess extends  BusinessTypesState {
  final BusinessTypes businessTypesModel;

  BusinessTypesSuccess({required this.businessTypesModel});
}

final class BusinessTypesError extends BusinessTypesState {
  final String? message;
  BusinessTypesError({required this.message});
}
