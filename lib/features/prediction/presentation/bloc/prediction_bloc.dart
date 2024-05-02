import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'prediction_event.dart';
part 'prediction_state.dart';

class PredictionBloc extends Bloc<PredictionEvent, PredictionState> {
  PredictionBloc() : super(PredictionInitial()) {
    on<PredictionEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
