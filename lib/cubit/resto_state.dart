part of 'resto_cubit.dart';

abstract class RestoState extends Equatable {
  const RestoState();

  @override
  List<Object> get props => [];
}

class RestoInitial extends RestoState {}

class RestoLoading extends RestoState {}

class RestoSuccess extends RestoState {
  final List<RestoModel> resto;

  RestoSuccess(this.resto);

  @override
  List<Object> get props => [resto];
}

class RestoFailed extends RestoState {
  final String error;

  RestoFailed(this.error);

  @override
  List<Object> get props => [error];
}
