import 'package:either_dart/either.dart';

import '../../../../core/shared/shared.dart';
import '../../commentary.dart';

class FindCommentaryByIdUseCase {
  final CommentaryRepository repository;

  FindCommentaryByIdUseCase({
    required this.repository,
  });

  Either<Failure, CommentaryEntity> call({
    required String fixtureGuid,
  }) {
    return repository.findById(fixtureGuid: fixtureGuid);
  }
}
