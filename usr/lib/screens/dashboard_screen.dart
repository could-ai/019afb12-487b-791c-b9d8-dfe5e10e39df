import 'package:flutter/material.dart';
import 'dart:math';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> with SingleTickerProviderStateMixin {
  double _batteryLevel = 80.0;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Color _getBatteryColor() {
    if (_batteryLevel > 60) return const Color(0xFF00FF9D); // Green
    if (_batteryLevel > 20) return const Color(0xFFFFD700); // Yellow
    return const Color(0xFFFF0055); // Red
  }

  String _getStatusText() {
    if (_batteryLevel > 80) return "PRONTO PARA SOCIALIZAR";
    if (_batteryLevel > 60) return "NÍVEL ACEITÁVEL";
    if (_batteryLevel > 40) return "MODO ECONOMIA DE ENERGIA";
    if (_batteryLevel > 20) return "RISCO DE IRRITAÇÃO";
    return "EVACUAR IMEDIATAMENTE";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SOCIAL BATTERY OS"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Battery Indicator
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 200,
                  height: 350,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white24, width: 4),
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black,
                  ),
                ),
                Positioned(
                  bottom: 10,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    width: 180,
                    height: 330 * (_batteryLevel / 100),
                    decoration: BoxDecoration(
                      color: _getBatteryColor(),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: _getBatteryColor().withOpacity(0.6),
                          blurRadius: 20,
                          spreadRadius: 2,
                        )
                      ],
                    ),
                  ),
                ),
                Text(
                  "${_batteryLevel.toInt()}%",
                  style: const TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            
            // Status Text
            Text(
              _getStatusText(),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: _getBatteryColor(),
                fontSize: 18,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),
            
            const SizedBox(height: 20),
            
            // Slider
            Slider(
              value: _batteryLevel,
              min: 0,
              max: 100,
              activeColor: _getBatteryColor(),
              inactiveColor: Colors.white10,
              onChanged: (value) {
                setState(() {
                  _batteryLevel = value;
                });
              },
            ),
            
            const Spacer(),
            
            // Action Buttons
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.exit_to_app, color: Colors.black),
                    label: const Text("GERAR DESCULPA", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF00FF9D),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/escape');
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    icon: const Icon(Icons.call, color: Colors.redAccent),
                    label: const Text("FALSA EMERGÊNCIA", style: TextStyle(color: Colors.redAccent)),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.redAccent),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/fake_call');
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
