import 'package:flutter_base_framework/flutter_base_framework.dart';
import 'package:flutter_base_framework/providers/base_view_model.dart';

import 'base_view_list_model.dart';

/// 基于
abstract class ViewStateRefreshListModel<T> extends ViewStateListModel<T> {
  /// 分页第一页页码
  int pageNumFirst = 1;

  /// 分页条目数量
  int pageSize;

  ViewStateRefreshListModel({this.pageSize = 10, this.pageNumFirst = 1}) : super();

  EasyRefreshController _refreshController = EasyRefreshController();

  EasyRefreshController get refreshController => _refreshController;

  /// 当前页码
  late int _currentPageNum;


  @override
  void onInit() {
    super.onInit();
    _currentPageNum = pageNumFirst;
  }

  /// 下拉刷新
  ///
  /// [init] 是否是第一次加载
  /// true:  Error时,需要跳转页面
  /// false: Error时,不需要跳转页面,直接给出提示
  Future<void> refresh({bool init = false}) async {
    try {
      _currentPageNum = pageNumFirst;
      var data = await loadData(pageNum: _currentPageNum);
      if (data.isEmpty) {
        refreshController.finishRefresh(success: true, noMore: true);
        list.clear();
        setEmpty();
      } else {
        list.clear();
        list.addAll(data);
        refreshController.finishRefresh(success: true, noMore: data.length < pageSize);
        setIdle();
      }
    } catch (e, s) {
      printErrorStack(e, s);
      /// 页面已经加载了数据,如果刷新报错,不应该直接跳转错误页面
      /// 而是显示之前的页面数据.给出错误提示
      if (init) list.clear();
      refreshController.finishRefresh(success: false);
      setError();
    }
  }

  /// 上拉加载更多
  Future<void> loadMore() async {
    try {
      var data = await loadData(pageNum: ++_currentPageNum);
      if (data.isEmpty) {
        _currentPageNum--;
        refreshController.finishLoad(success: true, noMore: true);
      } else {
        list.addAll(data);
        refreshController.finishLoad(success: true, noMore: data.length < pageSize);
      }
      update();
    } catch (e, s) {
      _currentPageNum--;
      refreshController.finishLoad(success: false);
      printErrorStack(e, s);
    }
  }

  // 加载数据
  Future<List<T>> loadData({int? pageNum});

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }
}
