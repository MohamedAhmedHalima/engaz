part of 'add_product_to_favorit_list_cubit.dart';

@immutable
sealed class AddProductToFavoritListState {}

final class AddProductToFavoritListInitial
    extends AddProductToFavoritListState {}

final class AddProductToFavoritListLoading
    extends AddProductToFavoritListState {}

final class AddProductToFavoritListError extends AddProductToFavoritListState {
  final String? message;

  AddProductToFavoritListError({required this.message});
}

final class AddProductToFavoritListSuccess
    extends AddProductToFavoritListState {}

final class RemoveProductToFavoritListLoading
    extends AddProductToFavoritListState {}

final class RemoveProductToFavoritListError extends AddProductToFavoritListState {
  final String? message;

  RemoveProductToFavoritListError({required this.message});
}

final class RemoveProductToFavoritListSuccess
    extends AddProductToFavoritListState {}
