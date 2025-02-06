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
    if (!map.containsKey('nome')) {
      throw Error();
    }
    return ItemModel(
      nome: map['nome'] != null ? map['nome'] as String : null,
    );
  }

  @override
  String toString() => 'ItemModel(nome: $nome)';
}
