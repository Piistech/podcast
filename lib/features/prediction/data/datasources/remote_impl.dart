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
  Future<PredictionModel> get prediction async {
    //! initialize headers
    // final Map<String, String> headers = {};

    //! initialize response
    // final Response response = await client.get(
    //   RemoteEndpoints.fixtures,
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
      final data = PredictionModel.parse(result.result!);
      return data;
    } else {
      throw RemoteFailure(message: result.error!);
    }
  }
}
