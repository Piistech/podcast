part of 'play_commentary_bloc.dart';

sealed class PlayCommentaryEvent extends Equatable {
  const PlayCommentaryEvent();

  @override
  List<Object> get props => [];
}

final class PlayCommentary extends PlayCommentaryEvent {
  final String token;
  final String channelId;
  final String fixtureGuid;
  final String fixtureIcon;
  final String matchName;

  const PlayCommentary({
    required this.token,
    required this.channelId,
    required this.fixtureGuid,
    required this.fixtureIcon,
    required this.matchName,
  });

  @override
  List<Object> get props => [
        channelId,
        token,
        fixtureGuid,
        matchName,
      ];
}
