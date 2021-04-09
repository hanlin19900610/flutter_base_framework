import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:extended_image/extended_image.dart';
/// 支持本地和网络路径
class ImageView extends StatefulWidget {
  final String? url;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final BorderRadius? borderRadius;

  const ImageView({
    Key? key,
    this.url,
    this.width,
    this.height,
    this.fit,
    this.borderRadius,
  }) : super(key: key);

  @override
  _ImageViewState createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> with SingleTickerProviderStateMixin  {

  late AnimationController _controller;
  @override
  void initState() {
    _controller = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 3),
        lowerBound: 0.0,
        upperBound: 1.0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ExtendedImage.network(
      widget.url!,
      width: widget.width,
      height: widget.height,
      cache: true,
      borderRadius: widget.borderRadius ?? BorderRadius.circular(0.0),
      loadStateChanged: (state){
        switch (state.extendedImageLoadState) {
          case LoadState.loading:
            _controller.reset();
            return SizedBox(
              width: widget.width,
              height: widget.height,
              child: CupertinoActivityIndicator(radius: min(10.0, widget.width!/3),),
            );
            break;
          case LoadState.failed:
            _controller.reset();
            state.imageProvider.evict();
            return SizedBox(
              width: widget.width,
              height: widget.height,
              child: Icon(Icons.broken_image, size: widget.width,),
            );
            break;
          default:
            _controller.forward();
            return FadeTransition(
              opacity: _controller,
              child: ExtendedRawImage(
                image: state.extendedImageInfo?.image,
                width: widget.width,
                height: widget.height,
              ),
            );
            break;
        }
      },
      fit: widget.fit,
    );
  }
}