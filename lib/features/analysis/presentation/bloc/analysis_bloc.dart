import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/shared/shared.dart';
import '../../analysis.dart';

part 'analysis_event.dart';
part 'analysis_state.dart';

class AnalysisBloc extends Bloc<AnalysisEvent, AnalysisState> {
  final FetchAnalysisUseCase useCase;

  AnalysisBloc({
    required this.useCase,
  }) : super(const AnalysisInitial()) {
    on<FetchAnalysis>((event, emit) async {
      emit(const AnalysisLoading());
      final result = await useCase(
        fixtureGuid: event.fixtureGuid,
      );
      result.fold(
        (failure) => emit(AnalysisError(failure: failure)),
        (commentary) => emit(AnalysisDone(commentary: commentary)),
      );
    });
  }
}
