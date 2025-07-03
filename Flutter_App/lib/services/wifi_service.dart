import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WiFiService {
  static const String baseUrl = "http://192.168.18.44:8000";
  //192.168.43.44 - vivo1935
  //192.168.18.44 - Soorya's Mobile
  //192.168.43.147 - Raspberry pi with vivo1935
  static Future<void> sendButtonData(Map<String, dynamic> buttonData, BuildContext context) async {
    try {
      final response = await http.post(
        Uri.parse("$baseUrl/button_press"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(buttonData),
      );

      if (response.statusCode != 200) {
        throw Exception("Failed to send data");
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $e")),
      );
    }
  }

  static Future<bool> testConnection() async {
    try {
      final response = await http.get(Uri.parse("$baseUrl/ping"));
      return response.statusCode == 200;
    } catch (e) {
      print("Connection test failed: $e");
      return false;
    }
  }
}
