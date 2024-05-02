import '../../fixture.dart';

abstract class FixtureLocalDataSource {
  List<FixtureModel> get fixtures;
  
  FixtureModel findById({
    required String guid,
  });

  void cache({
    required List<FixtureModel> fixtures,
  });

  void clear();
}
