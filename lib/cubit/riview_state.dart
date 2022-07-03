part of 'riview_cubit.dart';

abstract class RiviewState extends Equatable {
  const RiviewState();

  @override
  List<Object> get props => [];
}

class RiviewInitial extends RiviewState {}

class RiviewLoading extends RiviewState {}

class RiviewSuccess extends RiviewState {
  final List<RiviewModel> riviews;

  RiviewSuccess(this.riviews);
  @override
  // TODO: implement props
  List<Object> get props => [riviews];
}

class RiviewFailed extends RiviewState {
  final String error;

  RiviewFailed(this.error);

  @override
  // TODO: implement props
  List<Object> get props => [error];
}
