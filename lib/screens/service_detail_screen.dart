import 'package:flutter/material.dart';
import 'final_checkout_screen.dart';

class ServiceDetailScreen extends StatelessWidget {
  final String serviceName;
  final String price;

  const ServiceDetailScreen({
    super.key, 
    required this.serviceName, 
    required this.price
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF09090B),
      body: Stack(
        children: [
          CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              // 1. ELITE PARALLAX HEADER
              SliverAppBar(
                expandedHeight: 280,
                backgroundColor: const Color(0xFF09090B),
                elevation: 0,
                leading: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.black.withOpacity(0.5),
                    child: IconButton(
                      icon: const Icon(Icons.close, color: Colors.white, size: 18),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ),
                flexibleSpace: FlexibleSpaceBar(
                  background: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.network(
                        "https://beyondwellhomecare.com/wp-content/uploads/2023/06/Ways-Aging-Adults-Can-Make-Grocery-Shopping-Easier.jpeg",
                        fit: BoxFit.cover,
                      ),
                      const DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.transparent, Color(0xFF09090B)],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 2. INDUSTRIAL TITLE & PRICING
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              serviceName,
                              style: const TextStyle(
                                color: Colors.white, 
                                fontSize: 26, 
                                fontWeight: FontWeight.w900,
                                letterSpacing: -0.5,
                              ),
                            ),
                          ),
                          _buildPriceBadge(),
                        ],
                      ),
                      const SizedBox(height: 12),
                      _buildMetaStats(),
                      const SizedBox(height: 40),

                      // 3. CORE DELIVERABLES (Bento-Minimalism)
                      const Text(
                        "SERVICE STANDARDS",
                        style: TextStyle(
                          color: Color(0xFF71717A), 
                          fontSize: 11, 
                          fontWeight: FontWeight.w900, 
                          letterSpacing: 1.5,
                        ),
                      ),
                      const SizedBox(height: 24),
                      _buildStandardRow(Icons.verified_outlined, "Verified Specialist", "Licensed professional with background verification."),
                      _buildStandardRow(Icons.shield_moon_outlined, "Safety Protocol", "Strict adherence to safety and hygiene standards."),
                      _buildStandardRow(Icons.timer_outlined, "On-Time Guarantee", "Arrival within 15 minutes of the scheduled slot."),
                      
                      const SizedBox(height: 40),

                      // 4. TRANSPARENCY SECTION
                      _buildTransparencyBox(),
                      const SizedBox(height: 140), // Scroll padding for sticky bar
                    ],
                  ),
                ),
              ),
            ],
          ),

          // 5. STICKY INTERACTION BAR
          Align(
            alignment: Alignment.bottomCenter,
            child: _buildStickyBottomBar(context),
          ),
        ],
      ),
    );
  }

  Widget _buildPriceBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFF18181B),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: const Color(0xFF27272A)),
      ),
      child: Text(
        price,
        style: const TextStyle(color: Color(0xFFA78BFA), fontSize: 16, fontWeight: FontWeight.w900),
      ),
    );
  }

  Widget _buildMetaStats() {
    return Row(
      children: [
        const Icon(Icons.star_rounded, color: Color(0xFFFBBF24), size: 16),
        const SizedBox(width: 4),
        const Text("4.8", style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold)),
        const SizedBox(width: 8),
        Text("(2.4k reviews)", style: TextStyle(color: const Color(0xFF71717A), fontSize: 12)),
        const SizedBox(width: 16),
        const Icon(Icons.schedule, color: Color(0xFF71717A), size: 14),
        const SizedBox(width: 4),
        const Text("60 mins", style: TextStyle(color: Color(0xFF71717A), fontSize: 12, fontWeight: FontWeight.w600)),
      ],
    );
  }

  Widget _buildStandardRow(IconData icon, String title, String desc) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.white, size: 20),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w800)),
                const SizedBox(height: 4),
                Text(desc, style: const TextStyle(color: Color(0xFF71717A), fontSize: 12, height: 1.4)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTransparencyBox() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF18181B),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF27272A)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text("BOOKING POLICY", style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w900, letterSpacing: 1.0)),
          SizedBox(height: 12),
          Text(
            "Free cancellation before the specialist departs. A nominal fee applies for late cancellations to compensate the professional's travel.",
            style: TextStyle(color: Color(0xFF71717A), fontSize: 11, height: 1.5),
          ),
        ],
      ),
    );
  }

// ... existing code ...

  Widget _buildStickyBottomBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 20, 24, 40),
      decoration: BoxDecoration(
        color: const Color(0xFF09090B).withOpacity(0.9),
        border: const Border(top: BorderSide(color: Color(0xFF18181B))),
      ),
      child: Row(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(price, style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w900)),
              const Text("Tax inclusive", style: TextStyle(color: Color(0xFF71717A), fontSize: 11)),
            ],
          ),
          const SizedBox(width: 32),
          Expanded(
            child: SizedBox(
              height: 54,
              child: ElevatedButton(
                onPressed: () => _showSchedulingSheet(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  elevation: 0,
                ),
                child: const Text("SCHEDULE NOW", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w900, letterSpacing: 0.5)),
              ),
            ),
          ),
        ],
      ),
    );
  }

