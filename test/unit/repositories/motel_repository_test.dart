import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:go/core/environments/environments.dart';
import 'package:go/core/errors/exceptions.dart';
import 'package:go/models/motel_model.dart';
import 'package:go/repositories/motel_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

import 'motel_repository_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  late MotelRepository repository;
  late MockClient mockClient;

  setUp(() {
    mockClient = MockClient();
    repository = MotelRepository(client: mockClient);
  });

  final List<MotelModel> motelModelList = [MotelModel.empty()];

  final String url = Environments.prod;

  group('MotelRepository', () {
    test(
        'Should return a [List<MotelModel>] when the call is successful and the data is valid',
        () async {
      when(mockClient.get(Uri.parse(url))).thenAnswer((_) async =>
          http.Response(
              jsonEncode(
                  {"data": motelModelList.map((m) => m.toMap()).toList()}),
              200));

      final result = await repository.getMotels();

      expect(result, isA<List<MotelModel>>());
      expect(result.length, 1);
      expect(result.first.fantasia, '');
    });

    test('Should throw [ServerException] when data is missing', () async {
      when(mockClient.get(Uri.parse(url)))
          .thenAnswer((_) async => http.Response(jsonEncode({}), 200));

      expect(() => repository.getMotels(), throwsA(isA<ServerException>()));
    });

    test('Should throw [ServerException] when data is null', () async {
      when(mockClient.get(Uri.parse(url))).thenAnswer(
          (_) async => http.Response(jsonEncode({"data": null}), 200));

      expect(() => repository.getMotels(), throwsA(isA<ServerException>()));
    });

    test('Should throw [ServerException] when data is empty', () async {
      when(mockClient.get(Uri.parse(url))).thenAnswer(
          (_) async => http.Response(jsonEncode({"data": []}), 200));

      expect(() => repository.getMotels(), throwsA(isA<ServerException>()));
    });

    test('Should throw [ServerException] when call is unsuccessful', () async {
      when(mockClient.get(Uri.parse(url)))
          .thenAnswer((_) async => http.Response('Server Error', 500));

      expect(() => repository.getMotels(), throwsA(isA<ServerException>()));
    });

    test('Should throw [UnknownException] in case of unexpected error',
        () async {
      when(mockClient.get(Uri.parse(url)))
          .thenThrow(Exception('Unknown error'));

      expect(() => repository.getMotels(), throwsA(isA<UnknownException>()));
    });
  });
}
