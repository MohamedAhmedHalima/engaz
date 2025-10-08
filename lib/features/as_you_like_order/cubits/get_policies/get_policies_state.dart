part of 'get_policies_cubit.dart';

@immutable
sealed class GetAllPoliciesState {}

final class GetAllPoliciesInitial extends GetAllPoliciesState {}

final class GetAllPoliciesLoading extends GetAllPoliciesState {}

final class GetAllPoliciesSuccess extends GetAllPoliciesState {
PoliciesModel policiesModel;
GetAllPoliciesSuccess({required this.policiesModel});
}

final class GetAllPoliciesError extends GetAllPoliciesState {
final String? message;
GetAllPoliciesError({required this.message});
}
