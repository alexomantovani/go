import 'package:go/core/errors/serialization_error.dart';
import 'package:go/entities/periodo.dart';
import 'package:go/models/desconto_model.dart';

class PeriodoModel extends Periodo {
  const PeriodoModel({
    super.tempoFormatado,
    super.tempo,
    super.valor,
    super.valorTotal,
    super.temCortesia,
    super.desconto,
  });

  const PeriodoModel.empty()
      : this(
          tempoFormatado: '',
          tempo: '',
          valor: 0,
          valorTotal: 0,
          temCortesia: false,
          desconto: null,
        );

  factory PeriodoModel.fromEntity(Periodo periodo) {
    return PeriodoModel(
      tempoFormatado: periodo.tempoFormatado,
      tempo: periodo.tempo,
      valor: periodo.valor,
      valorTotal: periodo.valorTotal,
      temCortesia: periodo.temCortesia,
      desconto: periodo.desconto,
    );
  }

  Periodo toEntity() {
    return Periodo(
      tempoFormatado: tempoFormatado,
      tempo: tempo,
      valor: valor,
      valorTotal: valorTotal,
      temCortesia: temCortesia,
      desconto: desconto,
    );
  }

  PeriodoModel copyWith({
    String? tempoFormatado,
    String? tempo,
    double? valor,
    double? valorTotal,
    bool? temCortesia,
    DescontoModel? desconto,
  }) {
    return PeriodoModel(
      tempoFormatado: tempoFormatado ?? this.tempoFormatado,
      tempo: tempo ?? this.tempo,
      valor: valor ?? this.valor,
      valorTotal: valorTotal ?? this.valorTotal,
      temCortesia: temCortesia ?? this.temCortesia,
      desconto: desconto ?? this.desconto,
    );
  }

  @override
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

  factory PeriodoModel.fromMap(Map<String, dynamic> map) {
    try {
      if (!map.containsKey('tempoFormatado') ||
          !map.containsKey('tempo') ||
          !map.containsKey('valor') ||
          !map.containsKey('valorTotal') ||
          !map.containsKey('temCortesia') ||
          !map.containsKey('desconto')) {
        throw SerializationError(
          message: 'Missing required field(s) in the map.',
          error:
              'One or more required fields are missing: tempoFormatado, tempo, valor, valorTotal, temCortesia, desconto.',
        );
      }

      return PeriodoModel(
        tempoFormatado: map['tempoFormatado'] as String? ?? '',
        tempo: map['tempo'] as String? ?? '',
        valor: map['valor'] as double? ?? 0.0,
        valorTotal: map['valorTotal'] as double? ?? 0.0,
        temCortesia: map['temCortesia'] as bool? ?? false,
        desconto: map['desconto'] != null
            ? DescontoModel.fromMap(map['desconto'] as Map<String, dynamic>)
            : null,
      );
    } catch (e) {
      throw SerializationError(
        message: 'Error deserializing PeriodoModel from map.',
        error: e.toString(),
      );
    }
  }

  @override
  String toString() {
    return 'PeriodoModel(tempoFormatado: $tempoFormatado, tempo: $tempo, valor: $valor, valorTotal: $valorTotal, temCortesia: $temCortesia, desconto: $desconto)';
  }
}
