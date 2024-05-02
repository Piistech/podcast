part of 'find_commentary_by_id_bloc.dart';

sealed class FindCommentaryByIdEvent extends Equatable {
  const FindCommentaryByIdEvent();

  @override
  List<Object> get props => [];
}

final class FindCommentaryById extends FindCommentaryByIdEvent {
  final String fixtureGuid;

  const FindCommentaryById({
    required this.fixtureGuid,
  });

  @override
  List<Object> get props => [fixtureGuid];
}