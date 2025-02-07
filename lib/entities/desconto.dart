import 'package:equatable/equatable.dart';

class Desconto extends Equatable {
  final double? desconto;

  const Desconto({this.desconto});

  const Desconto.empty() : this(desconto: null);

  @override
  String toString() {
    return 'Item(desconto: $desconto)';
  }

  @override
  List<Object?> get props => [desconto];
}
