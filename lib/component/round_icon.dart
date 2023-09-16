import 'package:flutter/material.dart';

class RoundIcon extends StatelessWidget {
  const RoundIcon({
    super.key,
    required this.onTap,
    required this.child,
    required this.color,
  });

  final Color color;
  final VoidCallback onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Material(
        color: color,
        child: InkWell(
          onTap:onTap,
          child: Container(
              padding: EdgeInsets.all(6),
              child: child
          ),
        ),
      ),
    );
  }
}