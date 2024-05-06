import 'package:either_dart/either.dart';

import '../../../../core/shared/shared.dart';
import '../../commentary.dart';

abstract class CommentaryRepository {
  Future<Either<Failure, CommentaryEntity>> fetch({
    required String fixtureGuid,
  });

  Either<Failure, CommentaryEntity> findById({
    required String fixtureGuid,
  });

  Stream<bool> get live;

  Stream<String?> get liveChannel;

  Future<Either<Failure, void>> play({
    required String token,
    required String channelId,
  });

  Future<Either<Failure, void>> stop();
}
