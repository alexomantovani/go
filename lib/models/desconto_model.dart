import 'package:go/entities/desconto.dart';

class DescontoModel extends Desconto {
  const DescontoModel({
    super.desconto,
  });

  const DescontoModel.empty() : this(desconto: 0.0);

  factory DescontoModel.fromEntity(Desconto desconto) {
    return DescontoModel(desconto: desconto.desconto);
  }

  Desconto toEntity() {
    return Desconto(desconto: desconto);
  }

  DescontoModel copyWith({
    double? desconto,
  }) {
    return DescontoModel(
      desconto: desconto ?? this.desconto,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'desconto': desconto,
    };
  }

  factory DescontoModel.fromMap(Map<String, dynamic> map) {
    if (!map.containsKey('desconto')) {
      throw Error();
    }
    return DescontoModel(
      desconto: map['desconto'] != null ? map['desconto'] as double : null,
    );
  }

  @override
  String toString() => 'DescontoModel(desconto: $desconto)';
}
