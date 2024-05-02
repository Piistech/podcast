part of 'commentary_bloc.dart';

abstract class CommentaryState extends Equatable {
  const CommentaryState();  

  @override
  List<Object> get props => [];
}

class CommentaryInitial extends CommentaryState {
  const CommentaryInitial();
}

class CommentaryLoading extends CommentaryState {
  const CommentaryLoading();
}

class CommentaryError extends CommentaryState {
  final Failure failure;

  const CommentaryError({
    required this.failure,
  });

  @override
  List<Object> get props => [failure];
}

class CommentaryDone extends CommentaryState {
  final CommentaryEntity commentary;

  const CommentaryDone({
    required this.commentary,
  });

  @override
  List<Object> get props => [commentary];
}
