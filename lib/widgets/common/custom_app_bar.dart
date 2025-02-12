import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../core/extensions/context_ext.dart';
import '../../core/providers/toggle_provider.dart';
import '../../core/services/assets.dart';
import '../../core/services/styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Styles.kPrimaryRed,
      toolbarHeight: kToolbarHeight * 2.0,
      automaticallyImplyLeading: false,
      centerTitle: true,
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () => context.underConstructionPage,
            icon: SvgPicture.asset(
              Assets.kIcMenu,
              colorFilter:
                  ColorFilter.mode(Styles.kStandardWhite, BlendMode.srcIn),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Styles.kPrimaryRedDark,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: ChangeNotifierProvider(
                  create: (_) => ToggleProvider(),
                  child: Consumer<ToggleProvider>(
                    builder: (context, provider, child) => ToggleButtons(
                      isSelected: [!provider.isSelected, provider.isSelected],
                      onPressed: (index) =>
                          provider.setSelected(!provider.isSelected),
                      borderRadius: BorderRadius.circular(50),
                      color: Styles.kPrimaryRedDark,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: provider.isSelected
                                ? Styles.kStandardWhite
                                : Colors.transparent,
                          ),
                          padding: EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.electric_bolt_rounded,
                                color: !provider.isSelected
                                    ? Styles.kStandardWhite
                                    : Styles.kPrimaryRed,
                              ),
                              Text(
                                'ir agora',
                                style: context.textTheme.titleSmall!.copyWith(
                                    color: !provider.isSelected
                                        ? Styles.kStandardWhite
                                        : Styles.kPrimaryText),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: !provider.isSelected
                                ? Styles.kStandardWhite
                                : Colors.transparent,
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.event_available,
                                color: provider.isSelected
                                    ? Styles.kStandardWhite
                                    : Styles.kPrimaryRed,
                              ),
                              Text(
                                'ir outro dia',
                                style: context.textTheme.titleSmall!.copyWith(
                                  color: provider.isSelected
                                      ? Styles.kStandardWhite
                                      : Styles.kPrimaryText,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () => context.underConstructionPage,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'zona norte',
                      style: context.textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Styles.kStandardWhite,
                        decoration: TextDecoration.underline,
                        decorationColor: Styles.kStandardWhite,
                        decorationStyle: TextDecorationStyle.dashed,
                      ),
                    ),
                    Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: Styles.kStandardWhite,
                    ),
                  ],
                ),
              ),
            ],
          ),
          IconButton(
            onPressed: () => context.underConstructionPage,
            icon: Icon(
              Icons.search_rounded,
              color: Styles.kStandardWhite,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight * 2.0);
}
