part of 'analysis_bloc.dart';

abstract class AnalysisEvent extends Equatable {
  const AnalysisEvent();

  @override
  List<Object> get props => [];
}

class FetchAnalysis extends AnalysisEvent {
  final String fixtureGuid;
  const FetchAnalysis({
    required this.fixtureGuid,
  });
}
