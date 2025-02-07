import 'package:go/core/enums/model_type.dart';
import 'package:go/core/errors/exceptions.dart';
import 'package:go/core/utils/constants.dart';
import 'package:go/core/utils/core_utils.dart';
import 'package:go/entities/item.dart';

class ItemModel extends Item {
  const ItemModel({
    super.nome,
  });

  const ItemModel.empty() : this(nome: '');

  factory ItemModel.fromEntity(Item user) {
    return ItemModel(nome: user.nome);
  }

  Item toEntity() {
    return Item(nome: nome);
  }

  ItemModel copyWith({
    String? nome,
  }) {
    return ItemModel(
      nome: nome ?? this.nome,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nome': nome,
    };
  }

  factory ItemModel.fromMap(Map<String, dynamic> map) {
    try {
      CoreUtils.throwsSerializationException(
        map: map,
        requiredKeys: Constants.objectKeysList[ModelType.item.name],
      );

      return ItemModel(
        nome: map['nome'] != null ? map['nome'] as String : null,
      );
    } catch (e) {
      throw SerializationException(
        error: e.toString(),
      );
    }
  }

  @override
  String toString() => 'ItemModel(nome: $nome)';
}
