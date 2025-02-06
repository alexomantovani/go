import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:go/core/utils/typedefs.dart';
import 'package:go/entities/categoria_item.dart';
import 'package:go/models/categoria_item_model.dart';

import '../fixtures/fixture_reader.dart';

void main() {
  final tCategoriaItemModel = CategoriaItemModel.empty();

  test(
    'should be a subclass of [CategoriaItem] entity',
    () => expect(tCategoriaItemModel, isA<CategoriaItem>()),
  );

  final tMap = jsonDecode(fixture('categoria_item.json')) as DataMap;

  group('fromMap', () {
    test('should return a valid [CategoriaItemModel] from the map', () {
      final result = CategoriaItemModel.fromMap(tMap);
      expect(result, isA<CategoriaItemModel>());
      expect(result, tCategoriaItemModel);
    });

    test('should throw an [Error] when the map is invalid', () {
      final map = DataMap.from(tMap)..remove('nome');

      const methodCall = CategoriaItemModel.fromMap;

      expect(() => methodCall(map), throwsA(isA<Error>()));
    });
  });

  group('toMap', () {
    test('should return a valid [DataMap] from CategoriaItemModel', () {
      final result = tCategoriaItemModel.toMap();

      expect(result, equals(tMap));
    });
  });

  group('copyWith', () {
    test('should return a valid [CategoriaItemModel] with updated values', () {
      final result = tCategoriaItemModel.copyWith(nome: 'nome');

      expect(result, isA<CategoriaItemModel>());
      expect(result.nome, 'nome');
    });
  });

  group('toString', () {
    test('should have correct toString implementation', () {
      expect(
        tCategoriaItemModel.toString(),
        'CategoriaItemModel(nome: , icone: )',
      );
    });
  });

  group('fromEntity toEntity', () {
    test('should convert from CategoriaItem entity correctly', () {
      const categoriaEntity = CategoriaItem(nome: '');

      final categoriaModel = CategoriaItemModel.fromEntity(categoriaEntity);

      expect(categoriaModel.nome, categoriaEntity.nome);
    });

    test('should convert to CategoriaItem entity correctly', () {
      final categoriaModel = CategoriaItemModel.empty();
      final categoriaEntity = categoriaModel.toEntity();

      expect(categoriaEntity.nome, categoriaModel.nome);
    });
  });
}
