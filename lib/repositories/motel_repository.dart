import 'dart:convert';

import 'package:go/core/environments/environments.dart';
import 'package:go/core/errors/exceptions.dart';
import 'package:go/core/utils/typedefs.dart';
import 'package:go/models/motel_model.dart';
import 'package:http/http.dart' as http;

class MotelRepository {
  final http.Client client;

  const MotelRepository({required this.client});

  Future<List<MotelModel>> getMotels() async {
    try {
      final response = await client.get(Uri.parse(Environments.prod));

      if (response.statusCode == 200) {
        final DataMap decodedResponse = jsonDecode(response.body);

        final motelsData = decodedResponse['data']?['moteis'];

        if (motelsData == null || motelsData is! List || motelsData.isEmpty) {
          throw ServerException(
            message: 'Missing required data from server',
            statusCode: 1,
          );
        }

        final List<dynamic> data = decodedResponse['data']['moteis'];
        if (data.isEmpty) {
          throw ServerException(
            message: 'Missing required data from server',
            statusCode: 1,
          );
        }

        return data.map((json) => MotelModel.fromMap(json)).toList();
      } else {
        throw ServerException(
          message: response.body,
          statusCode: response.statusCode,
        );
      }
    } on ServerException {
      rethrow;
    } catch (e, stackTrace) {
      Error.throwWithStackTrace(
        UnknownException(exception: e.toString()),
        stackTrace,
      );
    }
  }
}
