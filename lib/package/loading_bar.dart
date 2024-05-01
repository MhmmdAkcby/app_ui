import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingBar extends StatelessWidget {
  const LoadingBar({super.key, this.size});
  final double? size;
  final _defaultSize = 40.0;
  @override
  Widget build(BuildContext context) {
    return SpinKitPianoWave(
      color: _WidgetColors().redColor,
      size: size ?? _defaultSize,
    );
  }
}

class _WidgetColors {
  final redColor = Colors.red;
}
