import '../../../../core/shared/shared.dart';
import '../../commentary.dart';

class LiveCommentaryStatusUseCase {
  final CommentaryRepository repository;

  LiveCommentaryStatusUseCase({
    required this.repository,
  });

  Stream<bool> get call => repository.live;
}
