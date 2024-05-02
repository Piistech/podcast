import 'dart:io';

import 'package:flutter/services.dart';
import 'package:http/http.dart';

import '../../../../core/shared/shared.dart';
import '../../fixture.dart';

class FixtureRemoteDataSourceImpl extends FixtureRemoteDataSource {
  final Client client;

  FixtureRemoteDataSourceImpl({
    required this.client,
  });

  @override
  Future<List<FixtureModel>> get fixtures async {
    //! initialize headers
    // final Map<String, String> headers = {};

    //! initialize response
    // final Response response = await client.get(
    //   RemoteEndpoints.fixtures,
    //   headers: headers,
    // );

    //! mock response
    final Response response = Response(
      await rootBundle.loadString('mock/fixtures.json'),
      HttpStatus.ok,
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

      return fixtures.where((element) => element != null).toList() as List<FixtureModel>;
    } else {
      throw RemoteFailure(message: result.error!);
    }
  }
}
