part of 'live_commentary_status_bloc.dart';

sealed class LiveCommentaryStatusState extends Equatable {
  const LiveCommentaryStatusState();

  @override
  List<Object> get props => [];
}

final class LiveCommentaryStatusOnAir extends LiveCommentaryStatusState {}

final class LiveCommentaryStatusOffline extends LiveCommentaryStatusState {}
