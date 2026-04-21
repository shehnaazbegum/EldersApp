import 'package:flutter/material.dart';
import 'dart:ui';
import 'login.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              // Logo
              const Text(
                'Elders App',
                style: TextStyle(
                  color: Color(0xFF006D5B),
                  fontSize: 22,
                  fontWeight: FontWeight.w900,
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: 25),
              
              // Image Section with Glass Card
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(32),
                    child: Image.network(
                      'https://ghost-cms.s3.ap-south-1.amazonaws.com/2024/08/Elder-Care_Truworth-Wellness.jpg',
                      height: 380,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 20,
                    right: 20,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.white.withOpacity(0.2)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '"I finally feel empowered to live\nmy best life every day."',
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.9),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                '— Arthur G., Community Member',
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.7),
                                  fontSize: 11,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 16),
              // Social Proof Row
              Row(
                children: [
                  _buildAvatarStack(),
                  const SizedBox(width: 12),
                  const Text(
                    'Joined by 12k+ families this month',
                    style: TextStyle(color: Colors.black45, fontSize: 13, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              
              const SizedBox(height: 40),
              // Label
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                decoration: BoxDecoration(
                  color: const Color(0xFFF6EBD1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  'THE FUTURE OF CARE',
                  style: TextStyle(
                    color: Color(0xFF8B6B23),
                    fontSize: 11,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
              
              const SizedBox(height: 20),
              // Main Headline
              RichText(
                text: const TextSpan(
                  style: TextStyle(fontSize: 38, height: 1.1, color: Color(0xFF1E1E1E), fontWeight: FontWeight.w900),
                  children: [
                    TextSpan(text: 'Compassionate\nCare at Your\n'),
                    TextSpan(
                      text: 'Fingertips.',
                      style: TextStyle(color: Color(0xFF006D5B), fontStyle: FontStyle.italic),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 20),
              const Text(
                'A sanctuary where health meets technology. Experience concierge elderly support designed for dignity, joy, and total peace of mind.',
                style: TextStyle(fontSize: 16, color: Colors.black54, height: 1.4),
              ),
              
              const SizedBox(height: 35),
              // Primary Button
InkWell(
  borderRadius: BorderRadius.circular(20),
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
  },
  child: Container(
    width: double.infinity,
    height: 65,
    decoration: BoxDecoration(
      color: const Color(0xFF006D5B),
      borderRadius: BorderRadius.circular(20),
    ),
    child: const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Begin Your Journey',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(width: 10),
        Icon(Icons.arrow_forward, color: Colors.white, size: 20),
      ],
    ),
  ),
),
              
              const SizedBox(height: 12),
              // Secondary Buttons
              Row(
                children: [
                  Expanded(child: _buildSecondaryButton('I am a Caregiver')),
                  const SizedBox(width: 12),
                  Expanded(child: _buildSecondaryButton('I am a Senior')),
                ],
              ),
              
              const SizedBox(height: 35),
              // Feature Cards
              _buildFeatureCard(
                icon: Icons.verified_user_rounded,
                iconColor: const Color(0xFF006D5B),
                title: 'Verified Professionals',
                desc: 'Every caregiver is thoroughly vetted and certified.',
              ),
              const SizedBox(height: 15),
              _buildFeatureCard(
                icon: Icons.favorite_rounded,
                iconColor: const Color(0xFF8B6B23),
                title: 'Vitality Score',
                desc: 'Track wellness and daily joy with ease.',
              ),
              
              const SizedBox(height: 40),
              // Footer
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: const TextSpan(
                      style: TextStyle(color: Colors.black45, fontSize: 13),
                      children: [
                        TextSpan(text: 'Already have an account? '),
                        TextSpan(text: 'Log in', style: TextStyle(color: Color(0xFF006D5B), fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  const Row(
                    children: [
                      Icon(Icons.language, color: Colors.black45, size: 22),
                      SizedBox(width: 15),
                      Icon(Icons.help_outline, color: Colors.black45, size: 22),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSecondaryButton(String text) {
    return Container(
      height: 55,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: const Color(0xFFDEE5DE),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.w600, color: Color(0xFF2E3E2E), fontSize: 13),
      ),
    );
  }

  Widget _buildFeatureCard({required IconData icon, required Color iconColor, required String title, required String desc}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(color: iconColor.withOpacity(0.1), shape: BoxShape.circle),
            child: Icon(icon, color: iconColor, size: 20),
          ),
          const SizedBox(height: 12),
          Text(title, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 16)),
          const SizedBox(height: 4),
          Text(desc, style: const TextStyle(color: Colors.black45, fontSize: 12, height: 1.3)),
        ],
      ),
    );
  }

  Widget _buildAvatarStack() {
    return SizedBox(
      width: 75,
      height: 35,
      child: Stack(
        children: List.generate(3, (i) => Positioned(
          left: i * 20,
          child: CircleAvatar(
            radius: 16,
            backgroundColor: const Color(0xFFF4F7F4),
            child: CircleAvatar(
              radius: 14,
              backgroundImage: NetworkImage('https://i.pravatar.cc/100?img=${i + 10}'),
            ),
          ),
        )),
      ),
    );
  }
}