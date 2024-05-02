import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/shared/shared.dart';
import '../../fixture.dart';

part 'fixtures_event.dart';
part 'fixtures_state.dart';

class FixturesBloc extends Bloc<FixturesEvent, FixturesState> {
  final FixturesUseCase useCase;

  FixturesBloc({
    required this.useCase,
  }) : super(const FixturesInitial()) {
    on<FetchFixtures>((event, emit) async {
      emit(const FixturesLoading());
      final result = await useCase();
      result.fold(
        (failure) => emit(FixturesError(failure: failure)),
        (fixtures) => emit(FixturesDone(fixtures: fixtures)),
      );
    });
  }
}
