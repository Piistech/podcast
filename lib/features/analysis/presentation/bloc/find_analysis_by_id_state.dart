part of 'find_analysis_by_id_bloc.dart';

sealed class FindAnalysisByIdState extends Equatable {
  const FindAnalysisByIdState();

  @override
  List<Object> get props => [];
}

final class FindAnalysisByIdInitial extends FindAnalysisByIdState {}

final class FindAnalysisByIdLoading extends FindAnalysisByIdState {
  const FindAnalysisByIdLoading();
}

final class FindAnalysisByIdError extends FindAnalysisByIdState {
  final Failure failure;

  const FindAnalysisByIdError({
    required this.failure,
  });

  @override
  List<Object> get props => [failure];
}

final class FindAnalysisByIdDone extends FindAnalysisByIdState {
  final AnalysisEntity analysis;

  const FindAnalysisByIdDone({
    required this.analysis,
  });

  @override
  List<Object> get props => [analysis];
}
