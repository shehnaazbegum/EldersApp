import 'package:flutter/material.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF09090B), // Consistent Deep Black
      appBar: AppBar(
        backgroundColor: const Color(0xFF09090B),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "All Services",
          style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w900),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Professional Care & Support",
              style: TextStyle(color: Color(0xFF71717A), fontSize: 13, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 24),
            
            // Large Vertical Service Stack
            _buildServiceBentoCard(
              title: "Grocery Delivery",
              desc: "Get fresh vegetables and household essentials delivered to your door.",
              icon: Icons.shopping_basket_outlined,
              accentColor: const Color(0xFF34D399),
              imageUrl: "https://images.unsplash.com/photo-1542838132-92c53300491e?auto=format&fit=crop&w=800&q=80",
            ),
            const SizedBox(height: 16),
            
            _buildServiceBentoCard(
              title: "Nursing Care",
              desc: "Qualified nurses for injections, dressing, and 24/7 medical monitoring.",
              icon: Icons.medical_services_outlined,
              accentColor: const Color(0xFFA78BFA),
              imageUrl: "https://images.unsplash.com/photo-1576091160550-2173dba999ef?auto=format&fit=crop&w=800&q=80",
            ),
            const SizedBox(height: 16),
            
            _buildServiceBentoCard(
              title: "Home Maintenance",
              desc: "Expert help for plumbing, electrical fixes, and appliance repairs.",
              icon: Icons.handyman_outlined,
              accentColor: const Color(0xFF60A5FA),
              imageUrl: "https://images.unsplash.com/photo-1581578731522-745d05cb9704?auto=format&fit=crop&w=800&q=80",
            ),
            const SizedBox(height: 16),
            
            _buildServiceBentoCard(
              title: "Companion Support",
              desc: "Friendly assistance for walks, hospital visits, and conversation.",
              icon: Icons.people_outline_rounded,
              accentColor: const Color(0xFFFBBF24),
              imageUrl: "https://images.unsplash.com/photo-1581578731522-745d05cb9704?auto=format&fit=crop&w=800&q=80",
            ),
            
            const SizedBox(height: 32),
            
            // Emergency Quick Action (High Contrast)
            _buildEmergencyCallCard(),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildServiceBentoCard({
    required String title,
    required String desc,
    required IconData icon,
    required Color accentColor,
    required String imageUrl,
  }) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF18181B), // Consistent with Dashboard card color
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFF27272A)),
      ),
      child: Column(
        children: [
          // Image Header with Gradient Overlay
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(23)),
                child: Image.network(
                  imageUrl,
                  height: 140,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        const Color(0xFF18181B).withOpacity(0.9),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: accentColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(icon, color: accentColor, size: 22),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white, 
                        fontSize: 20, 
                        fontWeight: FontWeight.w900
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  desc,
                  style: const TextStyle(
                    color: Color(0xFF71717A), 
                    fontSize: 14, 
                    height: 1.5,
                    fontWeight: FontWeight.w500
                  ),
                ),
                const SizedBox(height: 20),
                // Premium Styled Action Button
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    "Select Service",
                    style: TextStyle(
                      color: Colors.black, 
                      fontSize: 15, 
                      fontWeight: FontWeight.w900
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmergencyCallCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF450A0A), // Deep Emergency Red
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFF991B1B)),
      ),
      child: Row(
        children: [
          const Icon(Icons.emergency_rounded, color: Color(0xFFF87171), size: 32),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text("Need Help Now?", 
                  style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w900)),
                Text("Instant Emergency Support", 
                  style: TextStyle(color: Color(0xFFF87171), fontSize: 12)),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: const Color(0xFFF87171),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Text("SOS", 
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900)),
          ),
        ],
      ),
    );
  }
}