
import '../../../../core/shared/shared.dart';
import '../../analysis.dart';

class FetchAnalysisUseCase {
  final AnalysisRepository repository;

  FetchAnalysisUseCase({
    required this.repository,
  });

  Future<Either<Failure, AnalysisEntity>> call({
    required String fixtureGuid,
  }) async {
    return await repository.fetch(fixtureGuid: fixtureGuid);
  }
}
