import '../../../../core/shared/shared.dart';
import '../../commentary.dart';

class CommentaryRemoteDataSourceImpl extends CommentaryRemoteDataSource {
  final Client client;

  CommentaryRemoteDataSourceImpl({
    required this.client,
  });

  @override
  Future<CommentaryModel> fetch({
    required String fixtureGuid,
  }) async {
    //! initialize headers
    // final Map<String, String> headers = {};

    //! initialize response
    // final Response response = await client.get(
    //   RemoteEndpoints.commentary,
    //   headers: headers,
    // );

    //! mock response
    final Response response = Response(
      await rootBundle.loadString('mock/commentary.json'),
      HttpStatus.ok,
    );

    final RemoteResponse<Map<String, dynamic>> result = RemoteResponse.parse(
      response: response,
    );

    if (result.success) {
      final CommentaryModel commentary = CommentaryModel.parse(
        map: Map<String, dynamic>.from(result.result!),
      );
      return commentary;
    } else {
      throw RemoteFailure(message: result.error!);
    }
  }
}
