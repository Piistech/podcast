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
  final AnalysisEntity fixture;

  const FindAnalysisByIdDone({
    required this.fixture,
  });

  @override
  List<Object> get props => [fixture];
}
