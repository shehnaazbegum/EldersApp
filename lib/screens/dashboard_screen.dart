import 'package:flutter/material.dart';
import 'chat_screen.dart';
import 'services_screen.dart';
import '../main.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6FAF8), // Precise Luminous background
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: CircleAvatar(
            backgroundColor: const Color(0xFFD3DFD3),
            child: ClipOval(
              child: Image.network('https://randomuser.me/api/portraits/men/75.jpg'), 
            ),
          ),
        ),
        title: const Text(
          'Elders App',
          style: TextStyle(color: Color(0xFF006D5B), fontWeight: FontWeight.w900, fontSize: 20),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none_rounded, color: Color(0xFF006D5B)),
            onPressed: () {},
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Hello, Eleanor.', style: TextStyle(fontSize: 34, fontWeight: FontWeight.w900, letterSpacing: -1.0)),
            const Text('Your sanctuary is ready for the day.', style: TextStyle(fontSize: 16, color: Colors.black45, fontWeight: FontWeight.w500)),
            const SizedBox(height: 25),

            // Search Bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(color: const Color(0xFFE2E9E2), borderRadius: BorderRadius.circular(12)),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Search services or help...',
                  hintStyle: TextStyle(color: Colors.black38, fontSize: 15),
                  icon: Icon(Icons.search, color: Color(0xFF006D5B), size: 20),
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 25),

            // Heart Vitality Card
            _buildMedicineCard(),
            const SizedBox(height: 30),

            // Services Grid (2x2)
            Row(
              children: [
                Expanded(child: _buildServiceTile(Icons.shopping_basket_outlined, 'Grocery')),
                const SizedBox(width: 16),
                Expanded(child: _buildServiceTile(Icons.medical_services_outlined, 'Medicine')),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(child: _buildServiceTile(Icons.medical_information_outlined, 'Help at Home')),
                const SizedBox(width: 16),
                Expanded(child: _buildServiceTile(Icons.more_horiz, 'All Services')),
              ],
            ),
            const SizedBox(height: 40),

            // Upcoming Bookings Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Your Bookings', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900, height: 1.1)),
                const Text('View all', textAlign: TextAlign.right, style: TextStyle(color: Color(0xFF006D5B), fontWeight: FontWeight.w800, fontSize: 13)),
              ],
            ),
            const SizedBox(height: 16),
            _buildBookingCard('Hospital Transport', 'Tomorrow,\n09:30 AM', 'Confirmed', const Color(0xFFE0F2F1), const Color(0xFF006D5B), Icons.directions_car_filled_rounded),
            _buildBookingCard('Home Cleaning', 'Fri, Oct 27 •\n2:00 PM', 'Pending', const Color(0xFFF5F5F5), Colors.black45, Icons.cleaning_services_rounded),
            
            const SizedBox(height: 40),

            // Care Wallet
            _buildWalletCard(),
            const SizedBox(height: 40),

            // Connect & Support Section
            const Text('Connect & Support', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900)),
            const SizedBox(height: 16),
_buildSupportItem(
  'Lumi AI Guide',
  'Ask me anything about your care',
  const Color(0xFFF6FAF8),
  'https://i.pravatar.cc/100?u=ai',
  context,
),

const SizedBox(height: 12),

_buildSupportItem(
  'Peer Support Chat',
  '3 active conversations now',
  const Color(0xFFFFF9E6),
  null,
  context,
),
            const SizedBox(height: 40),

            // SOS Section
            _buildSOSCard(),
            const SizedBox(height: 120),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNav(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xFF006D5B),
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: Colors.white, size: 30),
      ),
    );
  }

  Widget _buildMedicineCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(color: const Color(0xFF00897B), borderRadius: BorderRadius.circular(28)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.2), borderRadius: BorderRadius.circular(20)),
            child: const Row(mainAxisSize: MainAxisSize.min, children: [
              Icon(Icons.access_time_filled_rounded, color: Colors.white, size: 14),
              SizedBox(width: 6),
              Text('NEXT MEDICINE', style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w900)),
            ]),
          ),
          const SizedBox(height: 16),
          const Text('Heart Vitality', style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.w900)),
          const Text("It's time for your morning ACE inhibitor. Take with a glass of water after breakfast.",
            style: TextStyle(color: Colors.white70, fontSize: 15, height: 1.4)),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFFB300),
              foregroundColor: Colors.black,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
              elevation: 0,
            ),
            child: const Text("I've Taken It", style: TextStyle(fontWeight: FontWeight.w900)),
          ),
        ],
      ),
    );
  }

