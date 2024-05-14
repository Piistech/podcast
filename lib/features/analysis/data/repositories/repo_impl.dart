
import '../../../../core/shared/shared.dart';
import '../../analysis.dart';

class AnalysisRepositoryImpl implements AnalysisRepository {
  final NetworkInfo network;
  final AnalysisLocalDataSource local;
  final AnalysisRemoteDataSource remote;

  AnalysisRepositoryImpl({
    required this.network,
    required this.local,
    required this.remote,
  });

  @override
  Future<Either<Failure, AnalysisEntity>> fetch({
    required String fixtureGuid,
  }) async {
    try {
      final AnalysisModel analysis = local.findById(fixtureGuid: fixtureGuid);
      return Right(analysis);
    } on AnalysisNotFoundFailure {
      if (await network.online) {
        try {
          final AnalysisModel analysis = await remote.fetch(fixtureGuid: fixtureGuid);
          local.cache(
            fixtureGuid: fixtureGuid,
            analysis: analysis,
          );
          return Right(analysis);
        } on Failure catch (e) {
          return Left(e);
        }
      } else {
        return Left(NoInternetFailure());
      }
    }
  }

  @override
  Either<Failure, AnalysisEntity> findById({
    required String fixtureGuid,
  }) {
    try {
      final AnalysisModel analysis = local.findById(fixtureGuid: fixtureGuid);
      return Right(analysis);
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
