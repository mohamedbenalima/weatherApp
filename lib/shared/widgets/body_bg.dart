import 'package:flutter/material.dart';
import 'package:weatherapp/shared/images.dart';

class BodyBg extends StatelessWidget {
  final Widget? child;
  const BodyBg({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(bgPrimary),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}
