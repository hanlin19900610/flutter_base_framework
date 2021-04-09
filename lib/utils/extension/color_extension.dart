import 'dart:ui';

import 'package:flutter_base_framework/flutter_base_framework.dart';

extension ColorExtension on String {
  Color get c => ColorsUtil.hexToColor(this);
}