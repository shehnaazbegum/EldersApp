import 'package:flutter/material.dart';
import 'services_screen.dart';
import 'profile_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final Color _primaryColor = const Color(0xFFEF4F5F);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      body: CustomScrollView(
        slivers: [
          _buildSliverAppBar(context),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  _buildFilterChips(),
                  const SizedBox(height: 20),
                  _buildPromoCarousel(),
                  const SizedBox(height: 24),
                  _buildSectionTitle("Explore Services"),
                  const SizedBox(height: 16),
                  _buildServiceGrid(),
                  const SizedBox(height: 24),
                  _buildSectionTitle("Order Again"),
                  const SizedBox(height: 16),
                  _buildHorizontalReorderList(),
                  const SizedBox(height: 24),
                  _buildSectionTitle("Trending Near You"),
                  const SizedBox(height: 16),
                  _buildVerticalList(),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
        ],
      ),
      // Floating Bottom Navigation with Elder Events & SOS
      bottomNavigationBar: Container(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
        decoration: const BoxDecoration(color: Colors.transparent),
        child: Container(
          height: 65,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 20, offset: const Offset(0, 5)),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(Icons.home_filled, "Explore", true),
              _buildNavItem(Icons.history, "Orders", false),
              _buildNavItem(Icons.event_note, "Events", false),
              _buildSOSNavItem(Icons.emergency, "SOS"),
            ],
          ),
        ),
      ),
    );
  }

  // --- Nav Items ---
  Widget _buildNavItem(IconData icon, String label, bool isSelected) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: isSelected ? _primaryColor : Colors.grey.shade400, size: 22),
        const SizedBox(height: 2),
        Text(label, style: TextStyle(color: isSelected ? _primaryColor : Colors.grey.shade400, fontSize: 9, fontWeight: FontWeight.bold)),
      ],
    );
  }

  // --- SOS Nav Item ---
  Widget _buildSOSNavItem(IconData icon, String label) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: Colors.red, size: 24),
        const SizedBox(height: 2),
        Text(label, style: const TextStyle(color: Colors.red, fontSize: 9, fontWeight: FontWeight.bold)),
      ],
    );
  }

  // --- Retained Components ---
  Widget _buildSliverAppBar(BuildContext context) => SliverAppBar(
    pinned: true,
    backgroundColor: Colors.white,
    elevation: 2,
    title: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(children: [
          Icon(Icons.location_on, color: _primaryColor, size: 16),
          const Text(" Home", style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold)),
          Icon(Icons.keyboard_arrow_down, color: Colors.grey.shade600, size: 16),
        ]),
        Text("Elderly Ave, Residency Road, Bangalore", style: TextStyle(color: Colors.grey.shade600, fontSize: 11), overflow: TextOverflow.ellipsis),
      ],
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 16),
        child: GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const ProfileScreen()),
          ),
          child: const CircleAvatar(
            backgroundColor: Color(0xFFF2F2F2),
            child: Icon(Icons.person, color: Colors.black54),
          ),
        ),
      ),
    ],
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(60),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        child: Container(
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)]),
          child: const TextField(decoration: InputDecoration(hintText: "Search for medicines, grocery...", prefixIcon: Icon(Icons.search, color: Colors.red), border: InputBorder.none, contentPadding: EdgeInsets.all(12))),
        ),
      ),
    ),
  );

  Widget _buildSectionTitle(String title) => Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w900, color: Colors.black));

  Widget _buildFilterChips() => SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: ["All", "Medicines", "Grocery", "Doctor Consult", "Nursing"].map((e) => Padding(
        padding: const EdgeInsets.only(right: 8),
        child: Chip(label: Text(e), backgroundColor: Colors.white, side: BorderSide(color: Colors.grey.shade300)),
      )).toList(),
    ),
  );

  Widget _buildPromoCarousel() => SizedBox(
    height: 140,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: [
        Container(width: 300, margin: const EdgeInsets.only(right: 16), decoration: BoxDecoration(color: _primaryColor, borderRadius: BorderRadius.circular(20))),
        Container(width: 300, decoration: BoxDecoration(color: Colors.black87, borderRadius: BorderRadius.circular(20))),
      ],
    ),
  );

Widget _buildServiceGrid() {
  final services = [
    {"name": "Grocery", "icon": Icons.shopping_basket, "color": const Color(0xFFFFF1F1)},
    {"name": "Pharmacy", "icon": Icons.medication, "color": const Color(0xFFF1F7FF)},
    {"name": "Hospital", "icon": Icons.local_hospital, "color": const Color(0xFFF1FFF5)},
    {"name": "Nursing", "icon": Icons.personal_injury, "color": const Color(0xFFFFF9F1)},
    {"name": "Lab Test", "icon": Icons.science, "color": const Color(0xFFF5F1FF)},
    {"name": "Help Desk", "icon": Icons.support_agent, "color": const Color(0xFFF1FEFF)},
    {"name": "Elder Care", "icon": Icons.elderly, "color": const Color(0xFFFFF1F8)},
    {"name": "More", "icon": Icons.grid_view_rounded, "color": const Color(0xFFF5F5F5)},
  ];

  return GridView.builder(
    padding: EdgeInsets.zero,
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 4,
      mainAxisSpacing: 16,
      crossAxisSpacing: 12,
      childAspectRatio: 0.85,
    ),
    itemCount: services.length,
    itemBuilder: (ctx, i) => InkWell(
      onTap: () {
        if (services[i]["name"] == "More") {
          Navigator.push(
            ctx,
            MaterialPageRoute(builder: (context) => const ServicesScreen()),
          );
        } else {
          // Handle other service taps here
          print("${services[i]["name"]} tapped");
        }
      },
      borderRadius: BorderRadius.circular(16),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: services[i]["color"] as Color,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(services[i]["icon"] as IconData, color: _primaryColor, size: 26),
          ),
          const SizedBox(height: 8),
          Text(
            services[i]["name"] as String,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    ),
  );
}

  Widget _buildHorizontalReorderList() => SizedBox(
    height: 120,
    child: ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: 3,
      separatorBuilder: (_, _) => const SizedBox(width: 12),
      itemBuilder: (ctx, i) => Container(
        width: 240,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), border: Border.all(color: Colors.grey.shade200)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Daily Medicines", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
            const Text("Last order 2 days ago", style: TextStyle(fontSize: 11, color: Colors.grey)),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("₹450", style: TextStyle(fontWeight: FontWeight.bold, color: _primaryColor)),
                ElevatedButton(onPressed: () {}, style: ElevatedButton.styleFrom(backgroundColor: _primaryColor, foregroundColor: Colors.white), child: const Text("Reorder")),
              ],
            ),
          ],
        ),
      ),
    ),
  );

  Widget _buildVerticalList() {
    return ListView.separated(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 3,
      separatorBuilder: (ctx, i) => const SizedBox(height: 12),
      itemBuilder: (ctx, i) => Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
        child: Row(children: [
          Container(width: 60, height: 60, color: Colors.grey.shade200, child: const Icon(Icons.local_pharmacy)),
          const SizedBox(width: 12),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text("Apollo Pharmacy", style: TextStyle(fontWeight: FontWeight.bold)),
            Text("Distance: 1.2km • Delivery 20m", style: TextStyle(fontSize: 11, color: Colors.grey.shade600)),
          ])
        ]),
      ),
    );
  }
}