import 'package:flutter/material.dart';
import 'package:go/core/extensions/context_ext.dart';
import 'package:go/core/services/assets.dart';
import 'package:go/core/services/styles.dart';

class AuthenticationPage extends StatelessWidget {
  const AuthenticationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.kPrimaryPale,
      appBar: AppBar(
        backgroundColor: Styles.kPrimaryPale,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            margin: EdgeInsets.only(left: 12.0),
            decoration: BoxDecoration(
              color: Styles.kStandardWhite,
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.close_rounded),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                Assets.kLogoImage,
                fit: BoxFit.scaleDown,
                scale: 1.2,
              ),
              SizedBox(height: context.height * 0.3),
              Column(
                children: [
                  Container(
                    key: const Key('kPrimaryRed_container'),
                    decoration: BoxDecoration(
                      color: Styles.kPrimaryRed,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Text(
                          'continuar com email cadastrado',
                          style: context.textTheme.titleMedium!.copyWith(
                            color: Styles.kStandardWhite,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'para usuários guia de motéis go, bons de cama ou guia de motéis',
                          style: context.textTheme.titleSmall!.copyWith(
                            color: Styles.kStandardWhite,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Container(
                    key: const Key('kPrimaryAuthCard_container'),
                    decoration: BoxDecoration(
                      color: Styles.kPrimaryAuthCard,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Text(
                          'fazer novo cadastro',
                          style: context.textTheme.titleMedium!.copyWith(
                            color: Styles.kStandardWhite,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'é de graça e fica pronto em menos de 1 minuto!',
                          style: context.textTheme.titleSmall!.copyWith(
                            color: Styles.kStandardWhite,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
