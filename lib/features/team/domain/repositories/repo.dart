import 'package:either_dart/either.dart';

import '../../../../core/shared/shared.dart';
import '../../team.dart';

abstract class TeamRepository {
  Future<Either<Failure, TeamEntity>> fetch({
    required String teamGuid,
  });
}
