import 'package:equatable/equatable.dart';
import 'package:go/entities/suite.dart';

class Motel extends Equatable {
  final String? fantasia;
  final String? logo;
  final String? bairro;
  final double? distancia;
  final int? qtdFavoritos;
  final List<Suite>? suites;
  final int? qtdAvaliacoes;
  final double? media;

  const Motel({
    this.fantasia,
    this.logo,
    this.bairro,
    this.distancia,
    this.qtdFavoritos,
    this.suites,
    this.qtdAvaliacoes,
    this.media,
  });

  const Motel.empty()
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

  @override
  String toString() {
    return 'Motel(fantasia: $fantasia, logo: $logo, bairro: $bairro, distancia: $distancia, qtdFavoritos: $qtdFavoritos, suites: $suites, qtdAvaliacoes: $qtdAvaliacoes, media: $media)';
  }

  @override
  List<Object?> get props => [
        fantasia,
        logo,
        bairro,
        distancia,
        qtdFavoritos,
        suites,
        qtdAvaliacoes,
        media
      ];
}
