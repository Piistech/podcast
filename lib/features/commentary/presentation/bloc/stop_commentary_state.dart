part of 'stop_commentary_bloc.dart';

sealed class StopCommentaryState extends Equatable {
  const StopCommentaryState();
  
  @override
  List<Object> get props => [];
}

final class StopCommentaryInitial extends StopCommentaryState {
  const StopCommentaryInitial();
}

final class StopCommentaryLoading extends StopCommentaryState {
  const StopCommentaryLoading();
}

final class StopCommentaryError extends StopCommentaryState {
  final Failure failure;

  const StopCommentaryError({required this.failure});
}

final class StopCommentaryDone extends StopCommentaryState {
  const StopCommentaryDone();
}
