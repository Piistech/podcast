import 'package:either_dart/either.dart';

import '../../../../core/shared/shared.dart';
import '../../prediction.dart';

class PredictionUseCase {
  final PredictionRepository repository;
  PredictionUseCase({
    required this.repository,
  });
   Future<Either<Failure,PredictionEntity>> call() async {
    return await repository.prediction;
  }
}