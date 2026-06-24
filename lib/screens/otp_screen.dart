import 'dart:async';
import 'package:flutter/material.dart';
import 'dashboard_screen.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final Color _primaryColor = const Color(0xFFEF4F5F);
  int _secondsRemaining = 30;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        setState(() => _secondsRemaining--);
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text(
              "Verify phone",
              style: TextStyle(color: Colors.black87, fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Text(
              "We sent a 6-digit OTP to your phone number",
              style: TextStyle(color: Colors.grey.shade600, fontSize: 16),
            ),
            const SizedBox(height: 40),
            
            // OTP Input Fields with Auto-focus logic
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(6, (index) => SizedBox(
                width: 45,
                child: TextField(
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  maxLength: 1,
                  onChanged: (value) {
                    if (value.length == 1) FocusScope.of(context).nextFocus();
                    if (value.isEmpty) FocusScope.of(context).previousFocus();
                  },
                  decoration: InputDecoration(
                    counterText: "",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: _primaryColor, width: 2)),
                  ),
                ),
              )),
            ),
            
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const HomePage())), // Navigate to Dashboard
                style: ElevatedButton.styleFrom(backgroundColor: _primaryColor, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                child: const Text("Verify OTP", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ),
            
            const SizedBox(height: 20),
            // Resend OTP with Countdown Timer
            Center(
              child: TextButton(
                onPressed: _secondsRemaining == 0 ? () {
                  setState(() => _secondsRemaining = 30);
                  _startTimer();
                } : null,
                child: Text(
                  _secondsRemaining > 0 ? "Resend OTP in $_secondsRemaining s" : "Resend OTP",
                  style: TextStyle(color: _secondsRemaining == 0 ? _primaryColor : Colors.grey, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}