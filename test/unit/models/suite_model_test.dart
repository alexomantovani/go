import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:go/core/errors/exceptions.dart';
import 'package:go/core/utils/typedefs.dart';
import 'package:go/entities/suite.dart';
import 'package:go/models/suite_model.dart';

import '../../fixtures/fixture_reader.dart';

void main() {
  final tSuiteModel = SuiteModel.empty();

  test(
    'should be a subclass of [Suite] entity',
    () => expect(tSuiteModel, isA<Suite>()),
  );

  final tMap = jsonDecode(fixture('suite.json')) as DataMap;

  group('fromMap', () {
    test('should return a valid [SuiteModel] from the map', () {
      final result = SuiteModel.fromMap(tMap);
      expect(result, isA<SuiteModel>());
      expect(result, tSuiteModel);
    });

    test('should throw an [SerializationError] when the map is invalid', () {
      final map = DataMap.from(tMap)..remove('nome');

      const methodCall = SuiteModel.fromMap;

      expect(() => methodCall(map), throwsA(isA<SerializationException>()));
    });
  });

  group('toMap', () {
    test('should return a valid [DataMap] from SuiteModel', () {
      final result = tSuiteModel.toMap();

      expect(result, equals(tMap));
    });
  });

  group('copyWith', () {
    test('should return a valid [SuiteModel] with updated values', () {
      final result = tSuiteModel.copyWith(nome: 'suite');

      expect(result, isA<SuiteModel>());
      expect(result.nome, 'suite');
    });
  });

  group('toString', () {
    test('should have correct toString implementation', () {
      expect(
        tSuiteModel.toString(),
        'SuiteModel(nome: , qtd: 1, exibirQtdDisponiveis: true, fotos: [], itens: [], categoriaItens: [], periodos: [])',
      );
    });
  });

  group('fromEntity toEntity', () {
    test('should convert from Suite entity correctly', () {
      final suiteEntity = Suite.empty();

      final suiteModel = SuiteModel.fromEntity(suiteEntity);

      expect(suiteModel.nome, suiteEntity.nome);
      expect(suiteModel.qtd, suiteEntity.qtd);
      expect(suiteModel.exibirQtdDisponiveis, suiteEntity.exibirQtdDisponiveis);
      expect(suiteModel.fotos, suiteEntity.fotos);
      expect(suiteModel.itens, suiteEntity.itens);
      expect(suiteModel.categoriaItens, suiteEntity.categoriaItens);
    });

    test('should convert to Suite entity correctly', () {
      final suiteModel = SuiteModel.empty();
      final suiteEntity = suiteModel.toEntity();

      expect(suiteEntity.nome, suiteModel.nome);
      expect(suiteEntity.qtd, suiteModel.qtd);
      expect(suiteEntity.exibirQtdDisponiveis, suiteModel.exibirQtdDisponiveis);
      expect(suiteEntity.fotos, suiteModel.fotos);
      expect(suiteEntity.itens, suiteModel.itens);
      expect(suiteEntity.categoriaItens, suiteModel.categoriaItens);
    });
  });
}
