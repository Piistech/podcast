import 'dart:io';

import 'package:flutter/services.dart';
import 'package:http/http.dart';

import '../../../../core/shared/shared.dart';
import '../../team.dart';

class TeamRemoteDataSourceImpl extends TeamRemoteDataSource {
  final Client client;

  TeamRemoteDataSourceImpl({
    required this.client,
  });

  @override
  Future<TeamModel> fetch({
    required String teamGuid,
  }) async {
    //! initialize headers
    // final Map<String, String> headers = {'fixtureGuid': fixtureGuid};

    //! initialize response
    // final Response response = await client.get(
    //   RemoteEndpoints.team,
    //   headers: headers,
    // );

    //! mock response
    final Response response = Response(
      await rootBundle.loadString('mock/team.json'),
      HttpStatus.ok,
    );

    final RemoteResponse<Map<String, dynamic>> result = RemoteResponse.parse(
      response: response,
    );
    if (result.success) {
      final TeamModel team = TeamModel.parse(map: result.result!);
      return team;
    } else {
      throw RemoteFailure(message: result.error!);
    }
  }
}
