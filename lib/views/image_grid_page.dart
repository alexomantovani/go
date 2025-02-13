import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../core/services/styles.dart';

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
        itemBuilder: (context, index) => CachedNetworkImage(
          imageUrl: photos![index],
        ),
      ),
    );
  }
}
