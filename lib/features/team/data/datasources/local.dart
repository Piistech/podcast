import 'package:podcast/features/team/team.dart';

abstract class TeamLocalDataSource {
  TeamModel findTeam({
    required String fixtureGuid,
  });
  void cache({
    required TeamModel team,
    required String fixtureGuid,
  });

  void clear();
}