void _showSchedulingSheet(BuildContext context) {
  DateTime selectedDate = DateTime.now();
  int selectedHour = 9;
  int selectedMinute = 30;
  String period = "AM";

  showModalBottomSheet(
    context: context,
    backgroundColor: const Color(0xFF09090B),
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
    ),
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setSheetState) {
          List<DateTime> availableDates = List.generate(3, (i) => DateTime.now().add(Duration(days: i)));

          return Container(
            height: MediaQuery.of(context).size.height * 0.65,
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Column(
              children: [
                // 1. TOP STATUS BAR
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("CONFIGURATION MODE", 
                            style: TextStyle(color: Color(0xFF52525B), fontSize: 9, fontWeight: FontWeight.w900, letterSpacing: 1.5)),
                          const SizedBox(height: 4),
                          Text("${selectedDate.day} APR • ${selectedHour.toString().padLeft(2, '0')}:${selectedMinute.toString().padLeft(2, '0')} $period",
                            style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w900)),
                        ],
                      ),
                      const Icon(Icons.settings_input_component_rounded, color: Color(0xFF27272A), size: 20),
                    ],
                  ),
                ),
                const SizedBox(height: 32),

                // 2. THE MATRIX SPLIT
                Expanded(
                  child: Row(
                    children: [
                      // LEFT RAIL: DATE SELECTOR
                      Container(
                        width: 100,
                        decoration: const BoxDecoration(
                          border: Border(right: BorderSide(color: Color(0xFF18181B), width: 1)),
                        ),
                        child: ListView.builder(
                          itemCount: availableDates.length,
                          itemBuilder: (context, index) {
                            DateTime date = availableDates[index];
                            bool isSelected = selectedDate.day == date.day;
                            return GestureDetector(
                              onTap: () => setSheetState(() => selectedDate = date),
                              child: Container(
                                padding: const EdgeInsets.symmetric(vertical: 24),
                                decoration: BoxDecoration(
                                  border: Border(left: BorderSide(color: isSelected ? const Color(0xFFA78BFA) : Colors.transparent, width: 3)),
                                  color: isSelected ? const Color(0xFF18181B) : Colors.transparent,
                                ),
                                child: Column(
                                  children: [
                                    Text("${date.day}", style: TextStyle(color: isSelected ? Colors.white : const Color(0xFF3F3F46), fontSize: 24, fontWeight: FontWeight.w900)),
                                    Text(index == 0 ? "TODAY" : "APR", style: TextStyle(color: isSelected ? const Color(0xFFA78BFA) : const Color(0xFF27272A), fontSize: 9, fontWeight: FontWeight.w900)),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),

                      // RIGHT RAIL: PRECISION DRUM (Non-fixed list)
                      Expanded(
                        child: ListWheelScrollView.useDelegate(
                          itemExtent: 60,
                          perspective: 0.005,
                          diameterRatio: 1.2,
                          physics: const FixedExtentScrollPhysics(),
                          onSelectedItemChanged: (index) {
                            // Logic to map index to 5 AM - 9 PM with 15-min increments
                            int totalMinutes = (5 * 60) + (index * 15);
                            setSheetState(() {
                              selectedHour = (totalMinutes ~/ 60);
                              selectedMinute = totalMinutes % 60;
                              period = selectedHour >= 12 ? "PM" : "AM";
                              if (selectedHour > 12) selectedHour -= 12;
                              if (selectedHour == 0) selectedHour = 12;
                            });
                          },
                          childDelegate: ListWheelChildBuilderDelegate(
                            childCount: 65, // Total 15-min slots from 5 AM to 9 PM
                            builder: (context, index) {
                              int totalMin = (5 * 60) + (index * 15);
                              int h = totalMin ~/ 60;
                              int m = totalMin % 60;
                              String p = h >= 12 ? "PM" : "AM";
                              int dh = h > 12 ? h - 12 : (h == 0 ? 12 : h);
                              
                              bool isCurrent = (h == (period == "PM" && selectedHour != 12 ? selectedHour + 12 : (period == "AM" && selectedHour == 12 ? 0 : selectedHour))) && m == selectedMinute;

                              return Center(
                                child: Text(
                                  "${dh.toString().padLeft(2, '0')}:${m.toString().padLeft(2, '0')} $p",
                                  style: TextStyle(
                                    color: isCurrent ? const Color(0xFFA78BFA) : Colors.white24,
                                    fontSize: isCurrent ? 24 : 16,
                                    fontWeight: isCurrent ? FontWeight.w900 : FontWeight.w500,
                                    letterSpacing: 1,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // 3. ACTION FOOTER
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 24, 24, 8),
                  child: SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton(
onPressed: () {
  // ✅ Convert to proper time string
  String formattedTime =
      "${selectedHour.toString().padLeft(2, '0')}:${selectedMinute.toString().padLeft(2, '0')} $period";

  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => FinalCheckoutScreen(
        serviceName: serviceName,
        price: price,
        selectedTime: formattedTime, // ✅ FIXED
        selectedDate: selectedDate,
      ),
    ),
  );
},                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                        elevation: 0,
                      ),
                      child: const Text("FINALIZE APPOINTMENT", style: TextStyle(fontWeight: FontWeight.w900, letterSpacing: 1.5)),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}

  
}