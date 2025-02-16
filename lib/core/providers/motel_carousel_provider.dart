import 'package:flutter/material.dart';
import 'package:go/models/motel_model.dart';
import 'package:go/models/periodo_model.dart';
import 'package:go/models/suite_model.dart';

class MotelCarouselProvider extends ChangeNotifier {
  int _current = 0;
  int get current => _current;

  final PageController _pageController = PageController();
  PageController get pageController => _pageController;

  int _pageIndex = 0;
  int get pageIndex => _pageIndex;

  MotelModel? _motel;
  MotelModel? get motel => _motel;

  SuiteModel? _suite;
  SuiteModel? get suite => _suite;

  String? _lastSuiteFirstPhoto;
  String? get lastSuiteFirstPhoto => _lastSuiteFirstPhoto;

  double? _discount;
  double? get discount => _discount;

  double? _lowestPrice;
  double? get lowestPrice => _lowestPrice;

  void setCurrent(int index) {
    _current = index;
    notifyListeners();
  }

  void setPageIndex(int index) {
    _pageIndex = index;
    notifyListeners();
  }

  void setMotelCarouselItemInfo({required MotelModel motel}) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _motel = motel;
      setLastSuiteFirstPhoto();
      setDiscount();
      setLowestPrice();
      notifyListeners();
    });
  }

  void setLastSuiteFirstPhoto() {
    final lastSuite =
        _motel?.suites?.isNotEmpty == true ? _motel!.suites!.last : null;
    _lastSuiteFirstPhoto =
        lastSuite?.fotos?.isNotEmpty == true ? lastSuite!.fotos!.first : null;
  }

  void setDiscount() {
    _discount = _motel!.suites
        ?.expand((suite) => suite.periodos ?? <PeriodoModel>[])
        .where((p) => p.desconto != null)
        .map((p) => p.desconto!.desconto)
        .firstOrNull;
  }

  void setLowestPrice() {
    _lowestPrice = _motel!.suites
                ?.expand((suite) => suite.periodos ?? <PeriodoModel>[])
                .where((p) => p.valorTotal != null)
                .map((p) => p.valorTotal)
                .isNotEmpty ==
            true
        ? _motel!.suites!
            .expand((suite) => suite.periodos ?? <PeriodoModel>[])
            .where((p) => p.valorTotal != null)
            .map((p) => p.valorTotal)
            .reduce((a, b) => (a! < b!) ? a : b)
        : null;
  }
}
