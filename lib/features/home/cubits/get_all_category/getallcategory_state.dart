part of 'getallcategory_cubit.dart';

@immutable
sealed class GetallcategoryState {}

final class GetallcategoryInitial extends GetallcategoryState {}
final class GetallcategoryLoading extends GetallcategoryState {}
final class GetallcategorySuccess extends GetallcategoryState {
  GetAllCategoryModel getAllCategoryModel;

  GetallcategorySuccess({required this.getAllCategoryModel});
}
final class GetallcategoryError extends GetallcategoryState {
  final String? message;
  GetallcategoryError({required this.message});
}
