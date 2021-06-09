part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class Loading extends HomeState {}

class DataLoaded extends HomeState {
  final List<ImageData> obj;
  DataLoaded({this.obj});

  DataLoaded copyWith({var obj}) {
    return DataLoaded(obj: obj ?? this.obj);
  }

  @override
  List<Object> get props => [obj];
}

class ErrorReceived extends HomeState {
  final err;
  ErrorReceived({this.err});
  ErrorReceived copyWith({var err}) {
    return ErrorReceived(err: err ?? this.err);
  }

  @override
  List<Object> get props => [err];
}