Widget _buildServiceTile(IconData icon, String label) {
  return GestureDetector(
    onTap: () {
      if (label == 'All Services') {
        Navigator.push(
          navigatorKey.currentContext!,
          MaterialPageRoute(
            builder: (context) => const LuminousServicesScreen(),
          ),
        );
      }
    },
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 24),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)),
      child: Column(children: [
        CircleAvatar(backgroundColor: const Color(0xFFF1F6F1), child: Icon(icon, color: const Color(0xFF006D5B))),
        const SizedBox(height: 12),
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
      ]),
    ),
  );
}

  Widget _buildBookingCard(String title, String time, String status, Color stBg, Color stColor, IconData icon) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)),
      child: Row(children: [
        CircleAvatar(backgroundColor: const Color(0xFFF1F6F1), child: Icon(icon, color: const Color(0xFF006D5B), size: 20)),
        const SizedBox(width: 16),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 15)),
          Text(time, style: const TextStyle(color: Colors.black38, fontSize: 13, height: 1.2)),
        ])),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(color: stBg, borderRadius: BorderRadius.circular(10)),
          child: Text(status, style: TextStyle(color: stColor, fontSize: 11, fontWeight: FontWeight.w900)),
        )
      ]),
    );
  }

  Widget _buildWalletCard() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text('Care Wallet', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16)),
          Icon(Icons.account_balance_wallet_outlined, color: Colors.black26),
        ]),
        const SizedBox(height: 16),
        const Text('AVAILABLE CREDITS', style: TextStyle(color: Colors.black38, fontSize: 11, fontWeight: FontWeight.w900)),
        const Text('\$1,240.50', style: TextStyle(fontSize: 34, fontWeight: FontWeight.w900, color: Color(0xFF006D5B))),
        const SizedBox(height: 20),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFE2E9E2),
              foregroundColor: Colors.black87,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              padding: const EdgeInsets.symmetric(vertical: 18),
              elevation: 0,
            ),
            child: const Text('Add Funds', style: TextStyle(fontWeight: FontWeight.w900)),
          ),
        ),
      ]),
    );
  }

Widget _buildSupportItem(String title, String sub, Color bg, String? img, BuildContext context) {
  return InkWell(
    borderRadius: BorderRadius.circular(16),
    onTap: () {
      if (title == 'Peer Support Chat') {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const LuminousChatScreen(),
          ),
        );
      }
    },
    child: Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: img == null ? const Color(0xFFFFEAB4) : Colors.transparent,
            backgroundImage: img != null ? NetworkImage(img) : null,
            child: img == null ? const Icon(Icons.people, color: Colors.orange) : null,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.w900)),
                Text(sub, style: const TextStyle(color: Colors.black38, fontSize: 12)),
              ],
            ),
          ),
          const Icon(Icons.chevron_right, color: Colors.black26),
        ],
      ),
    ),
  );
}

  Widget _buildSOSCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: const Color(0xFFFFF1F1), borderRadius: BorderRadius.circular(28)),
      child: Column(children: [
        const Row(children: [
          CircleAvatar(backgroundColor: Color(0xFFE53935), child: Icon(Icons.emergency, color: Colors.white, size: 20)),
          SizedBox(width: 16),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('SOS Emergency', style: TextStyle(fontWeight: FontWeight.w900, color: Color(0xFFB71C1C))),
            Text('Immediate help dispatch', style: TextStyle(color: Colors.redAccent, fontSize: 12)),
          ]),
        ]),
        const SizedBox(height: 20),
        Container(
          width: double.infinity,
          height: 64,
          decoration: BoxDecoration(
            color: const Color(0xFFE53935),
            borderRadius: BorderRadius.circular(18),
            boxShadow: [BoxShadow(color: Colors.red.withValues(alpha: 0.3), blurRadius: 15, offset: const Offset(0, 8))],
          ),
          alignment: Alignment.center,
          child: const Text('HOLD FOR 3S', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 18)),
        ),
      ]),
    );
  }

  Widget _buildBottomNav() {
    return Container(
      height: 90,
      decoration: BoxDecoration(color: Colors.white, border: Border(top: BorderSide(color: Colors.black.withValues(alpha: 0.05)))),
      child: BottomNavigationBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF006D5B),
        unselectedItemColor: Colors.black26,
        currentIndex: 0,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w900, fontSize: 11),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.medical_services_outlined), label: 'Services'),
          BottomNavigationBarItem(icon: Icon(Icons.people_outline), label: 'Community'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile'),
        ],
      ),
    );
  }
}