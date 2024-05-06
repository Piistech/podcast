import 'package:either_dart/either.dart';

import '../../../../core/shared/shared.dart';
import '../../commentary.dart';

class StopCommentaryUseCase {
  final CommentaryRepository repository;

  StopCommentaryUseCase({
    required this.repository,
  });

  Future<Either<Failure, void>> call() {
    return repository.stop();
  }
}
