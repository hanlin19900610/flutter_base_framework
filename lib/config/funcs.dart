import 'package:flutter/material.dart';
import 'package:flutter_base_framework/flutter_base_framework.dart';

///去掉 scroll view的 水印  e.g : listView scrollView
///当滑动到顶部或者底部时，继续拖动出现的蓝色水印
Widget getNoInkWellListView({required Widget scrollView}) {
  return ScrollConfiguration(
    behavior: OverScrollBehavior(),
    child: scrollView,
  );
}