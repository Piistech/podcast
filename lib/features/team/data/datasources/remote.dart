import 'package:podcast/features/team/team.dart';

abstract class TeamRemoteDataSource {
  Future<TeamModel> fetch({
    required String fixtureGuid,
  });
}