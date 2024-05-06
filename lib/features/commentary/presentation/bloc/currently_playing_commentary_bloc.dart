import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../commentary.dart';

part 'currently_playing_commentary_event.dart';
part 'currently_playing_commentary_state.dart';

class CurrentlyPlayingCommentaryBloc extends Bloc<CurrentlyPlayingCommentaryEvent, CurrentlyPlayingCommentaryState> {
  final CurrentlyPlayingCommentaryChannelUseCase useCase;
  CurrentlyPlayingCommentaryBloc({
    required this.useCase,
  }) : super(CurrentlyNotPlayingCommentary()) {
    on<CheckCurrentlyPlayingCommentary>((event, emit) async {
      await for (final String? channelId in useCase.call) {
        if (channelId == null) {
          emit(CurrentlyNotPlayingCommentary());
        } else {
          emit(CurrentlyPlayingCommentaryChannel(channelId: channelId));
        }
      }
    });
  }
}
