import 'package:equatable/equatable.dart';

class AnalysisFactorEntity extends Equatable {
  final String label;
  final int homeTeamScore;
  final int awayTeamScore;

  const AnalysisFactorEntity({
    required this.label,
    required this.homeTeamScore,
    required this.awayTeamScore,
  });

  @override
  List<Object> get props => [
        label,
        homeTeamScore,
        awayTeamScore,
      ];
}
