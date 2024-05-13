import '../../../../core/shared/shared.dart';
import '../../analysis.dart';

class AnalysisModel extends AnalysisEntity {
  const AnalysisModel({
    // required super.matchCount,
    required super.factors,
    required super.homeTeamId,
    required super.awayTeamId,
  });

  factory AnalysisModel.parse({
    required Map<String, dynamic> map,
  }) {
    try {
      return AnalysisModel(
        factors: List<dynamic>.from(map['result'])
            .map(
              (e) => AnalysisFactorModel.parse(map: e),
            )
            .toList(),
        homeTeamId: "", //map['homeTeamId'],
        awayTeamId: "", //map['awayTeamId'],
      );
    } catch (e, stackTrace) {
      throw AnalysisModelParsingFailure(
        message: e.toString(),
        stackTrace: stackTrace,
      );
    }
  }

  factory AnalysisModel.parseV2({
    required List<Map<String, dynamic>> maps,
  }) {
    final factors = maps
        .map(
          (e) => AnalysisFactorModel.parse(map: e),
        )
        .toList();

    // assert(
    //   factors.isNotEmpty,
    //   "Analysis factors is empty, where it shouldn't be",
    // );

    final String homeTeamId = factors.isEmpty ? '' : maps.first['homeTeamId'] as String;
    final String awayTeamId = factors.isEmpty ? '' : maps.first['awayTeamId'] as String;

    try {
      return AnalysisModel(
        factors: factors,
        homeTeamId: homeTeamId,
        awayTeamId: awayTeamId,
      );
    } catch (e, stackTrace) {
      throw AnalysisModelParsingFailure(
        message: e.toString(),
        stackTrace: stackTrace,
      );
    }
  }
}
