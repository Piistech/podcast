import '../models/prediction.dart';

abstract class PredictionRemoteDataSource {
  Future<PredictionModel> fetch ({
    required String fixtureGuid,
  });
}
