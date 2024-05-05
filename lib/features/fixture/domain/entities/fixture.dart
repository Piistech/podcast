import 'package:equatable/equatable.dart';

class FixtureEntity extends Equatable {
  final String guid;
  final String matchName;
  final String tournamentName;
  final DateTime startedAt;
  final String? result;
  final String homeTeamId;
  final String awayTeamId;
  final String stadiumName;
  final String logo;

  const FixtureEntity({
    required this.guid,
    required this.matchName,
    required this.tournamentName,
    required this.startedAt,
    required this.result,
    required this.homeTeamId,
    required this.awayTeamId,
    required this.stadiumName,
    required this.logo,
  });

  @override
  List<Object?> get props => [
        guid,
        matchName,
        tournamentName,
        startedAt,
        result,
        homeTeamId,
        awayTeamId,
        stadiumName,
        logo,
      ];
}
