import 'package:flutter/material.dart';
import 'otp_screen.dart';

class ProfessionalLoginPage extends StatefulWidget {
  const ProfessionalLoginPage({super.key});

  @override
  State<ProfessionalLoginPage> createState() => _ProfessionalLoginPageState();
}

class _ProfessionalLoginPageState extends State<ProfessionalLoginPage> {
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF09090B),
      // Use resizeToAvoidBottomInset to prevent keyboard layout issues
      resizeToAvoidBottomInset: true, 
      body: SingleChildScrollView( // Added scroll view to prevent overflow on small screens
        child: Column(
          children: [
            // Top Image Section
            Stack(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.35,
                  width: double.infinity,
                  child: Image.network(
                    'https://img.freepik.com/free-photo/close-up-senior-couple-while-learning_23-2149072445.jpg?semt=ais_hybrid&w=740&q=80',
                    fit: BoxFit.cover,
                    // Subtle loading placeholder
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Container(color: const Color(0xFF18181B));
                    },
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.35,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        const Color(0xFF09090B).withOpacity(0.8),
                        const Color(0xFF09090B),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "India's #1 Elder Care App",
                    style: TextStyle(
                      color: Color(0xFFA78BFA),
                      fontSize: 12,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Log in or sign up",
                    style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.w900),
                  ),
                  const SizedBox(height: 32),

                  // Phone Input Box
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: const Color(0xFF27272A)),
                      color: const Color(0xFF121215),
                    ),
                    child: Row(
                      children: [
                        // Fixed PNG Flag
                        ClipRRect(
                          borderRadius: BorderRadius.circular(2),
                          child: Image.network(
                            'https://flagcdn.com/w40/in.png',
                            width: 24,
                          ),
                        ),
                        const SizedBox(width: 12),
                        const Text(
                          "+91",
                          style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const Icon(Icons.keyboard_arrow_down, color: Color(0xFF71717A), size: 18),
                        
                        // FIXED: Simple Vertical Line instead of VerticalDivider
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 12),
                          height: 24,
                          width: 1,
                          color: const Color(0xFF27272A),
                        ),

                        Expanded(
                          child: TextField(
                            controller: _phoneController,
                            keyboardType: TextInputType.phone,
                            style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                            decoration: const InputDecoration(
                              hintText: "Mobile Number",
                              hintStyle: TextStyle(color: Color(0xFF52525B), fontSize: 16, fontWeight: FontWeight.normal),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),
                  
                  // Continue Button
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => OtpScreen(phoneNumber: "+91 ${_phoneController.text}"),
    ),
  );
},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFA78BFA),
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        elevation: 0,
                      ),
                      child: const Text("Continue", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900)),
                    ),
                  ),
                  
                  const SizedBox(height: 40),
                  
                  // Footer Policy
                  Center(
                    child: Opacity(
                      opacity: 0.5,
                      child: const Text(
                        "By continuing, you agree to our Terms & Privacy Policy",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 11),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}