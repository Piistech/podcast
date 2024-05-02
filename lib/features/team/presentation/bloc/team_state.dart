part of 'team_bloc.dart';

abstract class TeamState extends Equatable {
  const TeamState();  

  @override
  List<Object> get props => [];
}
class TeamInitial extends TeamState {}
