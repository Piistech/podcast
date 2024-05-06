part of 'currently_playing_commentary_bloc.dart';

sealed class CurrentlyPlayingCommentaryState extends Equatable {
  const CurrentlyPlayingCommentaryState();

  @override
  List<Object> get props => [];
}

final class CurrentlyNotPlayingCommentary extends CurrentlyPlayingCommentaryState {}

final class CurrentlyPlayingCommentaryChannel extends CurrentlyPlayingCommentaryState {
  final String channelId;

  const CurrentlyPlayingCommentaryChannel({
    required this.channelId,
  });
}
