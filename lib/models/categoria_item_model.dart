import 'package:go/core/enums/model_type.dart';
import 'package:go/core/errors/exceptions.dart';
import 'package:go/core/utils/constants.dart';
import 'package:go/core/utils/core_utils.dart';
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
    try {
      CoreUtils.throwsSerializationException(
        map: map,
        requiredKeys: Constants.objectKeysList[ModelType.categoriaItem.name],
      );

      return CategoriaItemModel(
        nome: map['nome'] != null ? map['nome'] as String : null,
        icone: map['icone'] != null ? map['icone'] as String : null,
      );
    } catch (e) {
      throw SerializationException(
        error: e.toString(),
      );
    }
  }

  @override
  String toString() => 'CategoriaItemModel(nome: $nome, icone: $icone)';
}
