import '../../../../core/shared/shared.dart';
import '../../prediction.dart';

class PredictionModel extends PredictionEntity {
  PredictionModel({
    required super.winnerTeamId,
    required super.winnerTeamIdAfterToss,
  });

  factory PredictionModel.parse(Map<String, dynamic> map) {
    try {
      assert(
        map.containsKey('winnerTeamId'),
        "PredictionModel.parse: map doesn't contain key 'winnerTeamId'",
      );
      assert(
        map.containsKey('winnerTeamIdAfterToss'),
        "PredictionModel.parse: map doesn't contain key 'winnerTeamIdAfterToss'",
      );
      return PredictionModel(
        winnerTeamId: map['winnerTeamId'],
        winnerTeamIdAfterToss: map['winnerTeamIdAfterToss'],
      );
    } catch (e, stackTrace) {
      throw PredictionModelParsingFailure(
        message: e.toString(),
        stackTrace: stackTrace,
      );
    }
  }
}
