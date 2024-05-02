part of 'prediction_bloc.dart';

abstract class PredictionEvent extends Equatable {
  const PredictionEvent();

  @override
  List<Object> get props => [];
}
class FetchPrediction extends PredictionEvent {
  const FetchPrediction();
}
