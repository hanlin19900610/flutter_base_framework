import 'package:flutter_base_framework/flutter_base_framework.dart';

/// 屏幕适配封装
extension SizeExtension on num {

  /// 适配宽高
  num get dp => ScreenUtil.getInstance().getAdapterSize(this.toDouble());

  /// 适配字体
  num get sp => ScreenUtil.getInstance().getAdapterSize(this.toDouble());

  /// 屏幕宽度的百分比
  num get wp => Get.screenWidth * this.toDouble();

  /// 屏幕高度的百分比
  num get hp => Get.screenHeight * this.toDouble();
}