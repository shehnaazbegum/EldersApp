import 'dart:async';
import 'package:flutter/material.dart';
import 'login.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  Timer? _timer;

  final Color _primaryColor = const Color(0xFFEF4F5F); // Zomato-style brand color
  final String _appName = "Quidado";
  final String _appTagline = "Care simplified, trust verified."; // Added tagline

  final List<Map<String, String>> _onboardingData = [
    {
      "title": "Care with Dignity\nand Expertise.",
      "subtitle": "Professional, compassionate health support designed specifically for your loved ones.",
      "image": "assests/images/OldPeople.jpg",
    },
    {
      "title": "Verified Care\nYou Can Trust.",
      "subtitle": "Every specialist is background-checked and trained to provide premium care.",
      "image": "assests/images/SeniorsLaughingGroup.jpg",
    },
    {
      "title": "Safety at Your\nFingertips.",
      "subtitle": "Real-time updates, secure health monitoring, and instant support.",
      "image": "assests/images/SmilingGrandma.jpg",
    },
  ];

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 2), (Timer timer) {
      if (_currentPage < 2) {
        _pageController.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void _navigateToLogin() {
    _timer?.cancel();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const ProfessionalLoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header with App Name and Tagline
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(_appName, style: TextStyle(color: _primaryColor, fontWeight: FontWeight.w900, fontSize: 32)),
                      Text(_appTagline, style: TextStyle(color: Colors.grey.shade600, fontSize: 12, fontWeight: FontWeight.w500)),
                    ],
                  ),
                  TextButton(onPressed: _navigateToLogin, child: const Text("Skip", style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold))),
                ],
              ),
            ),
            // Image PageView
            Expanded(
              flex: 5,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (idx) => setState(() => _currentPage = idx),
                itemCount: _onboardingData.length,
                itemBuilder: (ctx, i) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(image: AssetImage(_onboardingData[i]["image"]!), fit: BoxFit.cover),
                  ),
                ),
              ),
            ),
            // Footer Content
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(3, (index) => AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        height: 8,
                        width: _currentPage == index ? 24 : 8,
                        decoration: BoxDecoration(color: _currentPage == index ? _primaryColor : Colors.grey.shade300, borderRadius: BorderRadius.circular(4)),
                      )),
                    ),
                    const SizedBox(height: 32),
                    Text(_onboardingData[_currentPage]["title"]!, textAlign: TextAlign.center, style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w900, color: Colors.black87)),
                    const SizedBox(height: 16),
                    Text(_onboardingData[_currentPage]["subtitle"]!, textAlign: TextAlign.center, style: TextStyle(fontSize: 16, color: Colors.grey.shade600)),
                    const Spacer(),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: _navigateToLogin,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _primaryColor,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                        child: Text(_currentPage == 2 ? "Get Started" : "Continue", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}