import 'package:flutter/material.dart';

class BentoCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final double elevation;

  const BentoCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(16.0),
    this.onTap,
    this.backgroundColor,
    this.elevation = 2.0,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor ?? Colors.white,
      borderRadius: BorderRadius.circular(16.0),
      elevation: elevation,
      shadowColor: Colors.black.withAlpha(13), // Layer 1 ambient shadow (~5% opacity)
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16.0),
        child: Padding(
          padding: padding ?? EdgeInsets.zero,
          child: child,
        ),
      ),
    );
  }
}
