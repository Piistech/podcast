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

  Stream<Either<Failure, String?>> get liveChannel;

  Future<Either<Failure, void>> play({
    required String token,
    required String channelId,
    required String fixtureGuid,
    required String matchName,
    required String fixtureIcon,
  });

  Future<Either<Failure, void>> stop();
}
