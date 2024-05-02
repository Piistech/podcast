part of 'fixture_bloc.dart';

abstract class FixtureState extends Equatable {
  const FixtureState();  

  @override
  List<Object> get props => [];
}
class FixtureInitial extends FixtureState {}
