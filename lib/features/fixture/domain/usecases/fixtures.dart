import 'package:either_dart/either.dart';

import '../../../../core/shared/shared.dart';
import '../../fixture.dart';

class FixturesUseCase {
  final FixtureRepository repository;

  FixturesUseCase({
    required this.repository,
  });

  Future<Either<Failure, List<FixtureEntity>>> call() async {
    return await repository.fixtures;
  }
}
