import 'package:go/core/utils/typedefs.dart';

class Constants {
  const Constants._();

  static const DataMap objectKeysList = {
    'categoriaItem': ['nome', 'icone'],
    'desconto': ['desconto'],
    'item': ['nome'],
    'motel': [
      'fantasia',
      'logo',
      'bairro',
      'distancia',
      'qtdFavoritos',
      'suites',
      'qtdAvaliacoes',
      'media',
    ],
    'periodo': [
      'tempoFormatado',
      'tempo',
      'valor',
      'valorTotal',
      'temCortesia',
      'desconto',
    ],
    'suite': [
      'nome',
      'qtd',
      'exibirQtdDisponiveis',
      'fotos',
      'itens',
      'categoriaItens',
      'periodos',
    ],
  };
}
