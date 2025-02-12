import 'package:flutter/material.dart';

import '../core/extensions/context_ext.dart';
import '../core/services/styles.dart';
import '../models/motel_model.dart';
import '../widgets/suite/suite_list_view.dart';

class SuitePage extends StatelessWidget {
  const SuitePage({
    super.key,
    required this.motel,
    required this.pageController,
  });

  final MotelModel motel;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.kPrimaryRed,
      appBar: AppBar(
        backgroundColor: Styles.kPrimaryRed,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Styles.kStandardWhite,
          ),
        ),
        centerTitle: true,
        title: Text(
          motel.fantasia!,
          style: context.textTheme.titleMedium!.copyWith(
            color: Styles.kStandardWhite,
          ),
        ),
      ),
      body: SuiteListView(
        motels: [motel],
        pageController: pageController,
      ),
    );
  }
}
