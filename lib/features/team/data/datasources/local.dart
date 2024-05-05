import 'package:podcast/features/team/team.dart';

abstract class TeamLocalDataSource {
  TeamModel findTeam({
    required String teamGuid,
  });
  void cache({
    required TeamModel team,
    required String teamGuid,
  });

  void clear();
}
