import 'package:flutter/material.dart';
import 'package:go/core/errors/exceptions.dart';

class CoreUtils {
  const CoreUtils._();

  static bool containsRequiredKeys(
      Map<String, dynamic> map, List<String> requiredKeys) {
    return requiredKeys.every((key) => map.containsKey(key));
  }

  static throwsSerializationException(
      {required Map<String, dynamic> map, required List<String> requiredKeys}) {
    if (!containsRequiredKeys(map, requiredKeys)) {
      throw SerializationException(
        error:
            'One or more required fields are missing: ${requiredKeys.where((key) => !map.containsKey(key)).join(', ')}.',
      );
    }
  }

  static void openModal({
    required BuildContext context,
    required Widget child,
    void Function()? action,
  }) async {
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => child,
    );
  }
}
