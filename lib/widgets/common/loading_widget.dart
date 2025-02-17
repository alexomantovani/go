import 'package:flutter/material.dart';

import '../../core/extensions/context_ext.dart';
import '../../core/services/styles.dart';
import 'shimmer_loading.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      key: const Key('Container'),
      decoration: BoxDecoration(
        color: Styles.kPrimaryPale,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      padding: EdgeInsets.all(12.0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ShimmerLoading(
                key: const Key('ShimmerLoading_Circle'),
                circle: true,
              ),
              ShimmerLoading(
                key: const Key('ShimmerLoading_Rectangle'),
                height: context.height / 5,
                width: context.width * 0.7,
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 2,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: ShimmerLoading(
                  key: Key('ShimmerLoading_$index'),
                  height: context.height / 3,
                  width: context.width,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
