import '../../commentary.dart';

abstract class CommentaryRemoteDataSource {
  Future<CommentaryModel> fetch({
    required String fixtureGuid,
  });
}
