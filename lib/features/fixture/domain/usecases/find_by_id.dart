import 'package:either_dart/either.dart';

import '../../../../core/shared/shared.dart';
import '../../fixture.dart';

class FindFixtureByIdUseCase {
  final FixtureRepository repository;

  FindFixtureByIdUseCase({
    required this.repository,
  });

  Either<Failure, FixtureEntity> call({
    required String guid,
  }) {
    return repository.findById(guid: guid);
  }
}
