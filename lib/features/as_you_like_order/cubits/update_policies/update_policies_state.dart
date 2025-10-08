part of 'update_policies_bloc.dart';

@immutable
sealed class UpdatePoliciesState {}

final class UpdatePoliciesInitial extends UpdatePoliciesState {}

final class UpdatePoliciesLoading extends UpdatePoliciesState {}

final class UpdatePoliciesSuccess extends UpdatePoliciesState {}

final class UpdatePoliciesError extends UpdatePoliciesState {
final String? message;
UpdatePoliciesError({required this.message});
}
