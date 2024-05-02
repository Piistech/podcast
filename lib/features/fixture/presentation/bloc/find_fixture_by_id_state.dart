part of 'find_fixture_by_id_bloc.dart';

sealed class FindFixtureByIdState extends Equatable {
  const FindFixtureByIdState();
  
  @override
  List<Object> get props => [];
}

final class FindFixtureByIdInitial extends FindFixtureByIdState {}
final class FindFixtureByIdLoading extends FindFixtureByIdState {
  const FindFixtureByIdLoading();
}
final class FindFixtureByIdError extends FindFixtureByIdState {
  final Failure failure;

  const FindFixtureByIdError({
    required this.failure,
  });

  @override
  List<Object> get props => [failure];
}
final class FindFixtureByIdDone extends FindFixtureByIdState {
  final FixtureEntity fixture;

  const FindFixtureByIdDone({
    required this.fixture,
  });

  @override
  List<Object> get props => [fixture];
}
