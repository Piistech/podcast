part of 'prediction_bloc.dart';

abstract class PredictionState extends Equatable {
  const PredictionState();  

  @override
  List<Object> get props => [];
}
class PredictionInitial extends PredictionState {}
