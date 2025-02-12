import 'package:flutter/material.dart';

import '../core/services/assets.dart';
import '../core/services/styles.dart';

class UnderConstructionPage extends StatelessWidget {
  const UnderConstructionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Styles.kStandardWhite,
      ),
      backgroundColor: Styles.kStandardWhite,
      body: Center(
        child: Image.asset(Assets.kUnderConstructionImage),
      ),
    );
  }
}
