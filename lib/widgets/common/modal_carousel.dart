import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/extensions/context_ext.dart';
import '../../core/providers/motel_carousel_provider.dart';
import '../../core/services/styles.dart';

class ModalCarousel extends StatelessWidget {
  const ModalCarousel({
    super.key,
    required this.photos,
  });

  final List<String>? photos;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MotelCarouselProvider(),
      child: Consumer<MotelCarouselProvider>(
        builder: (context, provider, child) => BottomSheet(
          onClosing: () {},
          builder: (context) => Container(
            height: context.height,
            color: Styles.kStandardWhite,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.close_rounded),
                ),
                SizedBox(
                  height: context.height / 2,
                  child: PageView.builder(
                    controller: provider.pageController,
                    scrollDirection: Axis.horizontal,
                    itemCount: photos!.length,
                    onPageChanged: (value) => provider.setPageIndex(value),
                    itemBuilder: (context, index) => CachedNetworkImage(
                      imageUrl: photos![index],
                      width: context.width,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Opacity(
                      opacity: provider.pageIndex > 0 ? 1 : 0,
                      child: IconButton(
                        onPressed: provider.pageIndex > 0
                            ? () => provider.pageController.previousPage(
                                  duration: const Duration(milliseconds: 100),
                                  curve: Curves.easeIn,
                                )
                            : null,
                        icon: Icon(
                          Icons.arrow_back_ios_new_rounded,
                        ),
                      ),
                    ),
                    Text(
                      provider.pageIndex.toString(),
                    ),
                    Opacity(
                      opacity: provider.pageIndex < photos!.length - 1 ? 1 : 0,
                      child: IconButton(
                        onPressed: provider.pageIndex < photos!.length - 1
                            ? () => provider.pageController.nextPage(
                                  duration: Duration(milliseconds: 100),
                                  curve: Curves.easeIn,
                                )
                            : null,
                        icon: Icon(
                          Icons.arrow_forward_ios_rounded,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
