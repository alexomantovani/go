import 'package:equatable/equatable.dart';

import 'package:go/entities/desconto.dart';

class Periodo extends Equatable {
  final String? tempoFormatado;
  final String? tempo;
  final double? valor;
  final double? valorTotal;
  final bool? temCortesia;
  final Desconto? desconto;

  const Periodo({
    this.tempoFormatado,
    this.tempo,
    this.valor,
    this.valorTotal,
    this.temCortesia,
    this.desconto,
  });

  Periodo.empty()
      : this(
          tempoFormatado: '',
          tempo: '',
          valor: 0,
          valorTotal: 0,
          temCortesia: false,
          desconto: Desconto.empty(),
        );

  @override
  String toString() {
    return 'Periodo(tempoFormatado: $tempoFormatado)';
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'tempoFormatado': tempoFormatado,
      'tempo': tempo,
      'valor': valor,
      'valorTotal': valorTotal,
      'temCortesia': temCortesia,
      'desconto': desconto,
    };
  }

  @override
  List<Object?> get props =>
      [tempoFormatado, tempo, valor, valorTotal, temCortesia, desconto];
}
