import 'package:flutter/material.dart';

import '../../core/extensions/context_ext.dart';
import '../../core/services/styles.dart';
import '../../models/periodo_model.dart';

class SuitePeriodos extends StatelessWidget {
  const SuitePeriodos({
    super.key,
    required this.periodos,
  });

  final List<PeriodoModel>? periodos;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: periodos!.length,
      itemBuilder: (context, index) => Container(
        decoration: BoxDecoration(
          color: Styles.kStandardWhite,
          borderRadius: BorderRadius.circular(6.0),
        ),
        padding: EdgeInsets.all(12.0),
        margin: EdgeInsets.only(bottom: 10.0),
        child: TextButton(
          onPressed: () => context.underConstructionPage,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    periodos![index].tempoFormatado!,
                    style: context.textTheme.bodyMedium,
                  ),
                  Text(
                    'R\$${periodos![index].valorTotal!.toStringAsFixed(2).replaceAll('.', ',')}',
                    style: context.textTheme.bodyMedium,
                  ),
                ],
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
                color: Styles.kPrimaryText,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
