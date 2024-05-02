part of 'analysis_bloc.dart';

abstract class AnalysisState extends Equatable {
  const AnalysisState();  

  @override
  List<Object> get props => [];
}
class AnalysisInitial extends AnalysisState {}
