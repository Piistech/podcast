import '../../../../core/shared/shared.dart';

import '../../team.dart';

class TeamLocalDataSourceImpl implements TeamLocalDataSource {
  final Map<String, TeamModel> _cache = {};
  @override
  void clear() {
    _cache.clear();
  }

  @override
  TeamModel find({
    required String teamGuid,
  }) {
    if (_cache.containsKey(teamGuid)) {
      return _cache[teamGuid]!;
    }

    throw TeamNotFoundFailure();
  }

  @override
  void cache({
    required TeamModel team,
    required String teamGuid,
  }) {
    _cache[teamGuid] = team;
  }
}
