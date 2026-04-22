import 'package:flutter/material.dart';
import 'track_booking.dart';

class BookingSuccessScreen extends StatelessWidget {
  final String serviceName;
  final String price;
  final String selectedTime;
  final DateTime selectedDate;

  const BookingSuccessScreen({
    super.key,
    required this.serviceName,
    required this.price,
    required this.selectedTime,
    required this.selectedDate,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF09090B),
      body: Stack(
        children: [
          // 1. DYNAMIC BACKGROUND LAYER
          _buildEliteBackground(),

          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 60),
                
                // 2. HERO SECTION (Icon + Status)
                _buildAnimatedHeroHeader(),
                
                const SizedBox(height: 48),

                // 3. THE "DIGITAL RECEIPT" (Glassmorphism Effect)
                _buildDigitalReceipt(),

                const Spacer(),

                // 4. ACTION CONTROLS
                _buildPremiumActionFooter(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEliteBackground() {
    return Stack(
      children: [
        // Top Glow
        Positioned(
          top: -150,
          left: -50,
          child: Container(
            width: 400,
            height: 400,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFFA78BFA).withOpacity(0.08),
            ),
          ),
        ),
        // Subtle Mesh Gradient
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  const Color(0xFFA78BFA).withOpacity(0.03),
                  const Color(0xFF09090B),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAnimatedHeroHeader() {
    return Column(
      children: [
        // Pulsing Check Icon
        Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            color: const Color(0xFF34D399).withOpacity(0.1),
            shape: BoxShape.circle,
            border: Border.all(color: const Color(0xFF34D399).withOpacity(0.2), width: 1),
          ),
          child: Center(
            child: Container(
              height: 64,
              width: 64,
              decoration: const BoxDecoration(
                color: Color(0xFF34D399),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(color: Color(0xFF34D399), blurRadius: 20, spreadRadius: -5),
                ],
              ),
              child: const Icon(Icons.check_rounded, color: Colors.black, size: 40),
            ),
          ),
        ),
        const SizedBox(height: 24),
        const Text(
          "Service Confirmed",
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.w900,
            letterSpacing: -1.0,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          "Booking ID: #AR-982310", // Example ID for professional feel
          style: TextStyle(color: Color(0xFF52525B), fontSize: 12, fontWeight: FontWeight.w700, letterSpacing: 1),
        ),
      ],
    );
  }

  Widget _buildDigitalReceipt() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: const Color(0xFF18181B),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFF27272A)),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.3), blurRadius: 40, offset: const Offset(0, 20)),
        ],
      ),
      child: Column(
        children: [
          // Header of Receipt
          Padding(
            padding: const EdgeInsets.all(24),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(color: const Color(0xFF27272A), borderRadius: BorderRadius.circular(12)),
                  child: const Icon(Icons.bolt_rounded, color: Color(0xFFA78BFA), size: 24),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(serviceName, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w800)),
                      const Text("Professional Service", style: TextStyle(color: Color(0xFF71717A), fontSize: 12)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          
          const Divider(color: Color(0xFF27272A), height: 1),

          // Details Section
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                _receiptRow("Date", "${selectedDate.day}nd April, 2026", Icons.calendar_today_outlined),
                const SizedBox(height: 16),
                _receiptRow("Time Slot", selectedTime, Icons.access_time_rounded),
                const SizedBox(height: 16),
                _receiptRow("Arrival", "Indiranagar, BLR", Icons.location_on_outlined),
              ],
            ),
          ),

          // Total Section (The "Teared Paper" look is implied by the border)
          Container(
            padding: const EdgeInsets.all(24),
            decoration: const BoxDecoration(
              color: Color(0xFF27272A),
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(24), bottomRight: Radius.circular(24)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Amount Paid", style: TextStyle(color: Color(0xFFA1A1AA), fontSize: 13, fontWeight: FontWeight.w600)),
                Text(price, style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w900)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _receiptRow(String label, String value, IconData icon) {
    return Row(
      children: [
        Icon(icon, color: const Color(0xFF52525B), size: 16),
        const SizedBox(width: 12),
        Text(label, style: const TextStyle(color: Color(0xFF71717A), fontSize: 13, fontWeight: FontWeight.w500)),
        const Spacer(),
        Text(value, style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w700)),
      ],
    );
  }

  Widget _buildPremiumActionFooter(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 40),
      child: Column(
        children: [
          // Track Button
          SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton(
onPressed: () {
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => ServiceTrackScreen(
        serviceName: serviceName,
        orderID: "FRS-9928-X", // or generate dynamically
      ),
    ),
    (route) => false,
  );
},              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFA78BFA),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                elevation: 0,
              ),
              child: const Text("TRACK BOOKING", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w900, letterSpacing: 1.0)),
            ),
          ),
          const SizedBox(height: 16),
          // Secondary Back Button
          SizedBox(
            width: double.infinity,
            height: 56,
            child: OutlinedButton(
              onPressed: () => Navigator.popUntil(context, (route) => route.isFirst),
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Color(0xFF27272A)),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              ),
              child: const Text("BACK TO HOME", style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w800)),
            ),
          ),
        ],
      ),
    );
  }
}