import 'package:either_dart/either.dart';

import '../../../../core/shared/shared.dart';
import '../../team.dart';

class TeamRepositoryImpl extends TeamRepository {
  final NetworkInfo network;
  final TeamRemoteDataSource remote;
  final TeamLocalDataSource local;

  TeamRepositoryImpl({
    required this.network,
    required this.remote,
    required this.local,
  });

  @override
  Future<Either<Failure, TeamEntity>> fetch({
    required String fixtureGuid,
  }) async {
    try {
      final TeamModel team = local.findTeam(
        fixtureGuid: fixtureGuid,
      );

      return Right(team);
    } on TeamNotFoundFailure {
      if (await network.online) {
        try {
          final TeamModel team = await remote.fetch(
            fixtureGuid: fixtureGuid,
          );
          local.cache(
            team: team,
            fixtureGuid: fixtureGuid,
          );
          return Right(team);
        } on Failure catch (e) {
          return Left(e);
        }
      } else {
        return Left(NoInternetFailure());
      }
    }
  }
}
