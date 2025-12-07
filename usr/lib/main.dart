import 'package:flutter/material.dart';
import 'package:couldai_user_app/screens/dashboard_screen.dart';
import 'package:couldai_user_app/screens/escape_pod_screen.dart';
import 'package:couldai_user_app/screens/fake_call_screen.dart';

void main() {
  runApp(const SocialBatteryApp());
}

class SocialBatteryApp extends StatelessWidget {
  const SocialBatteryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Social Battery',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xFF00FF9D), // Neon Green
        scaffoldBackgroundColor: const Color(0xFF121212),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF00FF9D),
          secondary: Color(0xFFB026FF), // Neon Purple
          surface: Color(0xFF1E1E1E),
        ),
        useMaterial3: true,
        fontFamily: 'Courier', // Monospaced for a tech/cyberpunk feel
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const DashboardScreen(),
        '/escape': (context) => const EscapePodScreen(),
        '/fake_call': (context) => const FakeCallScreen(),
      },
    );
  }
}
