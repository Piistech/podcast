import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'analysis_event.dart';
part 'analysis_state.dart';

class AnalysisBloc extends Bloc<AnalysisEvent, AnalysisState> {
  AnalysisBloc() : super(AnalysisInitial()) {
    on<AnalysisEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
