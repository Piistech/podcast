import '../../analysis.dart';

abstract class AnalysisRemoteDataSource {
  Future<AnalysisModel> fetch({
    required String fixtureGuid,
  });
}
