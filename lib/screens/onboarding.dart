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

  final List<Map<String, String>> _onboardingData = [
    {
      "title": "Exceptional Care,\nSimplified.",
      "subtitle": "Book premium companionship and health support at the tap of a button.",
      "image": "https://media.istockphoto.com/id/1473472075/photo/my-therapist-has-helped-me-walk-at-park.jpg?s=612x612&w=0&k=20&c=ZZf2xqy8nYnvOByTgNZwtODB61xuaMD8y5bpChQeddM=",
    },
    {
      "title": "Vetted & Trusted\nProfessionals.",
      "subtitle": "Every caregiver undergoes rigorous background checks for your peace of mind.",
      "image": "https://www.shutterstock.com/image-photo/female-caregiver-senior-woman-walker-260nw-2473456387.jpg",
    },
    {
      "title": "Real-time\nMonitoring.",
      "subtitle": "Stay connected with your loved ones through live updates and secure tracking.",
      "image": "https://t4.ftcdn.net/jpg/04/39/42/61/360_F_439426146_a1wk1Qa50YxLMi2atCsRSVcZBsKlVlDv.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF09090B),
      body: Stack(
        children: [
          // 1. Background Image Slider
          PageView.builder(
            controller: _pageController,
            onPageChanged: (value) => setState(() => _currentPage = value),
            itemCount: _onboardingData.length,
            itemBuilder: (context, index) {
              return Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    _onboardingData[index]["image"]!,
                    fit: BoxFit.cover,
                  ),
                  // Professional dark overlay gradient
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(0.3),
                          Colors.black.withOpacity(0.5),
                          const Color(0xFF09090B).withOpacity(0.9),
                          const Color(0xFF09090B),
                        ],
                        stops: const [0.0, 0.4, 0.7, 1.0],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),

          // 2. Content Overlay
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  // Brand Logo
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'ELDERS APP',
                        style: TextStyle(
                          color: Color(0xFFA78BFA),
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 2,
                        ),
                      ),
                      TextButton(
onPressed: () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => ProfessionalLoginPage(),
    ),
  );
},                        child: const Text('Skip', style: TextStyle(color: Colors.white60)),
                      ),
                    ],
                  ),
                  const Spacer(),
                  
                  // Text Content
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: Column(
                      key: ValueKey<int>(_currentPage),
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _onboardingData[_currentPage]["title"]!,
                          style: const TextStyle(
                            fontSize: 38,
                            fontWeight: FontWeight.w900,
                            height: 1.1,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          _onboardingData[_currentPage]["subtitle"]!,
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 40),

                  // 3. Action Area
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Animated Indicators
                      Row(
                        children: List.generate(
                          _onboardingData.length,
                          (index) => AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            margin: const EdgeInsets.only(right: 8),
                            height: 6,
                            width: _currentPage == index ? 24 : 6,
                            decoration: BoxDecoration(
                              color: _currentPage == index 
                                  ? const Color(0xFFA78BFA) 
                                  : Colors.white24,
                              borderRadius: BorderRadius.circular(3),
                            ),
                          ),
                        ),
                      ),
                      
                      // Circular Progress Button
                      GestureDetector(
                        onTap: () {
                          if (_currentPage < _onboardingData.length - 1) {
                            _pageController.nextPage(
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.easeInOut,
                            );
                          }
                        },
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            SizedBox(
                              width: 70,
                              height: 70,
                              child: CircularProgressIndicator(
                                value: (_currentPage + 1) / _onboardingData.length,
                                strokeWidth: 2,
                                backgroundColor: Colors.white10,
                                valueColor: const AlwaysStoppedAnimation(Color(0xFFA78BFA)),
                              ),
                            ),
                            Container(
                              width: 56,
                              height: 56,
                              decoration: const BoxDecoration(
                                color: Color(0xFFA78BFA),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(Icons.arrow_forward_ios, size: 20, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}