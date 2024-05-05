import '../../../../core/shared/shared.dart';
import '../../commentary.dart';

part 'commentary_event.dart';
part 'commentary_state.dart';

class CommentaryBloc extends Bloc<CommentaryEvent, CommentaryState> {
  final FetchCommentaryUseCase useCase;

  CommentaryBloc({
    required this.useCase,
  }) : super(const CommentaryInitial()) {
    on<FetchCommentary>((event, emit) async {
      emit(const CommentaryLoading());
      final result = await useCase(
        fixtureGuid: event.fixtureGuid,
      );
      result.fold(
        (failure) => emit(CommentaryError(failure: failure)),
        (commentary) => emit(CommentaryDone(commentary: commentary)),
      );
    });
  }
}
