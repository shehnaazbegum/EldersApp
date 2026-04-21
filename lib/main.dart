import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/onboarding.dart';
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(const LuminousApp());
}

class LuminousApp extends StatelessWidget {
  const LuminousApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF3F7F3),

        // 🔥 Apply Sora font globally
        textTheme: GoogleFonts.soraTextTheme(),

        // Optional: customize further
        primaryColor: const Color(0xFF0F766E),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0F766E),
        ),
      ),

      home: const OnboardingScreen(),
    );
  }
}