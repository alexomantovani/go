import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/providers/motel_carousel_provider.dart';
import '../../models/motel_model.dart';
import 'motel_details_header.dart';

class MotelCarouselItem extends StatelessWidget {
  const MotelCarouselItem({
    super.key,
    required this.motel,
  });

  final MotelModel motel;

  @override
  Widget build(BuildContext context) {
    return Consumer<MotelCarouselProvider>(
      builder: (context, provider, child) {
        if (provider.lastSuiteFirstPhoto == null) {
          return SizedBox.shrink();
        } else {
          return Row(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: CachedNetworkImage(
                    imageUrl: provider.lastSuiteFirstPhoto!,
                    fit: BoxFit.cover,
                    height: 170,
                  ),
                ),
              ),
              Expanded(
                child: MotelDetailsHeader(provider: provider),
              ),
            ],
          );
        }
      },
    );
  }
}
