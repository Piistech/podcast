part of 'play_commentary_bloc.dart';

sealed class PlayCommentaryEvent extends Equatable {
  const PlayCommentaryEvent();

  @override
  List<Object> get props => [];
}

final class PlayCommentary extends PlayCommentaryEvent {
  final String token;
  final String channelId;

  const PlayCommentary({
    required this.token,
    required this.channelId,
  });

  @override
  List<Object> get props => [channelId, token];
}
