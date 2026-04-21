import 'package:flutter/material.dart';
import 'otp_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F7F4), // Base background
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              // Increased horizontal margin to 12 makes it much wider
              // maxWidth ensures it looks good on tablets/web too
              constraints: const BoxConstraints(maxWidth: 480), 
              margin: const EdgeInsets.symmetric(horizontal: 12), 
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 50),
              decoration: BoxDecoration(
                color: const Color(0xFFF1F5F1), // Card background
                borderRadius: BorderRadius.circular(48), // Slightly more rounded for the width
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 10),
                  // Logo
                  const Text(
                    'Elders App',
                    style: TextStyle(
                      color: Color(0xFF006D5B),
                      fontSize: 28,
                      fontWeight: FontWeight.w900,
                      letterSpacing: -1.2,
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Heading
                  const Text(
                    'Sign In',
                    style: TextStyle(
                      color: Color(0xFF1E1E1E),
                      fontSize: 42, // Slightly larger to match wider layout
                      fontWeight: FontWeight.w900,
                      height: 1.0,
                    ),
                  ),
                  const SizedBox(height: 12),
                  // Subheading
                  const Text(
                    'Your journey to vitality starts here.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black45,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      letterSpacing: -0.2,
                    ),
                  ),
                  const SizedBox(height: 50),

                  // Phone Number Label
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 4, bottom: 12),
                      child: Text(
                        'Phone Number',
                        style: TextStyle(
                          color: Color(0xFF1E1E1E),
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                  // Phone Input
                  TextField(
                    style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                    decoration: InputDecoration(
                      hintText: '+1 (555) 000-0000',
                      hintStyle: const TextStyle(color: Color(0xFFAAB8AA), fontWeight: FontWeight.w500),
                      prefixIcon: const Padding(
                        padding: EdgeInsets.only(left: 16, right: 10),
                        child: Icon(Icons.phone_rounded, color: Color(0xFF5A6A5A), size: 24),
                      ),
                      filled: true,
                      fillColor: const Color(0xFFE2E9E2),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(26),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(vertical: 24),
                    ),
                  ),
                  const SizedBox(height: 28),

                  // Primary Button
InkWell(
  borderRadius: BorderRadius.circular(24),
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const OtpScreen(),
      ),
    );
  },
  child: Container(
    width: double.infinity,
    height: 72,
    decoration: BoxDecoration(
      color: const Color(0xFF006D5B),
      borderRadius: BorderRadius.circular(24),
      boxShadow: [
        BoxShadow(
          color: const Color(0xFF006D5B).withOpacity(0.18),
          blurRadius: 15,
          offset: const Offset(0, 8),
        ),
      ],
    ),
    child: const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Get Verification Code',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(width: 12),
        Icon(Icons.arrow_forward_rounded, color: Colors.white, size: 22),
      ],
    ),
  ),
),
                  const SizedBox(height: 48),

                  // Divider Section
                  Row(
                    children: [
                      Expanded(child: Divider(color: Colors.black.withOpacity(0.06), thickness: 2)),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          'OR CONTINUE WITH',
                          style: TextStyle(
                            color: Colors.black38,
                            fontSize: 12,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 1.0,
                          ),
                        ),
                      ),
                      Expanded(child: Divider(color: Colors.black.withOpacity(0.06), thickness: 2)),
                    ],
                  ),
                  const SizedBox(height: 35),

                  // Social Buttons
                  Row(
                    children: [
                      Expanded(child: _buildSocialBtn('Google', Colors.white, Colors.black87, Icons.g_mobiledata_rounded)),
                      const SizedBox(width: 18),
                      Expanded(child: _buildSocialBtn('Apple', const Color(0xFF1A1A1A), Colors.white, Icons.apple_rounded)),
                    ],
                  ),
                  const SizedBox(height: 48),

                  // Footer Links
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _footerText('PRIVACY POLICY'),
                      const SizedBox(width: 32),
                      _footerText('TERMS OF SERVICE'),
                    ],
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xFFFFB300),
        elevation: 0, // Flat look matches the image flutter_01.png
        shape: const CircleBorder(),
        child: const Icon(Icons.question_mark_rounded, color: Color(0xFF4A3400), size: 30),
      ),
    );
  }

  Widget _buildSocialBtn(String label, Color bg, Color text, IconData icon) {
    return Container(
      height: 68,
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(24),
        border: bg == Colors.white ? Border.all(color: Colors.black.withOpacity(0.05), width: 1.5) : null,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: text, size: 34),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(color: text, fontWeight: FontWeight.w800, fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _footerText(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.black38,
        fontSize: 12,
        fontWeight: FontWeight.w900,
        letterSpacing: 0.5,
      ),
    );
  }
}