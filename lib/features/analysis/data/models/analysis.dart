import '../../../../core/shared/shared.dart';
import '../../analysis.dart';

class AnalysisModel extends AnalysisEntity {
  const AnalysisModel({
    required super.matchCount,
    required super.factors,
    required super.homeTeamId,
    required super.awayTeamId,
  });

  factory AnalysisModel.parse({
    required Map<String, dynamic> map,
  }) {
    try {
      assert(
        map.containsKey('matchCount'),
        "AnalysisModel.parse: map doesn't contain key 'matchCount'",
      );
      assert(
        map['matchCount'] is int,
        "AnalysisModel.parse: map['matchCount'] is not an int",
      );
      assert(
        map.containsKey('homeTeamId'),
        "AnalysisModel.parse: map doesn't contain key 'homeTeamId'",
      );
      assert(
        map['homeTeamId'] is String,
        "AnalysisModel.parse: map['matchCount'] is not an homeTeamId",
      );
      assert(
        map.containsKey('awayTeamId'),
        "AnalysisModel.parse: map doesn't contain key 'awayTeamId'",
      );
      assert(
        map['awayTeamId'] is String,
        "AnalysisModel.parse: map['matchCount'] is not an awayTeamId",
      );

      assert(
        map.containsKey('factors'),
        "AnalysisModel.parse: map doesn't contain key 'factors'",
      );
      assert(
        map['factors'] is List<dynamic>,
        "AnalysisModel.parse: map['factors'] is not a List<dynamic>",
      );

      return AnalysisModel(
        matchCount: map['matchCount'],
        factors: List<dynamic>.from(map['factors'])
            .map(
              (e) => AnalysisFactorModel.parse(map: e),
            )
            .toList(),
        homeTeamId: map['homeTeamId'],
        awayTeamId: map['awayTeamId'],
      );
    } catch (e, stackTrace) {
      throw AnalysisModelParsingFailure(
        message: e.toString(),
        stackTrace: stackTrace,
      );
    }
  }
}
