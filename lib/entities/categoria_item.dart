import 'package:equatable/equatable.dart';

class CategoriaItem extends Equatable {
  final String? nome;
  final String? icone;

  const CategoriaItem({this.nome, this.icone});

  const CategoriaItem.empty() : this(nome: '', icone: '');

  @override
  String toString() {
    return 'CategoriaItem(nome: $nome, icone: $icone)';
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nome': nome,
      'icone': icone,
    };
  }

  @override
  List<Object?> get props => [nome, icone];
}
