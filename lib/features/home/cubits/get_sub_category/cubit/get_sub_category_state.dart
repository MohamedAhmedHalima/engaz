part of 'get_sub_category_cubit.dart';

@immutable
sealed class GetSubCategoryState {}

final class GetSubCategoryInitial extends GetSubCategoryState {}

final class GetSubCategoryLoading extends GetSubCategoryState {}

final class GetSubCategoryError extends GetSubCategoryState {
  final String? message;
  GetSubCategoryError({required this.message});
}

final class GetSubCategorySuccess extends GetSubCategoryState {
  SubCategoriesModel subCategoriesModel;
  GetSubCategorySuccess({required this.subCategoriesModel});
}
