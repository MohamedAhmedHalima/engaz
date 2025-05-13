part of 'get_home_offer_cubit.dart';

@immutable
sealed class HomeOfferState {}

final class HomeOfferInitial extends HomeOfferState {}

final class HomeOfferLoading extends HomeOfferState {}

final class HomeOfferError extends HomeOfferState {
final String? message;
HomeOfferError({required this.message});
}

final class HomeOfferSuccess extends HomeOfferState {
HomeOfferModel offerModel;
HomeOfferSuccess({required this.offerModel});
}
