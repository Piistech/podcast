import 'package:equatable/equatable.dart';

import 'factor.dart';

class AnalysisEntity extends Equatable {
  final int matchCount;
  final List<AnalysisFactorEntity> factors;

  const AnalysisEntity({
    required this.matchCount,
    required this.factors,
  });

  @override
  List<Object?> get props => [
        matchCount,
        factors,
      ];
}
