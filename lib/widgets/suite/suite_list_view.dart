import 'package:flutter/material.dart';

import '../../core/extensions/context_ext.dart';
import '../../core/services/styles.dart';
import '../../models/motel_model.dart';
import '../../models/periodo_model.dart';
import '../../models/suite_model.dart';
import '../../views/category_item_page.dart';
import '../../views/image_grid_page.dart';
import 'suite_category_item.dart';
import 'suite_display.dart';
import 'suite_header.dart';
import 'suite_periodos.dart';

class SuiteListView extends StatelessWidget {
  const SuiteListView({
    super.key,
    required this.motels,
    required this.pageController,
  });

  final List<MotelModel> motels;
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.only(top: 10.0),
      itemCount: motels.length,
      itemBuilder: (context, index) => Container(
        margin: EdgeInsets.only(top: 20.0),
        decoration: BoxDecoration(
          color: Styles.kSecondaryPale,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24.0),
            topRight: Radius.circular(24.0),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SuiteHeader(motel: motels[index]),
            SizedBox(
              height: context.height * 0.75,
              child: PageView.builder(
                controller: pageController,
                scrollDirection: Axis.horizontal,
                itemCount: motels[index].suites!.length,
                itemBuilder: (context, secondaryIndex) => Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () =>
                            Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ImageGridPage(
                            photos: motels[index].suites![secondaryIndex].fotos,
                          ),
                        )),
                        child: SuiteDisplay(
                          image: motels[index]
                              .suites![secondaryIndex]
                              .fotos!
                              .first,
                          name: motels[index].suites![secondaryIndex].nome,
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      GestureDetector(
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => CategoryItemPage(
                              suite: motels[index]
                                  .suites!
                                  .map((suite) => SuiteModel.fromEntity(suite))
                                  .toList()[secondaryIndex],
                            ),
                          ),
                        ),
                        child: SuiteCateogoryItem(
                          categoriaItens: motels[index]
                              .suites![secondaryIndex]
                              .categoriaItens,
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      SuitePeriodos(
                        periodos: motels[index]
                            .suites![secondaryIndex]
                            .periodos!
                            .map((periodo) => PeriodoModel.fromEntity(periodo))
                            .toList(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
