import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../core/extensions/context_ext.dart';
import '../../core/services/styles.dart';
import '../../entities/categoria_item.dart';

class SuiteCateogoryItem extends StatelessWidget {
  const SuiteCateogoryItem({
    super.key,
    required this.categoriaItens,
  });

  final List<CategoriaItem>? categoriaItens;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Styles.kStandardWhite,
        borderRadius: BorderRadius.circular(6.0),
      ),
      padding: EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: List.generate(
              categoriaItens!.length,
              (index) => index <= 3
                  ? CachedNetworkImage(
                      imageUrl: categoriaItens![index].icone!,
                      height: 26,
                    )
                  : const SizedBox.shrink(),
            ),
          ),
          Row(
            children: [
              Text(
                'ver todos',
                style: context.textTheme.bodySmall,
              ),
              Icon(
                Icons.keyboard_arrow_down_rounded,
                size: 16,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
