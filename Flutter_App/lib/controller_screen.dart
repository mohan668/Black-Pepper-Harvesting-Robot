import 'package:flutter/material.dart';
import 'services/wifi_service.dart';
import 'widgets/small_button.dart';

class ControllerScreen extends StatelessWidget {
  const ControllerScreen({super.key});

  void _sendCommand(String command, BuildContext context) {
    WiFiService.sendButtonData({"command": command, "pressed": true}, context);
  }

  Widget _buildControlSection(String title, List<Map<String, String>> buttons, BuildContext context) {
    return Column(
      children: [
        Text(title, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: buttons.map((btn) {
            return SmallButton(
              label: btn["label"]!,
              onPressed: () => _sendCommand(btn["command"]!, context),
            );
          }).toList(),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Base Control
              _buildControlSection("🟢 Base Control", [
                {"label": "↻ CW", "command": "BASE_CW"},
                {"label": "↺ CCW", "command": "BASE_CCW"},
                {"label": "🔒 Lock", "command": "BASE_LOCK"},
                {"label": "🔓 Unlock", "command": "BASE_UNLOCK"},
              ], context),

              // Link 1 Control
              _buildControlSection("🔵 Link 1 Control", [
                {"label": "↗ CW", "command": "LINK_CW"},
                {"label": "↘ CCW", "command": "LINK_CCW"},
                {"label": "🔒 Lock", "command": "LINK_LOCK"},
                {"label": "🔓 Unlock", "command": "LINK_UNLOCK"},
              ], context),

              // Link 2 (Wrist) Control
              _buildControlSection("🟣 Link 2 (Wrist) Control", [
                {"label": "↻ CW", "command": "WRIST_CW"},
                {"label": "↺ CCW", "command": "WRIST_CCW"},
                {"label": "🔒 Lock", "command": "WRIST_LOCK"},
                {"label": "🔓 Unlock", "command": "WRIST_UNLOCK"},
              ], context),

              const SizedBox(height: 20),

              // General Controls
              _buildControlSection("⚙️ General", [
                {"label": "▶️ START", "command": "START"},
                {"label": "⏹️ STOP", "command": "STOP"},
              ], context),

              const SizedBox(height: 20),

              // Display Screen
              Container(
                width: double.infinity,
                height: 120,
                padding: const EdgeInsets.all(12),
                color: Colors.grey[900],
                child: const Center(
                  child: Text(
                    "Display Screen\n(Feedback here)",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.greenAccent, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
