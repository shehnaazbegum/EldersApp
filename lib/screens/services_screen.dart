import 'package:flutter/material.dart';
import 'booking_flow_screen.dart';

// Theme constants for a centralized brand identity
class LuminousTheme {
  static const Color teal = Color(0xFF006D5B);
  static const Color amber = Color(0xFFFFB300);
  static const Color bgMint = Color(0xFFF6FAF8);
  static const Color navInactive = Color(0xFF63807B);
  static const Color cardGrey = Color(0xFFE2E9E2);
}

class LuminousServicesScreen extends StatelessWidget {
  const LuminousServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LuminousTheme.bgMint,
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text(
              'Find your Vitality\nGuide',
              style: TextStyle(fontSize: 34, fontWeight: FontWeight.w900, height: 1.1, letterSpacing: -0.5),
            ),
            const SizedBox(height: 12),
            const Text(
              'Compassionate helpers chosen for their\nexpertise and warm spirit.',
              style: TextStyle(fontSize: 16, color: Colors.black54, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 25),
            
            // Reusable Filter Row
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  FilterChipWidget(label: 'All Helpers', isSelected: true),
                  SizedBox(width: 10),
                  FilterChipWidget(label: 'Distance', hasDropdown: true),
                  SizedBox(width: 10),
                  FilterChipWidget(label: 'Rating', hasDropdown: true),
                ],
              ),
            ),
            const SizedBox(height: 35),

            // Clean Provider List
            const ProviderCard(
              name: 'Elena Rodriguez',
              rating: '4.9',
              reviews: '124',
              price: '28',
              imageUrl: 'https://i.pravatar.cc/150?u=elena_p',
              bio: 'Certified Wellness Coach with 8 years of experience in senior mobility and...',
              tags: ['Mobility', 'Nutrition'],
            ),
            const ProviderCard(
              name: 'Marcus Chen',
              rating: '4.8',
              reviews: '89',
              price: '32',
              imageUrl: 'https://i.pravatar.cc/150?u=marcus_p',
              bio: 'Specializing in cognitive therapy and companionship. Passionate about art...',
              tags: ['Cognitive Care', 'Arts'],
            ),
            const ProviderCard(
              name: 'Sarah Jenkins',
              rating: '5.0',
              reviews: '215',
              price: '35',
              imageUrl: 'https://i.pravatar.cc/150?u=sarah_p',
              bio: 'Registered Nurse focusing on postoperative recovery and complex...',
              tags: ['Medical', 'Post-Op'],
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
      bottomNavigationBar: const LuminousBottomNav(activeTab: 'Services'),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: const Padding(
        padding: EdgeInsets.all(12.0),
        child: CircleAvatar(backgroundImage: NetworkImage('https://i.pravatar.cc/100?u=user_top')),
      ),
      title: const Text('Elders App', style: TextStyle(color: LuminousTheme.teal, fontWeight: FontWeight.w900, fontSize: 18)),
      actions: [
        IconButton(icon: const Icon(Icons.notifications_none_rounded, color: LuminousTheme.teal), onPressed: () {}),
        const SizedBox(width: 8),
      ],
    );
  }
}

// Separate Widget for Provider Cards for cleaner logic
class ProviderCard extends StatelessWidget {
  final String name, rating, reviews, price, imageUrl, bio;
  final List<String> tags;

  const ProviderCard({
    super.key, required this.name, required this.rating, required this.reviews, 
    required this.price, required this.imageUrl, required this.bio, required this.tags
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(32)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(borderRadius: BorderRadius.circular(20), child: Image.network(imageUrl, width: 85, height: 85, fit: BoxFit.cover)),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _verifiedBadge(),
                    const SizedBox(height: 12),
                    Text(name, style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w900)),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 18),
                        const SizedBox(width: 4),
                        Text(rating, style: const TextStyle(fontWeight: FontWeight.w900)),
                        Text(' ($reviews reviews)', style: const TextStyle(color: Colors.black45, fontSize: 13, fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('\$$price', style: const TextStyle(color: LuminousTheme.teal, fontSize: 26, fontWeight: FontWeight.w900)),
                  const Text('per hour', style: TextStyle(color: Colors.black45, fontSize: 12, fontWeight: FontWeight.w600)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(bio, style: const TextStyle(color: Colors.black54, fontSize: 14, height: 1.4, fontWeight: FontWeight.w500)),
          const SizedBox(height: 16),
          Wrap(
            spacing: 12,
            children: tags.map((tag) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(color: const Color(0xFFF1F6F1), borderRadius: BorderRadius.circular(10)),
              child: Text(tag, style: const TextStyle(color: LuminousTheme.teal, fontWeight: FontWeight.w700, fontSize: 12)),
            )).toList(),
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            height: 54,
            child: ElevatedButton(
              onPressed: () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const BookingFlowFinal(),
    ),
  );
},
              style: ElevatedButton.styleFrom(backgroundColor: LuminousTheme.teal, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)), elevation: 0),
              child: const Text('Book Now', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 15)),
            ),
          )
        ],
      ),
    );
  }

  Widget _verifiedBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(color: LuminousTheme.teal, borderRadius: BorderRadius.circular(8)),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.check_circle, color: Colors.white, size: 12),
          SizedBox(width: 4),
          Text('VERIFIED', style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w900)),
        ],
      ),
    );
  }
}

// Modular components for Filters and Nav
class FilterChipWidget extends StatelessWidget {
  final String label;
  final bool isSelected, hasDropdown;
  const FilterChipWidget({super.key, required this.label, this.isSelected = false, this.hasDropdown = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(color: isSelected ? LuminousTheme.teal : LuminousTheme.cardGrey, borderRadius: BorderRadius.circular(30)),
      child: Row(
        children: [
          if (isSelected) const Icon(Icons.tune, color: Colors.white, size: 16),
          if (isSelected) const SizedBox(width: 8),
          Text(label, style: TextStyle(color: isSelected ? Colors.white : Colors.black87, fontWeight: FontWeight.w700)),
          if (hasDropdown) const Icon(Icons.keyboard_arrow_down, size: 18),
        ],
      ),
    );
  }
}

class LuminousBottomNav extends StatelessWidget {
  final String activeTab;
  const LuminousBottomNav({super.key, required this.activeTab});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 95,
      padding: const EdgeInsets.only(top: 8),
      decoration: BoxDecoration(color: Colors.white, border: Border(top: BorderSide(color: Colors.black.withValues(alpha: 0.05)))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _navItem(Icons.home_outlined, 'Home', activeTab == 'Home'),
          _navItem(Icons.shopping_bag, 'Services', activeTab == 'Services'),
          _navItem(Icons.group_outlined, 'Community', activeTab == 'Community'),
          _navItem(Icons.person_outline, 'Profile', activeTab == 'Profile'),
        ],
      ),
    );
  }

  Widget _navItem(IconData icon, String label, bool isActive) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        isActive 
          ? Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              decoration: BoxDecoration(color: const Color(0xFFFEF4CF), borderRadius: BorderRadius.circular(20)),
              child: const Icon(Icons.shopping_bag, color: Color(0xFF334D48), size: 26),
            )
          : Icon(icon, color: LuminousTheme.navInactive, size: 28),
        const SizedBox(height: 6),
        Text(label, style: TextStyle(color: isActive ? LuminousTheme.teal : LuminousTheme.navInactive, fontWeight: isActive ? FontWeight.w900 : FontWeight.w700, fontSize: 12)),
      ],
    );
  }
}