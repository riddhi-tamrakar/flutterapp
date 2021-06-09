part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class FetchImages extends HomeEvent {
  final count;

  const FetchImages({
    this.count,
  });

  @override
  List<Object> get props => [
        count,
      ];
}

class FetchMoreRecommentations extends HomeEvent {
  List<Object> get props => [];
}
