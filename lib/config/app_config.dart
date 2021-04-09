import 'package:flutter_base_framework/flutter_base_framework.dart';

class AppConfig {
  static init() async {
    /// 启动本地存储工具
    await StorageManager.init();
    // shared_preferences
    await SpUtil.getInstance();
  }
}
