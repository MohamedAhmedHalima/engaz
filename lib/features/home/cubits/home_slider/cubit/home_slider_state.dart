part of 'home_slider_cubit.dart';

@immutable
sealed class HomeSliderState {}

final class HomeSliderInitial extends HomeSliderState {}

final class HomeSliderLoading extends HomeSliderState {}

final class HomeSliderError extends HomeSliderState {
final String? message;
HomeSliderError({required this.message});
}

final class HomeSliderSuccess extends HomeSliderState {
SliderModel sliderModel;
HomeSliderSuccess({required this.sliderModel});
}
