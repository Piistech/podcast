part of 'prediction_bloc.dart';

abstract class PredictionEvent extends Equatable {
  const PredictionEvent();

  @override
  List<Object> get props => [];
}
class FetchPrediction extends PredictionEvent {
  final String fixtureGuid;

  const FetchPrediction({
    required this.fixtureGuid,
  });
    @override
  List<Object> get props => [fixtureGuid];
}
