import '../../../../core/shared/shared.dart';
import '../../commentary.dart';

part 'stop_commentary_event.dart';
part 'stop_commentary_state.dart';

class StopCommentaryBloc extends Bloc<StopCommentaryEvent, StopCommentaryState> {
  final StopCommentaryUseCase useCase;

  StopCommentaryBloc({
    required this.useCase,
  }) : super(const StopCommentaryInitial()) {
    on<StopCommentary>((event, emit) async {
      emit(const StopCommentaryLoading());

      final result = await useCase();

      result.fold(
        (failure) => emit(StopCommentaryError(failure: failure)),
        (_) => emit(const StopCommentaryDone()),
      );
    });
  }
}
