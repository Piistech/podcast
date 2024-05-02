import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../shared.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends HydratedBloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(const ThemeState()) {
    on<ToggleTheme>((event, emit) {
      final newTheme = state.copyWith(type: event.type);
      emit(newTheme);
    });
  }

  @override
  ThemeState? fromJson(Map<String, dynamic> json) {
    if (json.isEmpty) {
      return const ThemeState();
    }
    return ThemeState.parse(map: json);
  }

  @override
  Map<String, dynamic>? toJson(ThemeState state) {
    return state.toMap();
  }
}
