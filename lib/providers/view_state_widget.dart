import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_framework/config/i_res_config.dart';
import 'view_state.dart';

class ViewStateWidget extends StatefulWidget {
  // 页面状态
  final ViewState? state;

  // 成功视图
  final Widget? successWidget;

  // 自定义错误视图
  final Widget? errorWidget;

  // 错误事件处理
  final VoidCallback? errorRetry;

  // 自定义空数据视图
  final Widget? emptyWidget;

  // 空数据事件处理
  final VoidCallback? emptyRetry;

  // 自定义加载中视图(默认为loading, 可自定义为骨架视图)
  final Widget? loadingWidget;

  const ViewStateWidget({
    Key? key,
    this.state,
    this.successWidget,
    this.errorWidget,
    this.errorRetry,
    this.emptyWidget,
    this.emptyRetry,
    this.loadingWidget,
  }) : super(key: key);

  @override
  _ViewStateWidgetState createState() => _ViewStateWidgetState();
}

class _ViewStateWidgetState extends State<ViewStateWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: _buildWidget,
    );
  }

  Widget? get _buildWidget {
    switch (widget.state) {
      case ViewState.idle:
        return widget.successWidget;
        break;
      case ViewState.busy:
        return _loadingView;
        break;
      case ViewState.empty:
        return _emptyView;
        break;
      case ViewState.error:
        return _errorView;
        break;
      default:
        return null;
    }
  }

  /// 加载中视图
  Widget get _loadingView {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: widget.loadingWidget ??
          Center(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    child: CupertinoActivityIndicator(
                      radius: 20,
                    ),
                  ),
                  Text(
                    '加载中...',
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  )
                ],
              ),
            ),
          ),
    );
  }

  /// 空数据视图
  Widget get _emptyView {
    return Container(
      width: double.infinity,
      height: double.infinity,
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: widget.emptyRetry,
        child: widget.emptyWidget ??
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  '暂无相关数据,请轻触重试~',
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
              ],
            ),
      ),
    );
  }

  /// 错误视图
  Widget get _errorView {
    return Container(
      width: double.infinity,
      height: double.infinity,
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: widget.errorRetry,
        child: widget.errorWidget ??
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  '加载失败，请轻触重试!',
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
              ],
            ),
      ),
    );
  }
}
