import 'package:flutter/material.dart';

import '../../core/extensions/context_ext.dart';
import '../../core/services/styles.dart';

class MotelDetailsBody extends StatelessWidget {
  const MotelDetailsBody({
    super.key,
    required this.lowestPrice,
    required this.discount,
  });

  final double lowestPrice;
  final double discount;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Styles.kSecondaryPale,
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 8.0),
            Column(
              children: [
                Text(
                  '${discount == 0 ? '0' : discount.toString().substring(0, 2)}% de desconto',
                  style: context.textTheme.titleSmall!.copyWith(
                    decoration: TextDecoration.underline,
                    color: Styles.kPrimaryText,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6.0),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 6.0),
                  decoration: BoxDecoration(
                    color: Styles.kStandardWhite,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  height: 2.0,
                ),
              ],
            ),
            Text(
              'a partir de R\$$lowestPrice',
              style: context.textTheme.bodySmall!.copyWith(fontSize: 11),
            ),
            const SizedBox(height: 8.0),
            Container(
              decoration: BoxDecoration(
                color: Styles.kPrimaryGreen,
                borderRadius: BorderRadius.circular(6.0),
              ),
              padding: EdgeInsets.symmetric(vertical: 7.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'reservar',
                    style: TextTheme.of(context).bodySmall!.copyWith(
                          color: Styles.kStandardWhite,
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Styles.kStandardWhite,
                    size: 12,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
