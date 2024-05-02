part of 'prediction_bloc.dart';

abstract class PredictionState extends Equatable {
  const PredictionState();

  @override
  List<Object> get props => [];
}

class PredictionInitial extends PredictionState {
  const PredictionInitial();
}

class PredictionLoading extends PredictionState {
  const PredictionLoading();
}

class PredictionDone extends PredictionState {
  final PredictionEntity prediction;

  const PredictionDone({required this.prediction});
  @override
  List<Object> get props => [prediction];
}

class PredictionError extends PredictionState {
  final Failure failure;

  const PredictionError({
    required this.failure,
  });

  @override
  List<Object> get props => [failure];
}
