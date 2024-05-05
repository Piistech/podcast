import '../../../../core/shared/shared.dart';
import '../../analysis.dart';

part 'find_analysis_by_id_event.dart';
part 'find_analysis_by_id_state.dart';

class FindAnalysisByIdBloc extends Bloc<FindAnalysisByIdEvent, FindAnalysisByIdState> {
  final FindAnalysisByIdUseCase useCase;
  FindAnalysisByIdBloc({
    required this.useCase,
  }) : super(FindAnalysisByIdInitial()) {
    on<FindAnalysisById>((event, emit) {
      emit(const FindAnalysisByIdLoading());
      final result = useCase(
        fixtureGuid: event.fixtureGuid,
      );
      result.fold(
        (failure) => emit(FindAnalysisByIdError(failure: failure)),
        (analysis) => emit(FindAnalysisByIdDone(analysis: analysis)),
      );
    });
  }
}
