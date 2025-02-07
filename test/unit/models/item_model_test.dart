import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:go/core/errors/exceptions.dart';
import 'package:go/core/utils/typedefs.dart';
import 'package:go/entities/item.dart';
import 'package:go/models/item_model.dart';

import '../../fixtures/fixture_reader.dart';

void main() {
  final tItemModel = ItemModel.empty();

  test(
    'should be a subclass of [Item] entity',
    () => expect(tItemModel, isA<Item>()),
  );

  final tMap = jsonDecode(fixture('item.json')) as DataMap;

  group('fromMap', () {
    test('should return a valid [ItemModel] from the map', () {
      final result = ItemModel.fromMap(tMap);
      expect(result, isA<ItemModel>());
      expect(result, tItemModel);
    });

    test('should throw an [SerializationException] when the map is invalid',
        () {
      final map = DataMap.from(tMap)..remove('nome');

      const methodCall = ItemModel.fromMap;

      expect(() => methodCall(map), throwsA(isA<SerializationException>()));
    });
  });

  group('toMap', () {
    test('should return a valid [DataMap] from ItemModel', () {
      final result = tItemModel.toMap();

      expect(result, equals(tMap));
    });
  });

  group('copyWith', () {
    test('should return a valid [ItemModel] with updated values', () {
      final result = tItemModel.copyWith(nome: 'nome');

      expect(result, isA<ItemModel>());
      expect(result.nome, 'nome');
    });
  });

  group('toString', () {
    test('should have correct toString implementation', () {
      expect(
        tItemModel.toString(),
        'ItemModel(nome: )',
      );
    });
  });

  group('fromEntity toEntity', () {
    test('should convert from Item entity correctly', () {
      const itemEntity = Item(nome: '');

      final itemModel = ItemModel.fromEntity(itemEntity);

      expect(itemModel.nome, itemEntity.nome);
    });

    test('should convert to Item entity correctly', () {
      final intemModel = ItemModel.empty();
      final itemEntity = intemModel.toEntity();

      expect(itemEntity.nome, intemModel.nome);
    });
  });
}
