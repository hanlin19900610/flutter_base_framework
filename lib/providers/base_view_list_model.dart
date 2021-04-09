
import 'base_view_model.dart';

/// 基于
abstract class ViewStateListModel<T> extends ViewStateModel {
  /// 页面数据
  List<T> list = [];

  /// 第一次进入页面loading skeleton
  initData() async {
    setBusy();
    await refresh(init: true);
  }

  // 下拉刷新
  Future<void> refresh({bool init = false}) async {
    try {
      List<T> data = await loadData();
      if (data.isEmpty) {
        list.clear();
        setEmpty();
      } else {
        list.clear();
        list.addAll(data);
        setIdle();
      }
    } catch (e, s) {
      printErrorStack(e, s);
      list.clear();
      setError();
    }
  }

  // 加载数据
  Future<List<T>> loadData();
}
