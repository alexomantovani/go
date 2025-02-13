import 'package:flutter/material.dart';

import '../../core/extensions/context_ext.dart';
import '../../core/services/styles.dart';

class CustomFloatingButton extends StatelessWidget {
  const CustomFloatingButton({
    super.key,
    this.label = 'mapa',
    this.iconData = Icons.map_outlined,
    required this.onPressed,
  });

  final void Function()? onPressed;
  final String label;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      padding: EdgeInsets.only(bottom: 20.0),
      child: FloatingActionButton(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        backgroundColor: Styles.kStandardWhite,
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconData,
                color: Styles.kPrimaryRed,
              ),
              Text(label, style: context.textTheme.titleMedium),
            ],
          ),
        ),
      ),
    );
  }
}
