part of 'get_all_favourite_list_cubit.dart';

@immutable
sealed class GetAllFavouriteListState {}

final class GetAllFavouriteListInitial extends GetAllFavouriteListState {}

final class GetAllFavouriteListLoading extends GetAllFavouriteListState {}

final class GetAllFavouriteListSuccess extends GetAllFavouriteListState {
FavouriteListModel favouriteListModel;
  GetAllFavouriteListSuccess({required this.favouriteListModel});
}

final class GetAllFavouriteListError extends GetAllFavouriteListState {
  final String? message;
  GetAllFavouriteListError({required this.message});
}
