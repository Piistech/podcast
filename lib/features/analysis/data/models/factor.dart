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
        map.containsKey('name'),
        "AnalysisFactorModel.parse: map doesn't contain key 'name'",
      );
      assert(
        map['name'] is String,
        "AnalysisFactorModel.parse: map['name'] is not a String",
      );

      assert(
        map.containsKey('homeScore'),
        "AnalysisFactorModel.parse: map doesn't contain key 'homeScore'",
      );
      assert(
        map['homeScore'] is int,
        "AnalysisFactorModel.parse: map['homeScore'] is not an int",
      );

      assert(
        map.containsKey('awayscore'),
        "AnalysisFactorModel.parse: map doesn't contain key 'awayscore'",
      );
      assert(
        map['awayscore'] is int,
        "AnalysisFactorModel.parse: map['awayscore'] is not an int",
      );


      return AnalysisFactorModel(
        label: map['name'] as String,
        homeTeamScore: map['homeScore'] as int,
        awayTeamScore: map['awayscore'] as int,
      );
    } catch (e, stackTrace) {
      throw AnalysisFactorModelParsingFailure(
        message: e.toString(),
        stackTrace: stackTrace,
      );
    }
  }
}
