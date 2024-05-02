import 'package:equatable/equatable.dart';

class FixtureEntity extends Equatable {
  final String guid;
  final String matchName;
  final String tournamentName;
  final DateTime startedAt;
  final String? result;
  final String homeTeamId;
  final String awayTeamId;

  const FixtureEntity({
    required this.guid,
    required this.matchName,
    required this.tournamentName,
    required this.startedAt,
    required this.result,
    required this.homeTeamId,
    required this.awayTeamId,
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
      ];
}
