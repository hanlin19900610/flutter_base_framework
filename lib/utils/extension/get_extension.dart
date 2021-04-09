import 'package:flutter/material.dart';
import 'package:flutter_base_framework/flutter_base_framework.dart';


extension GetExtension on GetInterface {
  /// 隐藏对话框
  dismiss() {
    if (Get.isDialogOpen!) {
      Get.back();
    }
  }

  /// 显示加载框
  loading() {
    if (Get.isDialogOpen!) {
      Get.back();
    }
    Get.dialog(
      WillPopScope(onWillPop: () async => false, child: LoadingDialog()),
      barrierDismissible: false,
    );
  }

  /// 获取高度占位
  SizedBox getHeightBox(double height){
    return SizedBox(height: height, width: 1,);
  }

  /// 获取宽度占位
  SizedBox getWidthBox(double width){
    return SizedBox(height: 1, width: width,);
  }

  ///屏幕宽度
  double get screenWidth => ScreenUtil.getInstance().screenWidth;

  ///屏幕高度
  double get screenHeight => ScreenUtil.getInstance().screenHeight;

  ///获取底部高度
  double get bottomBarHeight => ScreenUtil.getInstance().bottomBarHeight;

  /// 隐藏软键盘
  void hideKeyboard(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus!.unfocus();
    }
  }
}
