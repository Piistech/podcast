part of 'live_commentary_status_bloc.dart';

sealed class LiveCommentaryStatusEvent extends Equatable {
  const LiveCommentaryStatusEvent();

  @override
  List<Object> get props => [];
}

final class CheckLiveCommentaryStatus extends LiveCommentaryStatusEvent {}
