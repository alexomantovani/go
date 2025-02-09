import 'package:go/core/enums/model_type.dart';
import 'package:go/core/errors/exceptions.dart';
import 'package:go/core/utils/constants.dart';
import 'package:go/core/utils/core_utils.dart';
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
    try {
      CoreUtils.throwsSerializationException(
        map: map,
        requiredKeys: Constants.objectKeysList[ModelType.desconto.name],
      );

      return DescontoModel(
        desconto: map['desconto'] != null
            ? (map['desconto'] as num?)?.toDouble()
            : null,
      );
    } catch (e) {
      throw SerializationException(
        error: e.toString(),
      );
    }
  }

  @override
  String toString() => 'DescontoModel(desconto: $desconto)';
}
