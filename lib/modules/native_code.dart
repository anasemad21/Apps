import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class NativeCodeScreen extends StatefulWidget {
  @override
  _NativeCodeScreen createState() => _NativeCodeScreen();
}

class _NativeCodeScreen extends State<NativeCodeScreen> {
  static const platform = const MethodChannel('samples.flutter.dev/battery');
  String batteryLevel = 'Unknown battery level.';

  void getBatteryLevel() {
    platform.invokeMethod('getBatteryLevel').then((value) {
      setState(() {
        batteryLevel = 'Battery level at $value % .';
      });
    }).catchError((error) {
      setState(() {
        batteryLevel = "Failed to get battery level: '${error.message}'.";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('Get Battery Level'),
              onPressed: getBatteryLevel,
            ),
            Text(batteryLevel),
          ],
        ),
      ),
    );
  }
}
