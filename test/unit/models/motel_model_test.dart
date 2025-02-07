import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:go/core/errors/exceptions.dart';
import 'package:go/core/utils/typedefs.dart';
import 'package:go/entities/motel.dart';
import 'package:go/models/motel_model.dart';

import '../../fixtures/fixture_reader.dart';

void main() {
  final tMotelModel = MotelModel.empty();

  test(
    'should be a subclass of [LocalUser] entity',
    () => expect(tMotelModel, isA<Motel>()),
  );

  final tMap = jsonDecode(fixture('motel.json')) as DataMap;

  group('fromMap', () {
    test('should return a valid [MotelModel] from the map', () {
      final result = MotelModel.fromMap(tMap);
      expect(result, isA<MotelModel>());
      expect(result, tMotelModel);
    });

    test('should throw an [SerializationException] when the map is invalid',
        () {
      final map = DataMap.from(tMap)..remove('suites');

      const methodCall = MotelModel.fromMap;

      expect(() => methodCall(map), throwsA(isA<SerializationException>()));
    });
  });

  group('toMap', () {
    test('should return a valid [DataMap] from MotelModel', () {
      final result = tMotelModel.toMap();

      expect(result, equals(tMap));
    });
  });

  group('copyWith', () {
    test('should return a valid [MotelModel] with updated values', () {
      final result = tMotelModel.copyWith(logo: 'logo.gif');

      expect(result, isA<MotelModel>());
      expect(result.logo, 'logo.gif');
    });
  });

  group('toString', () {
    test('should have correct toString implementation', () {
      expect(
        tMotelModel.toString(),
        'MotelModel(fantasia: , logo: , bairro: , distancia: 0.0, qtdFavoritos: 0, suites: null, qtdAvaliacoes: 0, media: 0.0)',
      );
    });
  });

  group('fromEntity toEntity', () {
    test('should convert from Motel entity correctly', () {
      final motelEntity = Motel.empty();

      final motelModel = MotelModel.fromEntity(motelEntity);

      expect(motelModel.fantasia, motelEntity.fantasia);
      expect(motelModel.logo, motelEntity.logo);
      expect(motelModel.bairro, motelEntity.bairro);
      expect(motelModel.distancia, motelEntity.distancia);
      expect(motelModel.qtdFavoritos, motelEntity.qtdFavoritos);
      expect(motelModel.suites, motelEntity.suites);
      expect(motelModel.qtdAvaliacoes, motelEntity.qtdAvaliacoes);
      expect(motelModel.media, motelEntity.media);
    });

    test('should convert to Motel entity correctly', () {
      final motelModel = MotelModel.empty();
      final motelEntity = motelModel.toEntity();

      expect(motelEntity.fantasia, motelModel.fantasia);
      expect(motelEntity.logo, motelModel.logo);
      expect(motelEntity.bairro, motelModel.bairro);
      expect(motelEntity.distancia, motelModel.distancia);
      expect(motelEntity.qtdFavoritos, motelModel.qtdFavoritos);
      expect(motelEntity.suites, motelModel.suites);
      expect(motelEntity.qtdAvaliacoes, motelModel.qtdAvaliacoes);
      expect(motelEntity.media, motelModel.media);
    });
  });
}
