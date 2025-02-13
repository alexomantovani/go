import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';

import '../../models/motel_model.dart';

class SliderDots extends StatelessWidget {
  const SliderDots({
    super.key,
    required this.motels,
    required CarouselSliderController controller,
    required int current,
  })  : _controller = controller,
        _current = current;

  final List<MotelModel>? motels;
  final CarouselSliderController _controller;
  final int _current;

  @override
  Widget build(BuildContext context) {
    return motels != null
        ? Wrap(
            children: motels!.asMap().entries.map(
              (entry) {
                return GestureDetector(
                  onTap: () => _controller.animateToPage(entry.key,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut),
                  child: Container(
                    width: 10.0,
                    height: 10.0,
                    margin: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black)
                          .withValues(
                              alpha: _current == entry.key ? 0.75 : 0.4),
                    ),
                  ),
                );
              },
            ).toList(),
          )
        : SizedBox.shrink();
  }
}
