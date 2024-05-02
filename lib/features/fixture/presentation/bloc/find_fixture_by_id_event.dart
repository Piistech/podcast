part of 'find_fixture_by_id_bloc.dart';

sealed class FindFixtureByIdEvent extends Equatable {
  const FindFixtureByIdEvent();

  @override
  List<Object> get props => [];
}

final class FindFixtureById extends FindFixtureByIdEvent {
  final String guid;

  const FindFixtureById({
    required this.guid,
  });

  @override
  List<Object> get props => [guid];
}