import 'package:either_dart/either.dart';

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
  }) {
    return repository.play(token: token, channelId: channelId);
  }
}
