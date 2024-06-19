import 'package:flutter/material.dart';

class OptionIcon extends StatelessWidget {
  final IconData icon;
  final String label;

  const OptionIcon({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 48),
        Text(label),
      ],
    );
  }
}
