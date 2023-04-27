import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class LoadingWidget extends StatelessWidget {
  final double height;
  final Color color;
  const LoadingWidget({super.key, required this.height, required this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Center(
        child: CircularProgressIndicator(
          color: color,
        ),
      ),
    );
  }
}

class LoadingWidget2 extends StatelessWidget {
  const LoadingWidget2();

  @override
  Widget build(BuildContext context) {
    return GFLoader(
      type: GFLoaderType.circle,
    
      size: GFSize.LARGE,
      
    );
  }
}
