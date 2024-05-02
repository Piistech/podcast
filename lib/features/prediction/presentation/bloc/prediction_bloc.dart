import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/shared/shared.dart';
import '../../prediction.dart';

part 'prediction_event.dart';
part 'prediction_state.dart';

class PredictionBloc extends Bloc<PredictionEvent, PredictionState> {
  final PredictionUseCase useCase;
  PredictionBloc({required this.useCase}) : super(const PredictionInitial()) {
    on<FetchPrediction>((event, emit) async {
      emit(const PredictionLoading());
      final result = await useCase(fixtureGuid: event.fixtureGuid);
      result.fold(
        (failure) => emit(PredictionError(failure: failure)),
        (prediction) => emit(PredictionDone(prediction: prediction)),
      );
    });
  }
}
