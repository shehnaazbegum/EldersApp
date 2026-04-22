import 'package:flutter/material.dart';
import 'services_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF09090B),
      appBar: AppBar(
        backgroundColor: const Color(0xFF09090B),
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Your Location", style: TextStyle(color: Color(0xFF71717A), fontSize: 12)),
            Row(
              children: const [
                Text("Indiranagar, Bengaluru", 
                  style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold)),
                Icon(Icons.keyboard_arrow_down, color: Color(0xFFA78BFA), size: 18),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none_rounded, color: Colors.white),
            onPressed: () {},
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Professional Search Bar
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                height: 54,
                decoration: BoxDecoration(
                  color: const Color(0xFF18181B),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFF27272A)),
                ),
                child: Row(
                  children: const [
                    Icon(Icons.search, color: Color(0xFFA78BFA)),
                    SizedBox(width: 12),
                    Text("Search for 'Nursing Care'...", 
                      style: TextStyle(color: Color(0xFF52525B), fontSize: 15)),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // 2. Active Care Tracking Card
              _buildActiveStatusCard(),
              const SizedBox(height: 24),

                            // 7. Service Categories Grid
              const Text("Explore Services", 
                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w900)),
              const SizedBox(height: 16),
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 4,
                mainAxisSpacing: 20,
                crossAxisSpacing: 12,
                childAspectRatio: 0.8,
                children: [
                  _buildCategoryItem("Nursing", Icons.medical_services_outlined,context),
                  _buildCategoryItem("Physio", Icons.accessibility_new_rounded,context),
                  _buildCategoryItem("Companion", Icons.people_outline_rounded,context),
                  _buildCategoryItem("Emergency", Icons.emergency_share_outlined,context),
                  _buildCategoryItem("Pharmacy", Icons.medication_outlined,context),
                  _buildCategoryItem("Lab Test", Icons.biotech_outlined,context),
                  _buildCategoryItem("Dietician", Icons.restaurant_outlined,context),
                  _buildCategoryItem("More", Icons.grid_view_rounded,context),
                ],
              ),
              const SizedBox(height: 32),

              // 8. Promotional Banner
              _buildPromoBanner(context),
              const SizedBox(height: 24),

              // 5. Medicine Remainder
              const Text("Medicine Remainder", 
                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w900)),
              const SizedBox(height: 16),
              _buildMedicineRemainder(),
              const SizedBox(height: 32),

              // 👉 ADD THIS WHERE YOU WANT (after medicine remainder)
_buildImageSection(),
const SizedBox(height: 32),

              // 6. NEW: Social Events (Premium Card Style)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("Social Events", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w900)),
                  Text("View all", style: TextStyle(color: Color(0xFFA78BFA), fontSize: 12, fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(height: 16),
              _buildSocialEvents(),
              const SizedBox(height: 32),

              // 3. NEW: Wallet & Chat Quick Actions (Professional Row)
              Row(
                children: [
                  _buildQuickAction("Wallet", Icons.account_balance_wallet_rounded, "₹2,450", const Color(0xFF34D399)),
                  const SizedBox(width: 10),
                  _buildQuickAction("Peer Chat", Icons.forum_rounded, "Join Room", const Color(0xFF60A5FA)),
                  const SizedBox(width: 10),
                  _buildQuickAction("AI Assistant", Icons.auto_awesome_rounded, "Ask GPT", const Color(0xFFA78BFA)),
                ],
              ),
              const SizedBox(height: 32),

            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  // Helper for Wallet/Chat Quick Actions
  Widget _buildQuickAction(String label, IconData icon, String subtext, Color iconColor) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        decoration: BoxDecoration(
          color: const Color(0xFF18181B),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFF27272A)),
        ),
        child: Column(
          children: [
            Icon(icon, color: iconColor, size: 22),
            const SizedBox(height: 8),
            Text(label, style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold)),
            const SizedBox(height: 2),
            Text(subtext, style: const TextStyle(color: Color(0xFF71717A), fontSize: 9)),
          ],
        ),
      ),
    );
  }

