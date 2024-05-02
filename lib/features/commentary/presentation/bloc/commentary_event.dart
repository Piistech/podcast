part of 'commentary_bloc.dart';

abstract class CommentaryEvent extends Equatable {
  const CommentaryEvent();

  @override
  List<Object> get props => [];
}
class FetchCommentary extends CommentaryEvent {
  final String fixtureGuid;
  const FetchCommentary({
    required this.fixtureGuid,
  });
}

