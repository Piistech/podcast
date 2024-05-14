import '../../../../core/shared/shared.dart';
import '../../commentary.dart';

class PlayCommentaryUseCase {
  final CommentaryRepository repository;

  PlayCommentaryUseCase({
    required this.repository,
  });

  Future<Either<Failure, void>> call({
    required String token,
    required String channelId,
    required String fixtureGuid,
    required String matchName,
    required String fixtureIcon,
  }) {
    return repository.play(
      token: token,
      channelId: channelId,
      fixtureGuid: fixtureGuid,
      matchName: matchName,
      fixtureIcon: fixtureIcon,
    );
  }
}
