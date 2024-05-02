import '../models/prediction.dart';

abstract class PredictionRemoteDataSource {
  Future<PredictionModel> get prediction;
}
