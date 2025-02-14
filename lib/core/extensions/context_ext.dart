import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/motel_bloc.dart';
import '../../views/under_construction_page.dart';

extension ContextExt on BuildContext {
  TextTheme get textTheme => TextTheme.of(this);

  MediaQueryData get mediaQuery => MediaQuery.of(this);

  Size get size => mediaQuery.size;

  double get width => size.width;

  double get height => size.height;

  MotelBloc get motelBloc => BlocProvider.of<MotelBloc>(this);

  Future<dynamic> get underConstructionPage => Navigator.of(this).push(
        MaterialPageRoute(
          builder: (context) => UnderConstructionPage(),
        ),
      );
}
