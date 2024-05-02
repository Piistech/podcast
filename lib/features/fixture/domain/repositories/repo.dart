import 'package:either_dart/either.dart';

import '../../../../core/shared/shared.dart';
import '../../fixture.dart';

abstract class FixtureRepository {
  Future<Either<Failure, List<FixtureEntity>>> get fixtures;

  Either<Failure, FixtureEntity> findById({
    required String guid,
  });
}
