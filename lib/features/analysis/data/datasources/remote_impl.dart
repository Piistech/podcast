import '../../../../core/shared/shared.dart';
import '../../analysis.dart';

class AnalysisRemoteDataSourceImpl extends AnalysisRemoteDataSource {
  final Client client;

  AnalysisRemoteDataSourceImpl({
    required this.client,
  });

  @override
  Future<AnalysisModel> fetch({
    required String fixtureGuid,
  }) async {
    //! initialize headers
    final Map<String, String> headers = {
      "fixtureId": fixtureGuid,
    };

    //! initialize response
    final Response response = await client.get(
      RemoteEndpoints.analysis,
      headers: headers,
    );

    //! mock response
    // final Response response = Response(
    //   await rootBundle.loadString('mock/analysis.json'),
    //   HttpStatus.ok,
    // );

    final RemoteResponse<List<dynamic>> result = RemoteResponse.parse(
      response: response,
    );

    if (result.success) {
      // final List<Map<String, dynamic>> factorsMap = List<Map<String, dynamic>>.from(result.result!);
      // final List<AnalysisFactorModel> factors =
      //     factorsMap.map(
      //       (map) => AnalysisFactorModel.parse(map: map),
      //     )
      //     .toList();

      // assert(
      //   factors.isNotEmpty,
      //   "Analysis factors is empty, where it shouldn't be",
      // );
      // final String homeTeamId = factorsMap.first['homeTeamId'] as String;
      // final String awayTeamId = factorsMap.first['awayTeamId'] as String;

      // final AnalysisModel analysis = AnalysisModel(
      //   homeTeamId: homeTeamId,
      //   awayTeamId: awayTeamId,
      //   factors: factors,
      // );


      final AnalysisModel analysis = AnalysisModel.parseV2(
        maps: List<Map<String, dynamic>>.from(result.result!),
      );

      return analysis;
    } else {
      throw RemoteFailure(message: result.error!);
    }
  }
}
