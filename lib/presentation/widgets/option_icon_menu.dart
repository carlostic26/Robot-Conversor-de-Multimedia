import 'package:flutter/material.dart';

class OptionIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTapCallback;

  const OptionIcon(
      {super.key,
      required this.icon,
      required this.label,
      required this.onTapCallback});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapCallback,
      child: Column(
        children: [
          Icon(icon, size: 48),
          Text(label),
        ],
      ),
    );
  }
}
