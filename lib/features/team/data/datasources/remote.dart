import '../../team.dart';

abstract class TeamRemoteDataSource {
  Future<TeamModel> fetch({
    required String teamGuid,
  });
}
