import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/providers/motel_carousel_provider.dart';
import '../../core/services/styles.dart';
import '../../models/motel_model.dart';
import '../../views/suite_page.dart';
import 'motel_carousel_item.dart';
import 'slider_dots.dart';

class MotelCarousel extends StatelessWidget {
  const MotelCarousel({
    super.key,
    required this.motels,
    required this.pageController,
    required this.carouselSliderController,
  });

  final List<MotelModel> motels;
  final PageController pageController;
  final CarouselSliderController carouselSliderController;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MotelCarouselProvider(),
      child: Consumer<MotelCarouselProvider>(
        builder: (context, provider, child) => GestureDetector(
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => SuitePage(
                  motel: motels[provider.current],
                  pageController: pageController),
            ),
          ),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Styles.kStandardWhite,
                  borderRadius: BorderRadius.circular(12),
                ),
                height: 220,
                width: double.infinity,
                margin: EdgeInsets.all(12),
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: CarouselSlider.builder(
                  carouselController: carouselSliderController,
                  itemCount: motels.length,
                  itemBuilder: (context, index, realIndex) {
                    return MotelCarouselItem(motel: motels[index]);
                  },
                  options: CarouselOptions(
                    enlargeCenterPage: true,
                    aspectRatio: 2.0,
                    viewportFraction: 1.0,
                    onPageChanged: (index, reason) =>
                        provider.setCurrent(index),
                  ),
                ),
              ),
              SliderDots(
                motels: motels,
                controller: carouselSliderController,
                current: provider.current,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
