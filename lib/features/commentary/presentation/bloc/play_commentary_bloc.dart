import '../../../../core/shared/shared.dart';
import '../../commentary.dart';

part 'play_commentary_event.dart';
part 'play_commentary_state.dart';

class PlayCommentaryBloc extends Bloc<PlayCommentaryEvent, PlayCommentaryState> {
  final PlayCommentaryUseCase useCase;

  PlayCommentaryBloc({
    required this.useCase,
  }) : super(const PlayCommentaryInitial()) {
    on<PlayCommentary>((event, emit) async {
      emit(const PlayCommentaryLoading());

      final result = await useCase(
        token: event.token,
        channelId: event.channelId,
        fixtureGuid: event.fixtureGuid,
        matchName: event.matchName,
        fixtureIcon: event.fixtureIcon,
      );

      await Future.delayed(const Duration(milliseconds: 800));

      result.fold(
        (failure) => emit(PlayCommentaryError(failure: failure)),
        (_) => emit(const PlayCommentaryDone()),
      );
    });
  }
}
