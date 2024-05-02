import '../../../../core/shared/shared.dart';
import '../../fixture.dart';
import 'local.dart';

class FixtureLocalDataSourceImpl extends FixtureLocalDataSource {
  final Map<String, FixtureModel> _cache = {};

  @override
  void cache({required List<FixtureModel> fixtures}) {
    for (var element in fixtures) {
      _cache[element.guid] = element;
    }
  }

  @override
  void clear() {
    _cache.clear();
  }

  @override
  List<FixtureModel> get fixtures => _cache.values.toList();

  @override
  FixtureModel findById({
    required String guid,
  }) {
    if (_cache.containsKey(guid)) {
      return _cache[guid]!;
    }

    throw FixtureNotFoundFailure();
  }
}
