part of 'find_analysis_by_id_bloc.dart';

sealed class FindAnalysisByIdEvent extends Equatable {
  const FindAnalysisByIdEvent();

  @override
  List<Object> get props => [];
}

final class FindAnalysisById extends FindAnalysisByIdEvent {
  final String fixtureGuid;

  const FindAnalysisById({
    required this.fixtureGuid,
  });

  @override
  List<Object> get props => [fixtureGuid];
}