import 'package:either_dart/either.dart';

import '../../../../core/shared/shared.dart';
import '../../team.dart';

class TeamUsecase {
  final TeamRepository repository;
  TeamUsecase({
    required this.repository,
  });
  Future<Either<Failure, TeamEntity>> call({
    required String fixtureGuid,
  }) async {
    return await repository.fetch(fixtureGuid: fixtureGuid);
  }
}
