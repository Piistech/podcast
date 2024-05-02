import 'package:either_dart/either.dart';

import '../../../../core/shared/shared.dart';
import '../../commentary.dart';

class FetchCommentaryUseCase {
  final CommentaryRepository repository;

  FetchCommentaryUseCase({
    required this.repository,
  });

  Future<Either<Failure, CommentaryEntity>> call({
    required String fixtureGuid,
  }) async {
    return await repository.fetch(fixtureGuid: fixtureGuid);
  }
}