Widget _buildSocialEvents() {
  return Column(
    children: [
      // Event 1: Senior Morning Yoga
      _buildSingleEventCard(
        day: "SAT",
        date: "25",
        tag: "COMMUNITY",
        tagColor: const Color(0xFFFBBF24),
        time: "6:30 AM",
        title: "Senior Morning Yoga",
        location: "Cubbon Park, Bengaluru",
        bgIcon: Icons.celebration_rounded,
      ),
      const SizedBox(height: 16),

      // Event 2: Digital Literacy
      _buildSingleEventCard(
        day: "MON",
        date: "27",
        tag: "LEARNING",
        tagColor: const Color(0xFFA78BFA),
        time: "11:00 AM",
        title: "Digital Literacy Workshop",
        location: "Indiranagar Library",
        bgIcon: Icons.devices_rounded,
      ),
      const SizedBox(height: 16),

      // Event 3: Health Checkup
      _buildSingleEventCard(
        day: "WED",
        date: "29",
        tag: "HEALTH",
        tagColor: const Color(0xFF34D399),
        time: "10:30 AM",
        title: "General Health Checkup",
        location: "Community Center",
        bgIcon: Icons.medical_services_rounded,
      ),
    ],
  );
}

// 👉 IMAGE FROM URL
Widget _buildImageSection() {
  return Container(
    width: double.infinity,
    height: 160,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: const Color(0xFF27272A)),
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Image.network(
        'https://seniorsafetyapp.com/wp-content/uploads/2024/04/Senior-Safety-App-Beyond-Tracking-How-Family-Locator-App-Redefines-Elder-Care.png', // 🔥 replace with your URL
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return const Center(
            child: CircularProgressIndicator(
              color: Color(0xFFA78BFA),
            ),
          );
        },
        errorBuilder: (context, error, stackTrace) {
          return const Center(
            child: Icon(Icons.broken_image, color: Color(0xFF71717A)),
          );
        },
      ),
    ),
  );
}

// Your exact logic converted into a reusable helper to keep code clean
Widget _buildSingleEventCard({
  required String day,
  required String date,
  required String tag,
  required Color tagColor,
  required String time,
  required String title,
  required String location,
  required IconData bgIcon,
}) {
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
      color: const Color(0xFF18181B),
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: const Color(0xFF27272A)),
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Stack(
        children: [
          // Subtle background decorative element
          Positioned(
            right: -10,
            top: -10,
            child: Icon(
              bgIcon,
              size: 80,
              color: tagColor.withOpacity(0.05),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                // Event Date/Icon Box
                Container(
                  height: 60,
                  width: 54,
                  decoration: BoxDecoration(
                    color: const Color(0xFF09090B),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0xFF27272A)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(day, 
                        style: TextStyle(color: const Color(0xFFA78BFA), fontSize: 10, fontWeight: FontWeight.bold)),
                      Text(date, 
                        style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w900)),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                
                // Event Details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                              color: tagColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(tag, 
                              style: TextStyle(color: tagColor, fontSize: 8, fontWeight: FontWeight.w900)),
                          ),
                          const SizedBox(width: 8),
                          Text(time, 
                            style: const TextStyle(color: Color(0xFF71717A), fontSize: 11, fontWeight: FontWeight.w600)),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        title,
                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 15),
                      ),
                      const SizedBox(height: 2),
                      Row(
                        children: [
                          const Icon(Icons.location_on_outlined, color: Color(0xFF71717A), size: 12),
                          const SizedBox(width: 4),
                          Text(location, 
                            style: const TextStyle(color: Color(0xFF71717A), fontSize: 12)),
                        ],
                      ),
                    ],
                  ),
                ),

                // Premium Action Button
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(
                    "Join",
                    style: TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.w900),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}


