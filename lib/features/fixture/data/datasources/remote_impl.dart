import '../../../../core/shared/shared.dart';
import '../../fixture.dart';

class FixtureRemoteDataSourceImpl extends FixtureRemoteDataSource {
  final Client client;

  FixtureRemoteDataSourceImpl({
    required this.client,
  });

  @override
  Future<List<FixtureModel>> get fixtures async {
    //! initialize response
    final Response response = await client.get(
      RemoteEndpoints.fixtures,
    );

    final RemoteResponse<List<dynamic>> result = RemoteResponse.parse(
      response: response,
    );

    if (result.success) {
      final List<FixtureModel?> fixtures = result.result!.map(
        (map) {
          try {
            return FixtureModel.parse(
              map: Map<String, dynamic>.from(map),
            );
          } catch (e) {
            return null;
          }
        },
      ).toList();

      return fixtures.whereType<FixtureModel>().toList();
    } else {
      throw RemoteFailure(message: result.error!);
    }
  }
}
