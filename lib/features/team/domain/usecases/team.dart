import '../../../../core/shared/shared.dart';
import '../../team.dart';

class TeamUsecase {
  final TeamRepository repository;
  TeamUsecase({
    required this.repository,
  });
  Future<Either<Failure, TeamEntity>> call({
    required String teamGuid,
  }) async {
    return await repository.fetch(
      teamGuid: teamGuid,
    );
  }
}
