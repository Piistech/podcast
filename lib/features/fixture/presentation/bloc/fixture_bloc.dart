

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'fixture_event.dart';
part 'fixture_state.dart';

class FixtureBloc extends Bloc<FixtureEvent, FixtureState> {
  FixtureBloc() : super(FixtureInitial()) {
    on<FixtureEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
