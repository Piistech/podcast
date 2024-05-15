
import '../../../../core/shared/shared.dart';
import '../../analysis.dart';

class FindAnalysisByIdUseCase {
  final AnalysisRepository repository;

  FindAnalysisByIdUseCase({
    required this.repository,
  });

  Either<Failure, AnalysisEntity> call({
    required String fixtureGuid,
  }) {
    return repository.findById(fixtureGuid: fixtureGuid);
  }
}
