import 'package:either_dart/either.dart';

import '../../../../core/shared/shared.dart';
import '../../commentary.dart';

class CommentaryRepositoryImpl implements CommentaryRepository {
  final NetworkInfo network;
  final CommentaryLocalDataSource local;
  final CommentaryRemoteDataSource remote;

  CommentaryRepositoryImpl({
    required this.network,
    required this.local,
    required this.remote,
  });

  @override
  Future<Either<Failure, CommentaryEntity>> fetch({
    required String fixtureGuid,
  }) async {
    if (await network.online) {
      try {
        final CommentaryModel commentary = await remote.fetch(fixtureGuid: fixtureGuid);
        local.cache(
          fixtureGuid: fixtureGuid,
          commentary: commentary,
        );
        return Right(commentary);
      } on Failure catch (e) {
        return Left(e);
      }
    } else {
      return Left(NoInternetFailure());
    }
  }

  @override
  Either<Failure, CommentaryEntity> findById({
    required String fixtureGuid,
  }) {
    try {
      final CommentaryModel commentary = local.findById(fixtureGuid: fixtureGuid);
      return Right(commentary);
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
