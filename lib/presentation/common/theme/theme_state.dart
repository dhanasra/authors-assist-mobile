part of 'theme_bloc.dart';

enum ThemeVarient { light, dark }

abstract class ThemeState extends Equatable {
  const ThemeState();
  
  @override
  List<Object> get props => [];
}

class ThemeInitial extends ThemeState {}

class Loading extends ThemeState {}

class CurrentTheme extends ThemeState {
  final String varient;

  const CurrentTheme({
    required this.varient
  });
}
