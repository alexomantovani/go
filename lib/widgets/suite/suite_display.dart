import 'package:flutter/material.dart';

import '../../core/extensions/string_ext.dart';
import '../../core/services/styles.dart';

class SuiteDisplay extends StatelessWidget {
  const SuiteDisplay({
    super.key,
    required this.image,
    required this.name,
  });

  final String? image;
  final String? name;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Styles.kStandardWhite,
        borderRadius: BorderRadius.circular(6.0),
      ),
      padding: EdgeInsets.all(12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          if (image != null)
            ClipRRect(
              borderRadius: BorderRadius.circular(6.0),
              child: Image.network(
                image!,
              ),
            ),
          Text(name!.suiteName),
        ],
      ),
    );
  }
}
