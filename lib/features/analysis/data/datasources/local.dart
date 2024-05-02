import '../../analysis.dart';

abstract class AnalysisLocalDataSource {
  AnalysisModel findById({
    required String fixtureGuid,
  });

  void cache({
    required String fixtureGuid,
    required AnalysisModel analysis,
  });

  void clear();
}
