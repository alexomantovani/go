import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';

import '../../models/motel_model.dart';
import '../../core/services/styles.dart';
import '../motel/motel_carousel.dart';
import '../suite/suite_list_view.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
    required this.pageController,
    required this.carouselSliderController,
    required this.motels,
  });

  final PageController pageController;
  final CarouselSliderController carouselSliderController;
  final List<MotelModel> motels;

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
      child: SingleChildScrollView(
        child: SizedBox(
          height: double.maxFinite,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              MotelCarousel(
                motels: motels,
                pageController: pageController,
                carouselSliderController: carouselSliderController,
              ),
              SuiteListView(
                motels: motels,
                pageController: pageController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
