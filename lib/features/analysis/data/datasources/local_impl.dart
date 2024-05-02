import '../../../../core/shared/shared.dart';
import '../../analysis.dart';

class AnalysisLocalDataSourceImpl extends AnalysisLocalDataSource {
  final Map<String, AnalysisModel> _cache = {};

  @override
  void cache({
    required String fixtureGuid,
    required AnalysisModel analysis,
  }) {
    _cache[fixtureGuid] = analysis;
  }

  @override
  void clear() {
    _cache.clear();
  }

  @override
  AnalysisModel findById({
    required String fixtureGuid,
  }) {
    if (_cache.containsKey(fixtureGuid)) {
      return _cache[fixtureGuid]!;
    }

    throw AnalysisNotFoundFailure();
  }
}
