import '../../team.dart';

abstract class TeamLocalDataSource {
  TeamModel find({
    required String teamGuid,
  });
  void cache({
    required TeamModel team,
    required String teamGuid,
  });

  void clear();
}
