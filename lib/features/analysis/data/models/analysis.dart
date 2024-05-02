import '../../../../core/shared/shared.dart';
import '../../analysis.dart';

class AnalysisModel extends AnalysisEntity {
  const AnalysisModel({
    required super.matchCount,
    required super.factors,
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
      );
    } catch (e, stackTrace) {
      throw AnalysisModelParsingFailure(
        message: e.toString(),
        stackTrace: stackTrace,
      );
    }
  }
}
