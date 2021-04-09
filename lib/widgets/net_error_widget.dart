import 'package:flutter/material.dart';

class NetErrorWidget extends StatelessWidget {
  const NetErrorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('请求失败, 点击重试~')
      ],
    );
  }
}
