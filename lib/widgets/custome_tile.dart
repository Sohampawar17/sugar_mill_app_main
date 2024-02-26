import 'package:flutter/material.dart';

class CustomeTile extends StatefulWidget {
  final Widget child;
  final Color color;
  const CustomeTile({super.key, required this.child, required this.color});

  @override
  State<CustomeTile> createState() => CustomeTileSate();
}

class CustomeTileSate extends State<CustomeTile> {
  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      borderRadius: BorderRadius.circular(8.0),
      color: widget.color,
      elevation: 12.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: widget.child,
      ),
    );
  }
}
