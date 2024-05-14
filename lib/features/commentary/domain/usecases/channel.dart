import '../../../../core/shared/shared.dart';
import '../../commentary.dart';

class CurrentlyPlayingCommentaryChannelUseCase {
  final CommentaryRepository repository;

  CurrentlyPlayingCommentaryChannelUseCase({
    required this.repository,
  });

  Stream<Either<Failure, String?>> get call => repository.liveChannel;
}
