import 'package:go/entities/suite.dart';
import 'package:go/models/categoria_item_model.dart';
import 'package:go/models/item_model.dart';
import 'package:go/models/periodo_model.dart';

class SuiteModel extends Suite {
  const SuiteModel({
    super.nome,
    super.qtd,
    super.exibirQtdDisponiveis,
    super.fotos,
    super.itens,
    super.categoriaItens,
    super.periodos,
  });

  SuiteModel.empty()
      : this(
          nome: '',
          qtd: 1,
          exibirQtdDisponiveis: true,
          fotos: [],
          itens: [],
          categoriaItens: [],
          periodos: [],
        );

  factory SuiteModel.fromEntity(Suite suite) {
    return SuiteModel(
      nome: suite.nome,
      qtd: suite.qtd,
      exibirQtdDisponiveis: suite.exibirQtdDisponiveis,
      fotos: suite.fotos,
      itens: suite.itens,
      categoriaItens: suite.categoriaItens,
      periodos: suite.periodos,
    );
  }

  Suite toEntity() {
    return Suite(
      nome: nome,
      qtd: qtd,
      exibirQtdDisponiveis: exibirQtdDisponiveis,
      fotos: fotos,
      itens: itens,
      categoriaItens: categoriaItens,
      periodos: periodos,
    );
  }

  SuiteModel copyWith({
    String? nome,
    int? qtd,
    bool? exibirQtdDisponiveis,
    List<String>? fotos,
    List<ItemModel>? itens,
    List<CategoriaItemModel>? categoriaItens,
    List<PeriodoModel>? periodos,
  }) {
    return SuiteModel(
      nome: nome ?? this.nome,
      qtd: qtd ?? this.qtd,
      exibirQtdDisponiveis: exibirQtdDisponiveis ?? this.exibirQtdDisponiveis,
      fotos: fotos ?? this.fotos,
      itens: itens ?? this.itens,
      categoriaItens: categoriaItens ?? this.categoriaItens,
      periodos: periodos ?? this.periodos,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nome': nome,
      'qtd': qtd,
      'exibirQtdDisponiveis': exibirQtdDisponiveis,
      'fotos': fotos,
      'itens': itens?.map((x) => x.toMap()).toList(),
      'categoriaItens': categoriaItens?.map((x) => x.toMap()).toList(),
      'periodos': periodos?.map((x) => x.toMap()).toList(),
    };
  }

  factory SuiteModel.fromMap(Map<String, dynamic> map) {
    if (!map.containsKey('nome')) {
      throw Error();
    }
    return SuiteModel(
      nome: map['nome'] != null ? map['nome'] as String : null,
      qtd: map['qtd'] != null ? map['qtd'] as int : null,
      exibirQtdDisponiveis: map['exibirQtdDisponiveis'] != null
          ? map['exibirQtdDisponiveis'] as bool
          : null,
      fotos: map['fotos'] != null
          ? (map['fotos'] as List<dynamic>).map((e) => e.toString()).toList()
          : null,
      itens: map['itens'] != null
          ? List<ItemModel>.from(
              (map['itens'] as List<dynamic>).map<ItemModel?>(
                (x) => ItemModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      categoriaItens: map['categoriaItens'] != null
          ? List<CategoriaItemModel>.from(
              (map['categoriaItens'] as List<dynamic>).map<CategoriaItemModel?>(
                (x) => CategoriaItemModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      periodos: map['periodos'] != null
          ? List<PeriodoModel>.from(
              (map['periodos'] as List<dynamic>).map<PeriodoModel?>(
                (x) => PeriodoModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  @override
  String toString() {
    return 'SuiteModel(nome: $nome, qtd: $qtd, exibirQtdDisponiveis: $exibirQtdDisponiveis, fotos: $fotos, itens: $itens, categoriaItens: $categoriaItens, periodos: $periodos)';
  }
}
