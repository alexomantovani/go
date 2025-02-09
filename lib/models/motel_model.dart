import 'package:go/core/enums/model_type.dart';
import 'package:go/core/errors/exceptions.dart';
import 'package:go/core/utils/constants.dart';
import 'package:go/core/utils/core_utils.dart';
import 'package:go/entities/motel.dart';
import 'package:go/models/suite_model.dart';

class MotelModel extends Motel {
  const MotelModel({
    super.fantasia,
    super.logo,
    super.bairro,
    super.distancia,
    super.qtdFavoritos,
    super.suites,
    super.qtdAvaliacoes,
    super.media,
  });

  const MotelModel.empty()
      : this(
          fantasia: '',
          logo: '',
          bairro: '',
          distancia: 0,
          qtdFavoritos: 0,
          suites: null,
          qtdAvaliacoes: 0,
          media: 0,
        );

  factory MotelModel.fromEntity(Motel motel) {
    return MotelModel(
      fantasia: motel.fantasia,
      logo: motel.logo,
      bairro: motel.bairro,
      distancia: motel.distancia,
      qtdFavoritos: motel.qtdFavoritos,
      suites: motel.suites,
      qtdAvaliacoes: motel.qtdAvaliacoes,
      media: motel.media,
    );
  }

  Motel toEntity() {
    return Motel(
      fantasia: fantasia,
      logo: logo,
      bairro: bairro,
      distancia: distancia,
      qtdFavoritos: qtdFavoritos,
      suites: suites,
      qtdAvaliacoes: qtdAvaliacoes,
      media: media,
    );
  }

  MotelModel copyWith({
    String? fantasia,
    String? logo,
    String? bairro,
    double? distancia,
    int? qtdFavoritos,
    List<SuiteModel>? suites,
    int? qtdAvaliacoes,
    double? media,
  }) {
    return MotelModel(
      fantasia: fantasia ?? this.fantasia,
      logo: logo ?? this.logo,
      bairro: bairro ?? this.bairro,
      distancia: distancia ?? this.distancia,
      qtdFavoritos: qtdFavoritos ?? this.qtdFavoritos,
      suites: suites ?? this.suites,
      qtdAvaliacoes: qtdAvaliacoes ?? this.qtdAvaliacoes,
      media: media ?? this.media,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'fantasia': fantasia,
      'logo': logo,
      'bairro': bairro,
      'distancia': distancia,
      'qtdFavoritos': qtdFavoritos,
      'suites': suites,
      'qtdAvaliacoes': qtdAvaliacoes,
      'media': media,
    };
  }

  factory MotelModel.fromMap(Map<String, dynamic> map) {
    try {
      CoreUtils.throwsSerializationException(
        map: map,
        requiredKeys: Constants.objectKeysList[ModelType.motel.name],
      );

      return MotelModel(
        fantasia: map['fantasia'] != null ? map['fantasia'] as String : null,
        logo: map['logo'] != null ? map['logo'] as String : null,
        bairro: map['bairro'] != null ? map['bairro'] as String : null,
        distancia: map['distancia'] != null
            ? (map['distancia'] as num?)?.toDouble()
            : null,
        qtdFavoritos:
            map['qtdFavoritos'] != null ? map['qtdFavoritos'] as int : null,
        suites: map['suites'] != null
            ? (map['suites'] as List<dynamic>)
                .map((suite) =>
                    SuiteModel.fromMap(suite as Map<String, dynamic>))
                .toList()
            : null,
        qtdAvaliacoes:
            map['qtdAvaliacoes'] != null ? map['qtdAvaliacoes'] as int : null,
        media: map['media'] != null ? (map['media'] as num?)?.toDouble() : null,
      );
    } catch (e) {
      throw SerializationException(
        error: e.toString(),
      );
    }
  }

  @override
  String toString() {
    return 'MotelModel(fantasia: $fantasia, logo: $logo, bairro: $bairro, distancia: $distancia, qtdFavoritos: $qtdFavoritos, suites: $suites, qtdAvaliacoes: $qtdAvaliacoes, media: $media)';
  }
}
