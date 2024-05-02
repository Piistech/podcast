import '../../commentary.dart';

abstract class CommentaryLocalDataSource {
  CommentaryModel findById({
    required String fixtureGuid,
  });

  void cache({
    required String fixtureGuid,
    required CommentaryModel commentary,
  });

  void clear();
}
