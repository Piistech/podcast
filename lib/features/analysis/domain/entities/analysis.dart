import 'package:equatable/equatable.dart';

import 'factor.dart';

class AnalysisEntity extends Equatable {
  final int matchCount;
  final String homeTeamId;
  final String awayTeamId;
  final List<AnalysisFactorEntity> factors;

  const AnalysisEntity({
    required this.matchCount,
    required this.factors,
    required this.homeTeamId,
    required this.awayTeamId,
  });

  @override
  List<Object?> get props => [
        matchCount,
        factors,
        homeTeamId,
        awayTeamId,
      ];
}
