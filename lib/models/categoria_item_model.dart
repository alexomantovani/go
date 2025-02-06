import 'package:go/entities/categoria_item.dart';

class CategoriaItemModel extends CategoriaItem {
  const CategoriaItemModel({
    super.nome,
    super.icone,
  });

  const CategoriaItemModel.empty() : this(nome: '', icone: '');

  factory CategoriaItemModel.fromEntity(CategoriaItem categoriaItem) {
    return CategoriaItemModel(
      nome: categoriaItem.nome,
      icone: categoriaItem.icone,
    );
  }

  CategoriaItem toEntity() {
    return CategoriaItem(
      nome: nome,
      icone: icone,
    );
  }

  CategoriaItemModel copyWith({
    String? nome,
    String? icone,
  }) {
    return CategoriaItemModel(
      nome: nome ?? this.nome,
      icone: icone ?? this.icone,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nome': nome,
      'icone': icone,
    };
  }

  factory CategoriaItemModel.fromMap(Map<String, dynamic> map) {
    if (!map.containsKey('nome') || !map.containsKey('icone')) {
      throw Error();
    }
    return CategoriaItemModel(
      nome: map['nome'] != null ? map['nome'] as String : null,
      icone: map['icone'] != null ? map['icone'] as String : null,
    );
  }

  @override
  String toString() => 'CategoriaItemModel(nome: $nome, icone: $icone)';
}
