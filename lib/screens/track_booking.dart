import 'package:flutter/material.dart';

class ServiceTrackScreen extends StatefulWidget {
  final String serviceName;
  final String orderID;

  const ServiceTrackScreen({
    super.key, 
    required this.serviceName, 
    this.orderID = "FRS-9928-X"
  });

  @override
  State<ServiceTrackScreen> createState() => _ServiceTrackScreenState();
}

class _ServiceTrackScreenState extends State<ServiceTrackScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF09090B),
      body: Stack(
        children: [
          // 1. DYNAMIC MAP LAYER (Background)
          Container(
            height: MediaQuery.of(context).size.height * 0.6,
            color: const Color(0xFF18181B),
            child: const Center(
              child: Icon(Icons.map_outlined, color: Colors.white10, size: 48),
            ),
          ),

          // 2. TOP ACTION BAR (Back, SOS, and Help)
          Positioned(
            top: 50,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.black,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white, size: 16),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                Row(
                  children: [
                    // SOS Option: High-contrast red for safety
                    _buildTopSystemButton(Icons.emergency_outlined, Colors.redAccent, () {}),
                    const SizedBox(width: 12),
                    // Help Option: Support access
                    _buildTopSystemButton(Icons.help_outline_rounded, Colors.white, () {}),
                  ],
                ),
              ],
            ),
          ),

          // 3. TRACKING SLIDE PANEL
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.55,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xFF09090B),
                borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
                border: Border(top: BorderSide(color: Color(0xFF1C1C1E))),
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Order Header
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("ESTIMATED ARRIVAL", 
                              style: TextStyle(color: Color(0xFF52525B), fontSize: 10, fontWeight: FontWeight.w900, letterSpacing: 1.5)),
                            const SizedBox(height: 4),
                            const Text("09:30 AM", 
                              style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.w900, letterSpacing: -1)),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: const Color(0xFFA78BFA).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Text("ON TRACK", style: TextStyle(color: Color(0xFFA78BFA), fontSize: 10, fontWeight: FontWeight.w900)),
                        )
                      ],
                    ),

                    const SizedBox(height: 32),
                    const Divider(color: Color(0xFF1C1C1E)),
                    const SizedBox(height: 32),

                    // 4. VERTICAL PROGRESS TRACK
                    _buildTrackStep(
                      "Request Confirmed", 
                      "Service provider is assigned and ready.",
                      isActive: true, 
                      isCompleted: true
                    ),
                    _buildTrackStep(
                      "Procuring Materials", 
                      "Fetching necessary tools for ${widget.serviceName}.",
                      isActive: true, 
                      isCompleted: false
                    ),
                    _buildTrackStep(
                      "In Transit", 
                      "Technician heading to your location.",
                      isActive: false, 
                      isCompleted: false
                    ),
                    _buildTrackStep(
                      "Service Started", 
                      "ETA based on standard operating time.",
                      isActive: false, 
                      isCompleted: false,
                      isLast: true,
                    ),

                    const SizedBox(height: 32),

                    // 5. CLEAN TECHNICIAN CARD (Minimalist)
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFF111113),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: const Color(0xFF1C1C1E)),
                      ),
                      child: Row(
                        children: [
                          const CircleAvatar(
                            radius: 26,
                            backgroundColor: Color(0xFF27272A),
                            child: Icon(Icons.person, color: Colors.white24),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("AMAN DEEP", 
                                  style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w900, letterSpacing: 0.5)),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    const Text("4.92 ★", style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w900)),
                                    const SizedBox(width: 8),
                                    Container(width: 1, height: 10, color: const Color(0xFF27272A)),
                                    const SizedBox(width: 8),
                                    const Icon(Icons.verified_rounded, color: Color(0xFFA78BFA), size: 12),
                                    const SizedBox(width: 4),
                                    const Text("VERIFIED PRO", style: TextStyle(color: Color(0xFFA78BFA), fontSize: 9, fontWeight: FontWeight.w900)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: const CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 20,
                              child: Icon(Icons.call, color: Colors.black, size: 18),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // --- UI HELPERS ---

  Widget _buildTopSystemButton(IconData icon, Color color, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.black,
          shape: BoxShape.circle,
          border: Border.all(color: const Color(0xFF1C1C1E)),
        ),
        child: Icon(icon, color: color, size: 18),
      ),
    );
  }

  Widget _buildTrackStep(String title, String sub, {required bool isActive, required bool isCompleted, bool isLast = false}) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isCompleted ? const Color(0xFFA78BFA) : (isActive ? Colors.white : Colors.transparent),
                  border: Border.all(color: isCompleted ? const Color(0xFFA78BFA) : const Color(0xFF27272A), width: 2),
                ),
              ),
              if (!isLast)
                Expanded(
                  child: Container(
                    width: 1,
                    color: isCompleted ? const Color(0xFFA78BFA) : const Color(0xFF27272A),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, 
                    style: TextStyle(
                      color: isActive ? Colors.white : const Color(0xFF3F3F46), 
                      fontSize: 14, 
                      fontWeight: FontWeight.w900
                    )),
                  const SizedBox(height: 4),
                  Text(sub, 
                    style: TextStyle(
                      color: const Color(0xFF52525B), 
                      fontSize: 11, 
                      fontWeight: FontWeight.w500
                    )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}