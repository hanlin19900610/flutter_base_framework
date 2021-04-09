import 'package:flutter/material.dart';
import 'package:flutter_base_framework/flutter_base_framework.dart';

class LoadingDialog extends Dialog {
  ///加载提示
  final String loadingText;

  LoadingDialog({this.loadingText = '加载中...'});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: Center(
          child: SizedBox(
            width: 120.dp as double?,
            height: 120.dp as double?,
            child: Container(
              decoration: ShapeDecoration(
                color: Color(0x99000000),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(
                      Colors.white,
                    ),
                    strokeWidth: 2.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 20.0,
                    ),
                    child: Text(
                      loadingText,
                      style: TextStyle(fontSize: 15.0, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}