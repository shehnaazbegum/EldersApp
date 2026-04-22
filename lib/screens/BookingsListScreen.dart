import 'package:flutter/material.dart';

class BookingsListScreen extends StatelessWidget {
  const BookingsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock data based on your industrial service focus
    final List<Map<String, dynamic>> bookings = [
      {
        "id": "BK-9928-X",
        "service": "ELECTRICAL INFRASTRUCTURE",
        "status": "IN_PROGRESS",
        "date": "23 APR",
        "time": "09:30 AM",
      },
      {
        "id": "BK-8841-A",
        "service": "PLUMBING NETWORK AUDIT",
        "status": "SCHEDULED",
        "date": "25 APR",
        "time": "11:00 AM",
      },
      {
        "id": "BK-7712-Q",
        "service": "FACILITY MANAGEMENT",
        "status": "COMPLETED",
        "date": "20 APR",
        "time": "02:15 PM",
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF09090B),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white, size: 18),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("SERVICE_LEDGER", 
          style: TextStyle(color: Color(0xFF52525B), fontSize: 12, fontWeight: FontWeight.w900, letterSpacing: 2)),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(24),
        itemCount: bookings.length,
        separatorBuilder: (context, index) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
          final item = bookings[index];
          return _buildBookingRow(item, context);
        },
      ),
    );
  }

  Widget _buildBookingRow(Map<String, dynamic> item, BuildContext context) {
    bool isLive = item['status'] == "IN_PROGRESS";

    return GestureDetector(
      onTap: () {
        // Navigation to Track Screen would go here
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color(0xFF111113),
          borderRadius: BorderRadius.circular(12), // Matching your preferred radius
          border: Border.all(color: isLive ? const Color(0xFFA78BFA) : const Color(0xFF1C1C1E)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(item['id'], 
                  style: const TextStyle(color: Color(0xFF52525B), fontSize: 9, fontWeight: FontWeight.w900, letterSpacing: 1)),
                _buildStatusChip(item['status']),
              ],
            ),
            const SizedBox(height: 12),
            Text(item['service'], 
              style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w900, letterSpacing: 0.5)),
            const SizedBox(height: 20),
            const Divider(color: Color(0xFF1C1C1E), thickness: 1),
            const SizedBox(height: 16),
            Row(
              children: [
                _buildInfoBlock("SCHEDULED_DATE", item['date']),
                const SizedBox(width: 40),
                _buildInfoBlock("OP_WINDOW", item['time']),
                const Spacer(),
                if (isLive) 
                  const Icon(Icons.arrow_forward_ios_rounded, color: Color(0xFFA78BFA), size: 14),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusChip(String status) {
    Color color;
    switch (status) {
      case "IN_PROGRESS": color = const Color(0xFFA78BFA); break;
      case "COMPLETED": color = const Color(0xFF10B981); break;
      default: color = const Color(0xFF71717A);
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(status, 
        style: TextStyle(color: color, fontSize: 8, fontWeight: FontWeight.w900, letterSpacing: 0.5)),
    );
  }

  Widget _buildInfoBlock(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, 
          style: const TextStyle(color: Color(0xFF52525B), fontSize: 8, fontWeight: FontWeight.w900)),
        const SizedBox(height: 4),
        Text(value, 
          style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w900)),
      ],
    );
  }
}