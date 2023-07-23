import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mobile/db/local_db.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeInitial()) {
    on<ToggleTheme>(_onToggleTheme);
  }

  void _onToggleTheme(ToggleTheme event, Emitter emit)async{
    emit(Loading());
    LocalDB.saveTheme(event.varient);
    final newThemevarient = event.varient == ThemeVarient.light.name ? ThemeVarient.dark.name : ThemeVarient.light.name;
    emit(CurrentTheme(varient: newThemevarient));
  }
}
