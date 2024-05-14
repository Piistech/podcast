import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'live_audio_event.dart';
part 'live_audio_state.dart';

class LiveAudioBloc extends Bloc<LiveAudioEvent, LiveAudioState> {
  LiveAudioBloc() : super(LiveAudioInitial()) {
    on<LiveAudioEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
