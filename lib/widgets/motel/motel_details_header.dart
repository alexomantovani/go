import 'package:flutter/material.dart';
import 'package:go/core/providers/motel_carousel_provider.dart';
import 'package:go/widgets/motel/motel_details_body.dart';

import '../../core/extensions/context_ext.dart';
import '../../core/services/styles.dart';

class MotelDetailsHeader extends StatelessWidget {
  const MotelDetailsHeader({super.key, required this.provider});

  final MotelCarouselProvider provider;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.local_fire_department,
                color: Colors.orange,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    provider.motel!.fantasia ?? '',
                    style: context.textTheme.titleSmall!.copyWith(
                      color: Styles.kPrimaryText,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    provider.motel!.bairro ?? '',
                    style: TextTheme.of(context)
                        .bodySmall!
                        .copyWith(fontSize: 10.0),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          MotelDetailsBody(
            lowestPrice: provider.lowestPrice!,
            discount: provider.discount!,
          ),
        ],
      ),
    );
  }
}
