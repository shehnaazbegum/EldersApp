import 'package:flutter/material.dart';
import 'dashboard_screen.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Matching the soft mint background from the image
      backgroundColor: const Color(0xFFF4F9F4),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(Icons.arrow_back, color: Color(0xFF006D5B)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            // Heading
            const Text(
              'Verify\nPhone',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.w900,
                color: Color(0xFF1A1A1A),
                height: 1.0,
              ),
            ),
            const SizedBox(height: 20),
            // Subtitle with masked phone number
            RichText(
              text: const TextSpan(
                style: TextStyle(color: Colors.black54, fontSize: 16, height: 1.5),
                children: [
                  TextSpan(text: "We've sent a 4-digit verification code to\n"),
                  TextSpan(
                    text: "+1 (555) • • • • • 89",
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),

            // OTP Input Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildOtpBox(context, "5", isFocused: true),
                _buildOtpBox(context, "-", isFocused: false),
                _buildOtpBox(context, "-", isFocused: false),
                _buildOtpBox(context, "-", isFocused: false),
              ],
            ),
            const SizedBox(height: 30),

            // Timer and Resend Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  children: [
                    Icon(Icons.access_time_filled, size: 18, color: Colors.black45),
                    SizedBox(width: 8),
                    Text(
                      "00:48",
                      style: TextStyle(color: Colors.black45, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Resend code",
                    style: TextStyle(
                      color: Color(0xFF006D5B),
                      fontWeight: FontWeight.w900,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),

            // Primary Button
            SizedBox(
              width: double.infinity,
              height: 65,
              child: ElevatedButton(
                onPressed: () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const DashboardScreen(),
    ),
  );
},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF006D5B),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  elevation: 0,
                ),
                child: const Text(
                  'Verify & Proceed',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 40),

            // Secure Sanctuary Card
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.5),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      color: Color(0xFFF9A825),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.verified_user, color: Color(0xFF4A3400), size: 20),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Secure Sanctuary',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900, color: Color(0xFF1A1A1A)),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Your data is protected by industry-leading 256-bit encryption. We never share your personal information.',
                    style: TextStyle(color: Colors.black54, fontSize: 14, height: 1.4),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),

            // Bottom Support Links
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildSupportLink(Icons.help_outline, "Get Help"),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Text("•", style: TextStyle(color: Colors.black26)),
                ),
                _buildSupportLink(Icons.headset_mic_outlined, "Contact Support"),
              ],
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildOtpBox(BuildContext context, String val, {required bool isFocused}) {
    return Container(
      width: 75,
      height: 85,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isFocused ? Colors.white : const Color(0xFFE2E9E2),
        borderRadius: BorderRadius.circular(25),
        border: isFocused ? Border.all(color: const Color(0xFF4C84FF), width: 2) : null,
      ),
      child: Text(
        val,
        style: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w900,
          color: isFocused ? Colors.black : Colors.black26,
        ),
      ),
    );
  }

  Widget _buildSupportLink(IconData icon, String label) {
    return Row(
      children: [
        Icon(icon, size: 18, color: Colors.black45),
        const SizedBox(width: 6),
        Text(
          label,
          style: const TextStyle(color: Colors.black45, fontWeight: FontWeight.bold, fontSize: 13),
        ),
      ],
    );
  }
}