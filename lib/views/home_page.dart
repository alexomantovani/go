import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/extensions/context_ext.dart';
import '../bloc/motel_bloc.dart';
import '../core/services/styles.dart';
import '../widgets/common/custom_app_bar.dart';
import '../widgets/common/custom_floating_button.dart';
import '../widgets/common/home_body.dart';
import '../widgets/common/loading_widget.dart';
import '../widgets/motel/error_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController(viewportFraction: 0.9);
  final CarouselSliderController _carouselSliderController =
      CarouselSliderController();

  @override
  void initState() {
    BlocProvider.of<MotelBloc>(context).add(GetMotels());
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.kPrimaryRed,
      appBar: CustomAppBar(),
      body: BlocBuilder<MotelBloc, MotelState>(
        builder: (context, state) {
          if (state is MotelLoading) {
            return LoadingWidget();
          } else if (state is MotelError) {
            return ErrorMessageWidget(error: state.message);
          } else if (state is MotelLoaded) {
            return HomeBody(
              motels: state.motels,
              pageController: _pageController,
              carouselSliderController: _carouselSliderController,
            );
          } else {
            return SizedBox.shrink();
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CustomFloatingButton(
        onPressed: () => context.underConstructionPage,
      ),
    );
  }
}
