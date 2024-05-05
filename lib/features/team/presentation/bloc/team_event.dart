part of 'team_bloc.dart';

abstract class TeamEvent extends Equatable {
  const TeamEvent();

  @override
  List<Object> get props => [];
}

class FetchTeam extends TeamEvent {
  final String teamGuid;

  const FetchTeam({
    required this.teamGuid,
  });

  @override
  List<Object> get props => [teamGuid];
}
