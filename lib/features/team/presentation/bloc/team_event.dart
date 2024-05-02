part of 'team_bloc.dart';

abstract class TeamEvent extends Equatable {
  const TeamEvent();

  @override
  List<Object> get props => [];
}

class FetchTeam extends TeamEvent {
  final String fixtureGuid;

  const FetchTeam({
    required this.fixtureGuid,
  });

  @override
  List<Object> get props => [fixtureGuid];
}
