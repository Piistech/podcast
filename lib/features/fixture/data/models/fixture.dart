import 'package:podcast/features/fixture/fixture.dart';

import '../../../../core/shared/shared.dart';

class FixtureModel extends FixtureEntity {
  const FixtureModel({
    required super.guid,
    required super.matchName,
    required super.tournamentName,
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
        map.containsKey('matchName'),
        "FixtureModel.parse: map doesn't contain key 'matchName'",
      );
      assert(
        map['matchName'] is String,
        "FixtureModel.parse: map['matchName'] is not a String",
      );

      assert(
        map.containsKey('tournamentName'),
        "FixtureModel.parse: map doesn't contain key 'tournamentName'",
      );
      assert(
        map['tournamentName'] is String,
        "FixtureModel.parse: map['tournamentName'] is not a String",
      );

      assert(
        map.containsKey('startDate'),
        "FixtureModel.parse: map doesn't contain key 'startDate'",
      );
      assert(
        map['startDate'] is String,
        "FixtureModel.parse: map['startDate'] is not a String",
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
        matchName: map['matchName'],
        tournamentName: map['tournamentName'],
        startedAt: DateTime.parse(map['startDate']),
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
