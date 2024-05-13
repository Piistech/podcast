import '../../../../core/shared/shared.dart';
import '../../prediction.dart';

class PredictionModel extends PredictionEntity {
  PredictionModel({
    required super.winnerTeamId,
    required super.winnerTeamIdAfterToss,
  });

  factory PredictionModel.parse(List<Map<String, dynamic>> map) {
    try {
      // assert(
      //   map.containsKey('predictionwinnerId'),
      //   "PredictionModel.parse: map doesn't contain key 'predictionwinnerId'",
      // );
      // assert(
      //   map.containsKey('predictionwinnerAfterId'),
      //   "PredictionModel.parse: map doesn't contain key 'predictionwinnerAfterId'",
      // );

      return PredictionModel(
        winnerTeamId: map.first['predictionwinnerId'],
        winnerTeamIdAfterToss: map.first['predictionwinnerAfterId'],
      );
    } catch (e, stackTrace) {
      throw PredictionModelParsingFailure(
        message: e.toString(),
        stackTrace: stackTrace,
      );
    }
  }

}
