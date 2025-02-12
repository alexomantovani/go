import 'package:flutter/material.dart';

import '../../core/extensions/context_ext.dart';
import '../../core/services/styles.dart';
import '../../models/motel_model.dart';

class MotelCarouselItem extends StatelessWidget {
  const MotelCarouselItem({
    super.key,
    required this.motel,
  });

  final MotelModel motel;

  @override
  Widget build(BuildContext context) {
    final lastSuite =
        motel.suites?.isNotEmpty == true ? motel.suites!.last : null;
    final firstPhoto =
        lastSuite?.fotos?.isNotEmpty == true ? lastSuite!.fotos!.first : null;

    if (firstPhoto == null) {
      return SizedBox.shrink();
    }

    return Row(
      children: [
        Expanded(
          flex: 5,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: NetworkImage(firstPhoto),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 6,
          child: _buildMotelDetails(context, motel),
        ),
      ],
    );
  }

  Widget _buildMotelDetails(BuildContext context, MotelModel motel) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.local_fire_department,
                  color: Colors.orange,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        motel.fantasia ?? '',
                        style: context.textTheme.titleSmall!.copyWith(
                          color: Styles.kPrimaryText,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        motel.bairro ?? '',
                        style: TextTheme.of(context).bodySmall,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          _buildPriceInfo(motel, context),
        ],
      ),
    );
  }

  Widget _buildPriceInfo(MotelModel motel, BuildContext context) {
    final desconto = motel.suites
        ?.expand((suite) => suite.periodos ?? [])
        .where((p) => p.desconto != null)
        .map((p) => p.desconto!.desconto)
        .firstOrNull;

    final menorPreco = motel.suites
        ?.expand((suite) => suite.periodos ?? [])
        .where((p) => p.valorTotal != null)
        .map((p) => p.valorTotal)
        .reduce((a, b) => (a! < b!) ? a : b);

    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Styles.kPrimaryPale,
          borderRadius: BorderRadius.circular(6.0),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              motel.suites!
                  .map(
                    (suite) => Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '$desconto% de desconto',
                          style: context.textTheme.titleSmall!.copyWith(
                            decoration: TextDecoration.underline,
                            color: Styles.kPrimaryText,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 6.0),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 6.0),
                          decoration: BoxDecoration(
                            color: Styles.kStandardWhite,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          height: 2.0,
                        ),
                      ],
                    ),
                  )
                  .whereType()
                  .first,
              motel.suites!
                  .map(
                    (suite) => suite.periodos!.isEmpty
                        ? null
                        : Text(
                            'a partir de R\$$menorPreco',
                            style: TextTheme.of(context).bodySmall!,
                          ),
                  )
                  .whereType<Text>()
                  .first,
              Container(
                decoration: BoxDecoration(
                  color: Styles.kPrimaryGreen,
                  borderRadius: BorderRadius.circular(6.0),
                ),
                padding: EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'reservar',
                      style: TextTheme.of(context).bodyMedium!.copyWith(
                            color: Styles.kStandardWhite,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Styles.kStandardWhite,
                      size: 16,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
