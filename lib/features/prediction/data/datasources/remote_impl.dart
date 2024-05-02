import 'dart:io';

import 'package:flutter/services.dart';
import 'package:http/http.dart';

import '../../../../core/shared/shared.dart';
import '../../prediction.dart';

class PredictionDataSourceImpl extends PredictionRemoteDataSource {
  final Client client;

  PredictionDataSourceImpl({
    required this.client,
  });

  @override
  Future<PredictionModel> fetch({
    required String fixtureGuid,
  }) async {
    //! initialize headers
    // final Map<String, String> headers = {};
    // final Map<String, String> headers = {"fixtureGuid": fixtureGuid};
    //! initialize response
    // final Response response = await client.get(
    //   RemoteEndpoints.prediction,
    //   headers: headers,
    // );

    //! mock response
    final Response response = Response(
      await rootBundle.loadString('mock/prediction.json'),
      HttpStatus.ok,
    );

    final RemoteResponse<Map<String, dynamic>> result = RemoteResponse.parse(
      response: response,
    );

    if (result.success) {
      final PredictionModel prediction = PredictionModel.parse(result.result!);
      return prediction;
    } else {
      throw RemoteFailure(message: result.error!);
    }
  }
}
