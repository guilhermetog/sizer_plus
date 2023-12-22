import 'package:flutter/material.dart';

class MediaQuerySize {
  late Size size;
  late EdgeInsets padding;
  static MediaQuerySize? _instance;
  MediaQuerySize._();
  factory MediaQuerySize(BuildContext context) {
    if (_instance == null) {
      _instance = MediaQuerySize._();
      _instance!.calculateSizes(context);
    }
    return _instance!;
  }

  calculateSizes(BuildContext context) {
    MediaQueryData media = MediaQuery.of(context);
    size = media.size;
    padding = media.padding;
  }
}
