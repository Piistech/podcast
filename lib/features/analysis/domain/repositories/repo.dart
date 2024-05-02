import 'package:either_dart/either.dart';

import '../../../../core/shared/shared.dart';
import '../../analysis.dart';

abstract class AnalysisRepository {
  Future<Either<Failure, AnalysisEntity>> fetch({
    required String fixtureGuid,
  });

  Either<Failure, AnalysisEntity> findById({
    required String fixtureGuid,
  });
}
