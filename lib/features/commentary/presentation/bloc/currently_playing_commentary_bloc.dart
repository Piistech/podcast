import '../../../../core/shared/shared.dart';
import '../../commentary.dart';

part 'currently_playing_commentary_event.dart';
part 'currently_playing_commentary_state.dart';

class CurrentlyPlayingCommentaryBloc extends Bloc<CurrentlyPlayingCommentaryEvent, CurrentlyPlayingCommentaryState> {
  final CurrentlyPlayingCommentaryChannelUseCase useCase;
  CurrentlyPlayingCommentaryBloc({
    required this.useCase,
  }) : super(CurrentlyNotPlayingCommentary()) {
    on<CheckCurrentlyPlayingCommentary>((event, emit) async {
      await for (final result in useCase.call) {
        result.fold((left) {
          emit(const CurrentlyPlayingCommentaryTokenExpired());
        }, (channelId) {
          if (channelId == null) {
            emit(CurrentlyNotPlayingCommentary());
          } else {
            emit(CurrentlyPlayingCommentaryChannel(channelId: channelId));
          }
        });
      }
    });
  }
}
