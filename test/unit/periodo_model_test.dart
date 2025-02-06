import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:go/core/errors/serialization_error.dart';
import 'package:go/core/utils/typedefs.dart';
import 'package:go/entities/periodo.dart';
import 'package:go/models/periodo_model.dart';

import '../fixtures/fixture_reader.dart';

void main() {
  final tPeriodoModel = PeriodoModel.empty();

  test(
    'should be a subclass of [Periodo] entity',
    () => expect(tPeriodoModel, isA<Periodo>()),
  );

  final tMap = jsonDecode(fixture('periodo.json')) as DataMap;

  group('fromMap', () {
    test('should return a valid [PeriodoModel] from the map', () {
      final result = PeriodoModel.fromMap(tMap);
      expect(result, isA<PeriodoModel>());
      expect(result, tPeriodoModel);
    });

    test('should throw an [SerializationError] when the map is invalid', () {
      final map = DataMap.from(tMap)..remove('desconto');

      const methodCall = PeriodoModel.fromMap;

      expect(() => methodCall(map), throwsA(isA<SerializationError>()));
    });
  });

  group('toMap', () {
    test('should return a valid [DataMap] from PeriodoModel', () {
      final result = tPeriodoModel.toMap();

      expect(result, equals(tMap));
    });
  });

  group('copyWith', () {
    test('should return a valid [PeriodoModel] with updated values', () {
      final result = tPeriodoModel.copyWith(tempoFormatado: 'tempoFormatado');

      expect(result, isA<PeriodoModel>());
      expect(result.tempoFormatado, 'tempoFormatado');
    });
  });

  group('toString', () {
    test('should have correct toString implementation', () {
      expect(
        tPeriodoModel.toString(),
        'PeriodoModel(tempoFormatado: , tempo: , valor: 0.0, valorTotal: 0.0, temCortesia: false, desconto: null)',
      );
    });
  });

  group('fromEntity toEntity', () {
    test('should convert from Periodo entity correctly', () {
      final periodoEntity = Periodo.empty();

      final periodoModel = PeriodoModel.fromEntity(periodoEntity);

      expect(periodoModel.tempoFormatado, periodoEntity.tempoFormatado);
      expect(periodoModel.tempo, periodoEntity.tempo);
      expect(periodoModel.valor, periodoEntity.valor);
      expect(periodoModel.valorTotal, periodoEntity.valorTotal);
      expect(periodoModel.temCortesia, periodoEntity.temCortesia);
      expect(periodoModel.desconto, periodoEntity.desconto);
    });

    test('should convert to Periodo entity correctly', () {
      final descontoModel = PeriodoModel.empty();
      final descontoEntity = descontoModel.toEntity();

      expect(descontoEntity.tempoFormatado, descontoModel.tempoFormatado);
      expect(descontoEntity.tempo, descontoModel.tempo);
      expect(descontoEntity.valor, descontoModel.valor);
      expect(descontoEntity.valorTotal, descontoModel.valorTotal);
      expect(descontoEntity.temCortesia, descontoModel.temCortesia);
      expect(descontoEntity.desconto, descontoModel.desconto);
    });
  });
}
