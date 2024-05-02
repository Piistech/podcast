
import 'package:either_dart/either.dart';

import '../../../../core/shared/shared.dart';
import '../../prediction.dart';

class PredictionRepositoryImpl implements PredictionRepository {
   final NetworkInfo network;
  final PredictionRemoteDataSource remote;

  const PredictionRepositoryImpl({
    required this.network,
    required this.remote,
  });

  @override
  Future<Either<Failure, PredictionEntity>> get prediction async {
if (await network.online) {
      try {
        final PredictionModel prediction = await remote.prediction;
        return Right(prediction);
      } on Failure catch (e) {
        return Left(e);
      }
    } else {
      return Left(NoInternetFailure());
    }
  }
}
