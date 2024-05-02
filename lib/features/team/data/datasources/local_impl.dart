import 'package:podcast/core/shared/shared.dart';

import '../../team.dart';

class TeamLocalDataSourceImpl implements TeamLocalDataSource {
  final Map<String, TeamModel> _cache = {};
  @override
  void clear() {
    _cache.clear();
  }

  @override
  TeamModel findTeam({
    required String fixtureGuid,
  }) {
    if (_cache.containsKey(fixtureGuid)) {
      return _cache[fixtureGuid]!;
    }

    throw TeamNotFoundFailure();
  }

  @override
  void cache({
    required TeamModel team,
    required String fixtureGuid,
  }) {
    _cache[fixtureGuid] = team;
  }
}
