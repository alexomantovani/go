import 'package:equatable/equatable.dart';

class Item extends Equatable {
  final String? nome;

  const Item({this.nome});

  const Item.empty() : this(nome: '');

  @override
  String toString() {
    return 'Item(nome: $nome)';
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nome': nome,
    };
  }

  @override
  List<Object?> get props => [nome];
}
