import 'package:flutter/material.dart';

import '../core/extensions/context_ext.dart';
import '../core/services/styles.dart';
import '../models/suite_model.dart';

class CategoryItemPage extends StatelessWidget {
  const CategoryItemPage({super.key, required this.suite});

  final SuiteModel suite;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.kStandardWhite,
      appBar: AppBar(
        backgroundColor: Styles.kStandardWhite,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 50.0),
            child: Text(
              suite.nome!,
              style: context.textTheme.titleLarge!
                  .copyWith(color: Styles.kPrimaryText),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30.0),
            child: Text(
              'principais itens',
              style: context.textTheme.titleLarge!.copyWith(
                color: Styles.kPrimaryText,
              ),
            ),
          ),
          Wrap(
            spacing: 8.0,
            runSpacing: 4.0,
            children: suite.categoriaItens!
                .map(
                  (item) => Wrap(
                    children: [
                      Image.network(
                        item.icone!,
                        height: 25.0,
                      ),
                      Text(
                        item.nome!,
                      ),
                    ],
                  ),
                )
                .toList(),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 30.0, horizontal: 30.0),
            child: Text(
              'tem também',
              style: context.textTheme.titleLarge!
                  .copyWith(color: Styles.kPrimaryText),
            ),
          ),
          Wrap(
            spacing: 8.0,
            runSpacing: 4.0,
            children: suite.itens!
                .map(
                  (item) => Padding(
                    padding: const EdgeInsets.only(
                      left: 12.0,
                    ),
                    child: Text('${item.nome!},'),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
