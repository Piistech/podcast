import '../../fixture.dart';

abstract class FixtureRemoteDataSource {
  Future<List<FixtureModel>> get fixtures;
}