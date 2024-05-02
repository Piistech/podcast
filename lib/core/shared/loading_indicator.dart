import 'package:flutter/material.dart';

class NetworkingIndicator extends StatelessWidget {
  final double dimension;
  final Color color;

  const NetworkingIndicator({super.key, required this.dimension, required this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: dimension,
      height: dimension,
      child: CircularProgressIndicator(strokeWidth: 3, valueColor: AlwaysStoppedAnimation(color)),
    );
  }
}
