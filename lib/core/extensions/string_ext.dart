extension StringExt on String {
  String get suiteName {
    int index = indexOf("s/");
    return index != -1 ? substring(0, index).trim() : this;
  }
}
