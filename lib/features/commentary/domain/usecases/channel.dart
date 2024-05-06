import '../../../../core/shared/shared.dart';
import '../../commentary.dart';

class CurrentlyPlayingCommentaryChannelUseCase {
  final CommentaryRepository repository;

  CurrentlyPlayingCommentaryChannelUseCase({
    required this.repository,
  });

  Stream<String?> get call => repository.liveChannel;
}
