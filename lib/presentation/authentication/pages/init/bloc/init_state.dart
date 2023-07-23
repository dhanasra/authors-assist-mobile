part of 'init_bloc.dart';

abstract class InitState extends Equatable {
  const InitState();
  
  @override
  List<Object> get props => [];
}

class InitInitial extends InitState {}

class Loading extends InitState {}

class Initialized extends InitState {}