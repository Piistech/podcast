part of 'analysis_bloc.dart';

abstract class AnalysisState extends Equatable {
  const AnalysisState();

  @override
  List<Object> get props => [];
}

class AnalysisInitial extends AnalysisState {
  const AnalysisInitial();
}

class AnalysisLoading extends AnalysisState {
  const AnalysisLoading();
}

class AnalysisError extends AnalysisState {
  final Failure failure;

  const AnalysisError({
    required this.failure,
  });

  @override
  List<Object> get props => [failure];
}

class AnalysisDone extends AnalysisState {
  final AnalysisEntity commentary;

  const AnalysisDone({
    required this.commentary,
  });

  @override
  List<Object> get props => [commentary];
}