Widget _buildMedicineRemainder() {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: const Color(0xFF18181B),
      borderRadius: BorderRadius.circular(24),
      border: Border.all(color: const Color(0xFF27272A)),
    ),
    child: Column(
      children: [
        // Top Summary Row
        Row(
          children: [
            // Compact Progress Ring
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 40,
                  height: 40,
                  child: CircularProgressIndicator(
                    value: 0.66,
                    strokeWidth: 4,
                    backgroundColor: const Color(0xFF09090B),
                    valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF34D399)),
                  ),
                ),
                const Text("2/3", 
                  style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w900)),
              ],
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text("Medication Schedule", 
                  style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w900)),
                Text("Your next dose is at 9:00 PM", 
                  style: TextStyle(color: Color(0xFF71717A), fontSize: 11)),
              ],
            ),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios_rounded, color: Color(0xFF3F3F46), size: 14),
          ],
        ),
        const SizedBox(height: 20),
        
        // Horizontal Dosage Cards
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          child: Row(
            children: [
              _buildMedBento("Metformin", "8:30 AM", true),
              const SizedBox(width: 12),
              _buildMedBento("Multivitamins", "1:30 PM", true),
              const SizedBox(width: 12),
              _buildMedBento("Vitamin D3", "9:00 PM", false),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _buildMedBento(String name, String time, bool isTaken) {
  return Container(
    width: 130,
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: isTaken ? const Color(0xFF09090B).withOpacity(0.5) : const Color(0xFF09090B),
      borderRadius: BorderRadius.circular(16),
      border: Border.all(
        color: isTaken ? const Color(0xFF18181B) : const Color(0xFF27272A),
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              isTaken ? Icons.check_circle_rounded : Icons.radio_button_unchecked, 
              color: isTaken ? const Color(0xFF34D399) : const Color(0xFFA78BFA), 
              size: 16,
            ),
            Text(time, style: const TextStyle(color: Color(0xFF52525B), fontSize: 10, fontWeight: FontWeight.bold)),
          ],
        ),
        const SizedBox(height: 12),
        Text(
          name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: isTaken ? const Color(0xFF71717A) : Colors.white,
            fontSize: 13,
            fontWeight: FontWeight.w700,
            decoration: isTaken ? TextDecoration.lineThrough : null,
          ),
        ),
      ],
    ),
  );
}


Widget _buildCategoryItem(String title, IconData icon, BuildContext context) {
  return GestureDetector(
    onTap: () {
      if (title == "More") {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ServicesPage()),
        );
      }
    },
    child: Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFF18181B),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFF27272A)),
          ),
          child: Icon(icon, color: const Color(0xFFA78BFA), size: 28),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: const TextStyle(
            color: Color(0xFFA1A1AA),
            fontSize: 11,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    ),
  );
}

  Widget _buildActiveStatusCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E22),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF3F3F46)),
      ),
      child: Row(
        children: [
          const CircleAvatar(radius: 24, backgroundColor: Color(0xFF7C3AED), child: Icon(Icons.person, color: Colors.white)),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text("Nurse Sunita is arriving", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
                Text("Scheduled for 4:00 PM today", style: TextStyle(color: Color(0xFF71717A), fontSize: 12)),
              ],
            ),
          ),
          const Icon(Icons.call, color: Color(0xFFA78BFA), size: 20),
        ],
      ),
    );
  }

Widget _buildPromoBanner(BuildContext context) {
  return Container(
    width: double.infinity,
    height: 160,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      gradient: const LinearGradient(
        colors: [Color(0xFF2E1065), Color(0xFF7C3AED)],
      ),
    ),
    child: Stack(
      children: [
        Positioned(
          right: -20,
          bottom: -20,
          child: Icon(
            Icons.health_and_safety,
            size: 150,
            color: Colors.white.withOpacity(0.1),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Health Checkup\n@ 49% OFF",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const Spacer(),
              SizedBox(
                height: 40,
                child: ElevatedButton(
                  onPressed: () {
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    "Book Now",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
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

  Widget _buildBottomNav() {
    return BottomNavigationBar(
      backgroundColor: const Color(0xFF0F0F12),
      type: BottomNavigationBarType.fixed,
      selectedItemColor: const Color(0xFFA78BFA),
      unselectedItemColor: const Color(0xFF71717A),
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.calendar_month_outlined), label: "Bookings"),
        BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline), label: "Help"),
        BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: "Profile"),
      ],
    );
  }
}