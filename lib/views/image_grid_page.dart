import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../core/services/styles.dart';
import '../core/utils/core_utils.dart';
import '../widgets/common/modal_carousel.dart';

class ImageGridPage extends StatelessWidget {
  const ImageGridPage({super.key, required this.photos});

  final List<String>? photos;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.kStandardWhite,
      appBar: AppBar(
        backgroundColor: Styles.kStandardWhite,
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12.0,
        ),
        itemCount: photos!.length,
        itemBuilder: (context, index) => GestureDetector(
          key: ValueKey('image_grid_item_$index'),
          behavior: HitTestBehavior.opaque,
          onTap: () => CoreUtils.openModal(
            context: context,
            child: ModalCarousel(
              photos: photos,
            ),
          ),
          child: CachedNetworkImage(
            imageUrl: photos![index],
          ),
        ),
      ),
    );
  }
}
