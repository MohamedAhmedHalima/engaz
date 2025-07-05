part of 'get_bundles_cubit.dart';


@immutable
sealed class GetBundlesState {}

final class GetBundlesInitial extends GetBundlesState {}
final class GetBundlesLoading extends GetBundlesState {}
final class GetBundlesSuccess extends GetBundlesState {
BundlesModel getBundlesModel;
GetBundlesSuccess({required this.getBundlesModel});
}
final class GetBundlesError extends GetBundlesState {
final String? message;
GetBundlesError({required this.message});
}
