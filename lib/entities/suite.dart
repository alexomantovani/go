import 'package:equatable/equatable.dart';
import 'package:go/entities/categoria_item.dart';
import 'package:go/entities/item.dart';
import 'package:go/entities/periodo.dart';

class Suite extends Equatable {
  final String? nome;
  final int? qtd;
  final bool? exibirQtdDisponiveis;
  final List<String>? fotos;
  final List<Item>? itens;
  final List<CategoriaItem>? categoriaItens;
  final List<Periodo>? periodos;

  const Suite({
    this.nome,
    this.qtd,
    this.exibirQtdDisponiveis,
    this.fotos,
    this.itens,
    this.categoriaItens,
    this.periodos,
  });

  Suite.empty()
      : this(
          nome: '',
          qtd: 0,
          exibirQtdDisponiveis: false,
          fotos: [''],
          itens: [Item.empty()],
          categoriaItens: [CategoriaItem.empty()],
          periodos: [Periodo.empty()],
        );

  @override
  String toString() {
    return 'Motel(nome: $nome, qtd: $qtd, exibirQtdDisponiveis: $exibirQtdDisponiveis, fotos: $fotos, itens: $itens, categoriaItens: $categoriaItens, periodos: $periodos)';
  }

  @override
  List<Object?> get props => [
        nome,
        qtd,
        exibirQtdDisponiveis,
        fotos,
        itens,
        categoriaItens,
        periodos,
      ];
}
