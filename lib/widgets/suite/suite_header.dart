import 'package:flutter/material.dart';

import '../../core/extensions/context_ext.dart';
import '../../core/services/styles.dart';
import '../../core/utils/core_utils.dart';
import '../../models/motel_model.dart';

class SuiteHeader extends StatelessWidget {
  const SuiteHeader({
    super.key,
    required this.motel,
  });

  final MotelModel motel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.network(
              motel.logo!,
              fit: BoxFit.cover,
              height: 40,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                motel.fantasia!,
                style: context.textTheme.titleLarge!
                    .copyWith(color: Styles.kPrimaryText),
              ),
              const SizedBox(width: 8.0),
              Text(motel.bairro!, style: context.textTheme.bodyMedium!),
              const SizedBox(width: 8.0),
              GestureDetector(
                onTap: () => CoreUtils.openModal(
                  context: context,
                  child: BottomSheet(
                    onClosing: () {},
                    builder: (context) => Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        color: Styles.kSecondaryPale,
                      ),
                      height: context.height * 0.75,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            color: Styles.kStandardWhite,
                            height: context.height / 4,
                            padding: EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'avaliação geral',
                                  style: context.textTheme.titleMedium!
                                      .copyWith(color: Styles.kStandardBlack),
                                ),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            motel.media.toString(),
                                            style: context.textTheme.titleLarge!
                                                .copyWith(
                                                    color:
                                                        Styles.kStandardBlack),
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Styles.kPrimaryYellow,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Styles.kPrimaryYellow,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Styles.kPrimaryYellow,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Styles.kPrimaryYellow,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Styles.kPrimaryGrey,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(motel.qtdAvaliacoes.toString(),
                                              style: context
                                                  .textTheme.titleSmall!),
                                          const SizedBox(width: 8.0),
                                          Text('avaliações',
                                              style: context
                                                  .textTheme.titleSmall!),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Styles.kPrimaryYellow),
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      padding:
                          EdgeInsets.symmetric(vertical: 2.0, horizontal: 6.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Styles.kPrimaryYellow,
                            size: 16,
                          ),
                          Text(
                            motel.media.toString(),
                            style: context.textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    Text(motel.qtdAvaliacoes.toString(),
                        style: context.textTheme.titleSmall!),
                    const SizedBox(width: 8.0),
                    Text('avaliações', style: context.textTheme.titleSmall!),
                    Icon(Icons.keyboard_arrow_down_rounded, size: 12),
                  ],
                ),
              ),
            ],
          ),
          IconButton(
            onPressed: () => context.underConstructionPage,
            icon: Icon(
              Icons.favorite_rounded,
              color: Styles.kPrimaryGrey,
            ),
          ),
        ],
      ),
    );
  }
}
