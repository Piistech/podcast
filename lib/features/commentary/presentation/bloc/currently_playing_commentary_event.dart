part of 'currently_playing_commentary_bloc.dart';

sealed class CurrentlyPlayingCommentaryEvent extends Equatable {
  const CurrentlyPlayingCommentaryEvent();

  @override
  List<Object> get props => [];
}

final class CheckCurrentlyPlayingCommentary extends CurrentlyPlayingCommentaryEvent {}