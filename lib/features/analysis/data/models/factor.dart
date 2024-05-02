import '../../../../core/shared/shared.dart';
import '../../analysis.dart';

class AnalysisFactorModel extends AnalysisFactorEntity {
  const AnalysisFactorModel({
    required super.label,
    required super.homeTeamScore,
    required super.awayTeamScore,
  });

  factory AnalysisFactorModel.parse({
    required Map<String, dynamic> map,
  }) {
    try {
      assert(
        map.containsKey('label'),
        "AnalysisFactorModel.parse: map doesn't contain key 'label'",
      );
      assert(
        map['label'] is String,
        "AnalysisFactorModel.parse: map['label'] is not a String",
      );

      assert(
        map.containsKey('homeTeamScore'),
        "AnalysisFactorModel.parse: map doesn't contain key 'homeTeamScore'",
      );
      assert(
        map['homeTeamScore'] is int,
        "AnalysisFactorModel.parse: map['homeTeamScore'] is not an int",
      );

      assert(
        map.containsKey('awayTeamScore'),
        "AnalysisFactorModel.parse: map doesn't contain key 'awayTeamScore'",
      );
      assert(
        map['awayTeamScore'] is int,
        "AnalysisFactorModel.parse: map['awayTeamScore'] is not an int",
      );

      return AnalysisFactorModel(
        label: map['label'],
        homeTeamScore: map['homeTeamScore'],
        awayTeamScore: map['awayTeamScore'],
      );
    } catch (e, stackTrace) {
      throw AnalysisFactorModelParsingFailure(
        message: e.toString(),
        stackTrace: stackTrace,
      );
    }
  }
}
