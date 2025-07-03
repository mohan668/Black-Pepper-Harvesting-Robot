import 'package:flutter/material.dart';
import '../services/wifi_service.dart';

class LockToggleButton extends StatefulWidget {
  final String labelPrefix;
  final BuildContext context;

  const LockToggleButton({
    super.key,
    required this.labelPrefix,
    required this.context,
  });

  @override
  State<LockToggleButton> createState() => _LockToggleButtonState();
}

class _LockToggleButtonState extends State<LockToggleButton> {
  bool isLocked = true;

  void _toggleLock() {
    setState(() {
      isLocked = !isLocked;
    });
    String command = "${widget.labelPrefix}_${isLocked ? "LOCK" : "UNLOCK"}";
    WiFiService.sendButtonData({"command": command, "pressed": true}, widget.context);
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _toggleLock,
      style: ElevatedButton.styleFrom(
        backgroundColor: isLocked ? Colors.red : Colors.green,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      ),
      child: Text(isLocked ? "LOCK" : "UNLOCK", style: const TextStyle(fontSize: 16)),
    );
  }
}
