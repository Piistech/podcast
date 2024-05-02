part of 'fixtures_bloc.dart';

abstract class FixturesState extends Equatable {
  const FixturesState();

  @override
  List<Object> get props => [];
}

class FixturesInitial extends FixturesState {
  const FixturesInitial();
}

class FixturesLoading extends FixturesState {
  const FixturesLoading();
}

class FixturesError extends FixturesState {
  final Failure failure;

  const FixturesError({
    required this.failure,
  });

  @override
  List<Object> get props => [failure];
}

class FixturesDone extends FixturesState {
  final List<FixtureEntity> fixtures;

  const FixturesDone({
    required this.fixtures,
  });

  @override
  List<Object> get props => [fixtures];
}
