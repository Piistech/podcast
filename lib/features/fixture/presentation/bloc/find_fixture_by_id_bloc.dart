import '../../../../core/shared/shared.dart';
import '../../fixture.dart';

part 'find_fixture_by_id_event.dart';
part 'find_fixture_by_id_state.dart';

class FindFixtureByIdBloc extends Bloc<FindFixtureByIdEvent, FindFixtureByIdState> {
  final FindFixtureByIdUseCase useCase;
  FindFixtureByIdBloc({
    required this.useCase,
  }) : super(FindFixtureByIdInitial()) {
    on<FindFixtureById>((event, emit) {
      emit(const FindFixtureByIdLoading());
      final result = useCase(guid: event.guid);
      result.fold(
        (failure) => emit(FindFixtureByIdError(failure: failure)),
        (fixture) => emit(FindFixtureByIdDone(fixture: fixture)),
      );
    });
  }
}
