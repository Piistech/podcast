import '../../../../core/shared/shared.dart';
import '../../commentary.dart';

class CommentaryLocalDataSourceImpl extends CommentaryLocalDataSource {
  final Map<String, CommentaryModel> _cache = {};

  @override
  void cache({
    required String fixtureGuid,
    required CommentaryModel commentary,
  }) {
    _cache[fixtureGuid] = commentary;
  }

  @override
  void clear() {
    _cache.clear();
  }

  @override
  CommentaryModel findById({
    required String fixtureGuid,
  }) {
    if (_cache.containsKey(fixtureGuid)) {
      return _cache[fixtureGuid]!;
    }

    throw CommentaryNotFoundFailure();
  }
}
