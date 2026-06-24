import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'otp_screen.dart'; // Ensure this file exists

class ProfessionalLoginPage extends StatefulWidget {
  const ProfessionalLoginPage({super.key});

  @override
  State<ProfessionalLoginPage> createState() => _ProfessionalLoginPageState();
}

class _ProfessionalLoginPageState extends State<ProfessionalLoginPage> {
  final Color _primaryColor = const Color(0xFFEF4F5F); // Zomato-style Red[cite: 3]
  int _selectedRoleIndex = 0; // 0 for Elder, 1 for Family Member[cite: 3]

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text("Help", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Center(child: Icon(Icons.health_and_safety_outlined, size: 80, color: _primaryColor)),
            const SizedBox(height: 30),
            
            // Role Selector Toggle[cite: 3]
            _buildRoleSelector(),
            const SizedBox(height: 30),
            
            Text(
              _selectedRoleIndex == 0 ? "Login as Elder" : "Login as Family Member",
              style: const TextStyle(color: Colors.black87, fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            
            // Phone Input
            IntlPhoneField(
              initialCountryCode: 'IN',
              cursorColor: _primaryColor,
              decoration: InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: _primaryColor, width: 2)),
              ),
            ),
            const SizedBox(height: 20),

            // Continue Button with Navigation[cite: 3]
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context, 
                    MaterialPageRoute(builder: (context) => const OtpVerificationScreen())
                  );
                },
                style: ElevatedButton.styleFrom(backgroundColor: _primaryColor, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                child: const Text("Continue", style: TextStyle(fontSize: 16)),
              ),
            ),
            
            const SizedBox(height: 20),
            _buildDivider(),
            const SizedBox(height: 20),

            _buildSocialButton("Continue with Google", Icons.g_mobiledata),
            const SizedBox(height: 12),
            _buildSocialButton("Continue with Email", Icons.email_outlined),
            
            const SizedBox(height: 30),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("New to Quidado? "),
                  GestureDetector(
                    onTap: () {},
                    child: Text("Create account", style: TextStyle(color: _primaryColor, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 30),
            Center(
              child: Text(
                "By continuing, you agree to our Terms of Service & Privacy Policy",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildRoleSelector() {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(color: Colors.grey.shade100, borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          _buildRoleTab("Elder", 0),
          _buildRoleTab("Family", 1),
        ],
      ),
    );
  }

  Widget _buildRoleTab(String title, int index) {
    bool isSelected = _selectedRoleIndex == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _selectedRoleIndex = index),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
            boxShadow: isSelected ? [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 4)] : [],
          ),
          child: Center(child: Text(title, style: TextStyle(fontWeight: FontWeight.bold, color: isSelected ? _primaryColor : Colors.grey))),
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Row(
      children: [
        Expanded(child: Divider(color: Colors.grey.shade300)),
        Padding(padding: const EdgeInsets.symmetric(horizontal: 10), child: Text("or", style: TextStyle(color: Colors.grey.shade500))),
        Expanded(child: Divider(color: Colors.grey.shade300)),
      ],
    );
  }

  Widget _buildSocialButton(String text, IconData icon) {
    return OutlinedButton.icon(
      onPressed: () {},
      icon: Icon(icon, color: Colors.black87),
      label: Text(text, style: const TextStyle(color: Colors.black87)),
      style: OutlinedButton.styleFrom(minimumSize: const Size(double.infinity, 50), side: BorderSide(color: Colors.grey.shade300), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
    );
  }
}