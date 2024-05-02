part of 'team_bloc.dart';

abstract class TeamState extends Equatable {
  const TeamState();

  @override
  List<Object> get props => [];
}

class TeamInitial extends TeamState {}

class TeamLoading extends TeamState {
  const TeamLoading();
}

class TeamDone extends TeamState {
  final TeamEntity team;
  const TeamDone({
    required this.team,
  });

  @override
  List<Object> get props => [team];
}

class TeamError extends TeamState {
  final Failure failure;
  const TeamError({
    required this.failure,
  });

  @override
  List<Object> get props => [failure];
}
