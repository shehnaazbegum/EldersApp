import 'package:flutter/material.dart';
import 'checkout_screen.dart'; // Ensure this file exists

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({super.key});

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  final Map<String, List<Map<String, dynamic>>> serviceData = {
    "Grocery": [
      {"name": "Organic Spinach", "price": "₹40", "mrp": "₹60", "stock": true, "rating": 4.5, "isPopular": true, "description": "Farm-fresh, pesticide-free."},
      {"name": "Farm Fresh Milk", "price": "₹60", "mrp": "₹75", "stock": true, "rating": 4.8, "isPopular": true, "description": "A2 Grade cow milk."},
      {"name": "Basmati Rice", "price": "₹150", "mrp": "₹199", "stock": false, "rating": 4.2, "isPopular": false, "description": "Aromatic long grain."},
    ],
    "Pharmacy": [
      {"name": "Paracetamol", "price": "₹20", "mrp": "₹25", "stock": true, "rating": 4.9, "isPopular": true, "description": "Fever and pain relief."},
    ],
  };

  String selectedCategory = "Grocery";
  int totalItems = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text("Marketplace", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900)),
      ),
      body: Row(
        children: [
          _buildSidebar(),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: serviceData[selectedCategory]!.length,
              separatorBuilder: (_, __) => const SizedBox(height: 16),
              itemBuilder: (context, i) => _buildPremiumCard(serviceData[selectedCategory]![i]),
            ),
          ),
        ],
      ),
      bottomNavigationBar: totalItems > 0 ? _buildCheckoutBar() : null,
    );
  }

  Widget _buildSidebar() => Container(
    width: 90,
    color: const Color(0xFFF9F9F9),
    child: ListView.builder(
      itemCount: serviceData.keys.length,
      itemBuilder: (context, i) {
        String cat = serviceData.keys.elementAt(i);
        bool isSelected = selectedCategory == cat;
        return GestureDetector(
          onTap: () => setState(() => selectedCategory = cat),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              color: isSelected ? Colors.white : Colors.transparent,
              border: isSelected ? const Border(left: BorderSide(color: Color(0xFFEF4F5F), width: 4)) : null,
            ),
            child: Text(cat, textAlign: TextAlign.center, style: TextStyle(fontWeight: isSelected ? FontWeight.bold : FontWeight.w500)),
          ),
        );
      },
    ),
  );

  Widget _buildPremiumCard(Map<String, dynamic> item) => Container(
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: Colors.grey.shade100),
      boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10, offset: const Offset(0, 4))],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (item["isPopular"])
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(color: const Color(0xFFFFF1F1), borderRadius: BorderRadius.circular(4)),
            child: const Text("BESTSELLER", style: TextStyle(color: Color(0xFFEF4F5F), fontSize: 10, fontWeight: FontWeight.bold)),
          ),
        const SizedBox(height: 8),
        Row(
          children: [
            Container(width: 70, height: 70, decoration: BoxDecoration(color: Colors.grey.shade100, borderRadius: BorderRadius.circular(12))),
            const SizedBox(width: 12),
            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(item["name"], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                Text(item["description"], style: TextStyle(color: Colors.grey.shade600, fontSize: 11)),
                Row(children: [
                  const Icon(Icons.star, size: 12, color: Colors.amber),
                  Text(" ${item["rating"]}", style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                ]),
              ]),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(children: [
            Text(item["price"], style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 16)),
            const SizedBox(width: 8),
            Text(item["mrp"], style: const TextStyle(decoration: TextDecoration.lineThrough, color: Colors.grey, fontSize: 12)),
          ]),
          ElevatedButton(
            onPressed: item["stock"] ? () => setState(() => totalItems++) : null,
            style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFEF4F5F), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
            child: const Text("ADD", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          )
        ])
      ],
    ),
  );

  Widget _buildCheckoutBar() => Container(
    height: 65,
    padding: const EdgeInsets.symmetric(horizontal: 20),
    decoration: const BoxDecoration(color: Color(0xFF27AE60), borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("$totalItems ITEMS SELECTED", style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const CheckoutScreen()));
          },
          child: const Text("PROCEED TO CHECKOUT ➔", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        ),
      ],
    ),
  );
}