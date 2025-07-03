import 'package:flutter/material.dart';

class ControllerButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const ControllerButton({super.key, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        backgroundColor: Colors.grey[800],
        shape: const CircleBorder(),
      ),
      onPressed: onPressed,
      child: Text(label,
        style: const TextStyle(
          fontSize: 18,
          color: Colors.white,
        ),
      ),
    );
  }
}
