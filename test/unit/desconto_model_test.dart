import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:go/core/utils/typedefs.dart';
import 'package:go/entities/desconto.dart';
import 'package:go/models/desconto_model.dart';

import '../fixtures/fixture_reader.dart';

void main() {
  final tDescontoModelel = DescontoModel.empty();

  test(
    'should be a subclass of [Desconto] entity',
    () => expect(tDescontoModelel, isA<Desconto>()),
  );

  final tMap = jsonDecode(fixture('desconto.json')) as DataMap;

  group('fromMap', () {
    test('should return a valid [DescontoModel] from the map', () {
      final result = DescontoModel.fromMap(tMap);
      expect(result, isA<DescontoModel>());
      expect(result, tDescontoModelel);
    });

    test('should throw an [Error] when the map is invalid', () {
      final map = DataMap.from(tMap)..remove('desconto');

      const methodCall = DescontoModel.fromMap;

      expect(() => methodCall(map), throwsA(isA<Error>()));
    });
  });

  group('toMap', () {
    test('should return a valid [DataMap] from DescontoModel', () {
      final result = tDescontoModelel.toMap();

      expect(result, equals(tMap));
    });
  });

  group('copyWith', () {
    test('should return a valid [DescontoModel] with updated values', () {
      final result = tDescontoModelel.copyWith(desconto: 0);

      expect(result, isA<DescontoModel>());
      expect(result.desconto, 0);
    });
  });

  group('toString', () {
    test('should have correct toString implementation', () {
      expect(
        tDescontoModelel.toString(),
        'DescontoModel(desconto: 0.0)',
      );
    });
  });

  group('fromEntity toEntity', () {
    test('should convert from Desconto entity correctly', () {
      const descontoEntity = Desconto(desconto: 0.0);

      final descontoModel = DescontoModel.fromEntity(descontoEntity);

      expect(descontoModel.desconto, descontoEntity.desconto);
    });

    test('should convert to Desconto entity correctly', () {
      final descontoModel = DescontoModel.empty();
      final descontoEntity = descontoModel.toEntity();

      expect(descontoEntity.desconto, descontoModel.desconto);
    });
  });
}
