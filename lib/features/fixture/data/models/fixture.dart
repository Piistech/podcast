import '../../fixture.dart';

import '../../../../core/shared/shared.dart';

class FixtureModel extends FixtureEntity {
  const FixtureModel({
    required super.guid,
    required super.matchTitle,
    required super.matchDescription,
    required super.startedAt,
    required super.result,
    required super.homeTeamId,
    required super.awayTeamId,
    required super.stadiumName,
    required super.logo,
  });

  factory FixtureModel.parse({
    required Map<String, dynamic> map,
  }) {
    try {
      assert(
        map.containsKey('fixtureId'),
        "FixtureModel.parse: map doesn't contain key 'fixtureId'",
      );
      assert(
        map['fixtureId'] is String,
        "FixtureModel.parse: map['fixtureId'] is not a String",
      );

      assert(
        map.containsKey('matchTitle'),
        "FixtureModel.parse: map doesn't contain key 'matchTitle'",
      );
      assert(
        map['matchTitle'] is String,
        "FixtureModel.parse: map['matchTitle'] is not a String",
      );

      assert(
        map.containsKey('matchDescription'),
        "FixtureModel.parse: map doesn't contain key 'matchDescription'",
      );
      assert(
        map['matchDescription'] is String,
        "FixtureModel.parse: map['matchDescription'] is not a String",
      );

      assert(
        map.containsKey('startTime'),
        "FixtureModel.parse: map doesn't contain key 'startDate'",
      );
      assert(
        map['startTime'] is String,
        "FixtureModel.parse: map['startTime'] is not a String",
      );

      assert(
        map.containsKey('result'),
        "FixtureModel.parse: map doesn't contain key 'result'",
      );
      assert(
        map['result'] is String?,
        "FixtureModel.parse: map['result'] is not a String?",
      );

      assert(
        map.containsKey('homeTeamId'),
        "FixtureModel.parse: map doesn't contain key 'homeTeamId'",
      );
      assert(
        map['homeTeamId'] is String,
        "FixtureModel.parse: map['homeTeamId'] is not a String",
      );

      assert(
        map.containsKey('awayTeamId'),
        "FixtureModel.parse: map doesn't contain key 'awayTeamId'",
      );
      assert(
        map['awayTeamId'] is String,
        "FixtureModel.parse: map['awayTeamId'] is not a String",
      );
      assert(
        map.containsKey('stadiumName'),
        "FixtureModel.parse: map doesn't contain key 'stadiumName'",
      );
      assert(
        map['stadiumName'] is String,
        "FixtureModel.parse: map['stadiumName'] is not a String",
      );
      assert(
        map.containsKey('logo'),
        "FixtureModel.parse: map doesn't contain key 'logo'",
      );
      assert(
        map['logo'] is String,
        "FixtureModel.parse: map['logo'] is not a String",
      );

      return FixtureModel(
        guid: map['fixtureId'],
        matchTitle: map['matchTitle'],
        matchDescription: map['matchDescription'],
        startedAt: DateTime.parse(map['startTime']),
        result: map['result'],
        homeTeamId: map['homeTeamId'],
        awayTeamId: map['awayTeamId'],
        stadiumName: map['stadiumName'],
        logo: map['logo'],
      );
    } catch (e, stackTrace) {
      throw FixtureModelParsingFailure(
        message: e.toString(),
        stackTrace: stackTrace,
      );
    }
  }
}
