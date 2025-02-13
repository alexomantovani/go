import 'package:flutter/material.dart';

import '../../core/extensions/context_ext.dart';
import '../../core/services/styles.dart';

class ErrorMessageWidget extends StatelessWidget {
  const ErrorMessageWidget({
    super.key,
    required this.error,
  });

  final String error;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Styles.kPrimaryPale,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              error,
              style: context.textTheme.titleLarge!.copyWith(
                color: Styles.kPrimaryText,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
