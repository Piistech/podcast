import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../commentary.dart';

part 'live_commentary_status_event.dart';
part 'live_commentary_status_state.dart';

class LiveCommentaryStatusBloc extends Bloc<LiveCommentaryStatusEvent, LiveCommentaryStatusState> {
  final LiveCommentaryStatusUseCase useCase;
  LiveCommentaryStatusBloc({
    required this.useCase,
  }) : super(LiveCommentaryStatusOffline()) {
    on<CheckLiveCommentaryStatus>((event, emit) async {
      await for (final status in useCase.call) {
        if (status) {
          emit(LiveCommentaryStatusOnAir());
        } else {
          emit(LiveCommentaryStatusOffline());
        }
      }
    });
  }
}
