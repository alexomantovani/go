import 'package:go/core/errors/serialization_error.dart';

class CoreUtils {
  const CoreUtils._();

  static bool containsRequiredKeys(
      Map<String, dynamic> map, List<String> requiredKeys) {
    return requiredKeys.every((key) => map.containsKey(key));
  }

  static throwsSerializationError(
      {required Map<String, dynamic> map, required List<String> requiredKeys}) {
    if (containsRequiredKeys(map, requiredKeys)) {
      throw SerializationError(
        message: 'Missing required field(s) in the map.',
        error:
            'One or more required fields are missing: tempoFormatado, tempo, valor, valorTotal, temCortesia, desconto.',
      );
    }
  }
}
