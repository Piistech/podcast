part of 'play_commentary_bloc.dart';

sealed class PlayCommentaryState extends Equatable {
  const PlayCommentaryState();

  @override
  List<Object> get props => [];
}

final class PlayCommentaryInitial extends PlayCommentaryState {
  const PlayCommentaryInitial();
}

final class PlayCommentaryLoading extends PlayCommentaryState {
  const PlayCommentaryLoading();
}

final class PlayCommentaryError extends PlayCommentaryState {
  final Failure failure;

  const PlayCommentaryError({required this.failure});
}

final class PlayCommentaryDone extends PlayCommentaryState {
  const PlayCommentaryDone();
}
