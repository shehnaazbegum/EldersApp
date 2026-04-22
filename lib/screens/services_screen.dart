import 'package:flutter/material.dart';
import 'service_detail_screen.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF09090B),
      appBar: AppBar(
        backgroundColor: const Color(0xFF09090B),
        elevation: 0,
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white, size: 18),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "All Services",
          style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w900),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white, size: 20),
            onPressed: () {},
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Column(
        children: [
          // 1. Sticky Category Anchor Bar (High-Density Navigation)
          Container(
            height: 56,
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: Color(0xFF18181B), width: 1)),
            ),
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                _buildCategoryAnchor("Nursing", true),
                _buildCategoryAnchor("Physiotherapy", false),
                _buildCategoryAnchor("Maintenance", false),
                _buildCategoryAnchor("Groceries", false),
              ],
            ),
          ),

          // 2. Multi-Filter Layer (Marketplace Standard)
          Container(
            height: 48,
            padding: const EdgeInsets.only(bottom: 8),
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                _buildFilterChip("Sort By", Icons.swap_vert_rounded),
                _buildFilterChip("Rating 4.0+", null),
                _buildFilterChip("Price: Low to High", null),
              ],
            ),
          ),

          // 3. Main Content
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                _buildSectionHeader("Medical & Nursing"),
                _buildEliteServiceRow(
                  context,
                  "General Nursing (1hr)",
                  "Vitals check, medication, and wound dressing by certified nurses.",
                  "₹299",
                  "4.8 (1.2k+)",
                  "https://sukinohealthcare.com/wp-content/uploads/2024/09/Nursing-Care-for-Elderly-Parents.jpg",
                ),
                _buildDivider(),
                _buildEliteServiceRow(
                  context,
                  "Post-Op Recovery",
                  "Intensive 24/7 care for patients recovering from surgery.",
                  "₹1,999",
                  "4.9 (800+)",
                  "https://thumbs.dreamstime.com/b/smiling-senior-patient-sitting-wheelchair-nurse-supporting-her-doctor-looking-elderly-patient-wheelchair-125353194.jpg",
                ),
                const SizedBox(height: 40),
                
                _buildSectionHeader("Industrial Maintenance"),
                _buildEliteServiceRow(
                  context,
                  "Electrical Infrastructure",
                  "Comprehensive inspection and repair of electrical networks.",
                  "₹199",
                  "4.7 (2k+)",
                  "https://th-thumbnailer.cdn-si-edu.com/SvrtOCaBp6NbIiXaW_4tHrobbOk=/1026x684/filters:no_upscale()/https://tf-cmsv2-smithsonianmag-media.s3.amazonaws.com/filer/a2/c4/a2c467b3-c152-4edb-bb05-d7d52193812f/42-22507741.jpg",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryAnchor(String label, bool isActive) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: isActive ? const Border(bottom: BorderSide(color: Colors.white, width: 2)) : null,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Text(
        label,
        style: TextStyle(
          color: isActive ? Colors.white : const Color(0xFF71717A),
          fontSize: 13,
          fontWeight: isActive ? FontWeight.w900 : FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildFilterChip(String label, IconData? icon) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFF18181B),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFF27272A)),
      ),
      child: Row(
        children: [
          if (icon != null) Icon(icon, color: const Color(0xFFA78BFA), size: 14),
          if (icon != null) const SizedBox(width: 4),
          Text(label, style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w600)),
          const SizedBox(width: 4),
          const Icon(Icons.keyboard_arrow_down_rounded, color: Color(0xFF71717A), size: 14),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Text(title, style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w900)),
    );
  }

  Widget _buildEliteServiceRow(BuildContext context, String name, String desc, String price, String rating, String imgUrl) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w800)),
              const SizedBox(height: 4),
              Row(
                children: [
                  const Icon(Icons.star_rounded, color: Color(0xFFFBBF24), size: 14),
                  const SizedBox(width: 4),
                  Text(rating, style: const TextStyle(color: Color(0xFF71717A), fontSize: 11, fontWeight: FontWeight.w600)),
                ],
              ),
              const SizedBox(height: 8),
              Text(desc, style: const TextStyle(color: Color(0xFF71717A), fontSize: 12, height: 1.4), maxLines: 2),
              const SizedBox(height: 12),
              Text(price, style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w900)),
            ],
          ),
        ),
        const SizedBox(width: 20),
        Stack(
          alignment: Alignment.bottomCenter,
          clipBehavior: Clip.none,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(imgUrl, width: 95, height: 95, fit: BoxFit.cover),
            ),
            Positioned(
              bottom: -12,
              child: GestureDetector(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ServiceDetailScreen(serviceName: name, price: price))),
                child: Container(
                  width: 75,
                  height: 32,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.3), blurRadius: 8)],
                  ),
                  alignment: Alignment.center,
                  child: const Text("ADD", style: TextStyle(color: Color(0xFF7C3AED), fontSize: 11, fontWeight: FontWeight.w900)),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDivider() => const Padding(
    padding: EdgeInsets.symmetric(vertical: 24),
    child: Divider(color: Color(0xFF18181B), thickness: 1),
  );
}