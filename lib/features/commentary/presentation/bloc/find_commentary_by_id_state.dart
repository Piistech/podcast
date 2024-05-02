part of 'find_commentary_by_id_bloc.dart';

sealed class FindCommentaryByIdState extends Equatable {
  const FindCommentaryByIdState();

  @override
  List<Object> get props => [];
}

final class FindCommentaryByIdInitial extends FindCommentaryByIdState {}

final class FindCommentaryByIdLoading extends FindCommentaryByIdState {
  const FindCommentaryByIdLoading();
}

final class FindCommentaryByIdError extends FindCommentaryByIdState {
  final Failure failure;

  const FindCommentaryByIdError({
    required this.failure,
  });

  @override
  List<Object> get props => [failure];
}

final class FindCommentaryByIdDone extends FindCommentaryByIdState {
  final CommentaryEntity fixture;

  const FindCommentaryByIdDone({
    required this.fixture,
  });

  @override
  List<Object> get props => [fixture];
}
