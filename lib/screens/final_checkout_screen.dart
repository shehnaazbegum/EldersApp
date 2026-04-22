import 'package:flutter/material.dart';
import 'booking_success_screen.dart';

class FinalCheckoutScreen extends StatefulWidget {
  final String serviceName;
  final String price;
  final String selectedTime;
  final DateTime selectedDate;

  const FinalCheckoutScreen({
    super.key,
    required this.serviceName,
    required this.price,
    required this.selectedTime,
    required this.selectedDate,
  });

  @override
  State<FinalCheckoutScreen> createState() => _FinalCheckoutScreenState();
}

class _FinalCheckoutScreenState extends State<FinalCheckoutScreen> {
  int selectedTip = 0;
  String selectedPaymentMethod = "UPI"; 
  final TextEditingController _instructionController = TextEditingController();

  double get totalAmount {
    double base = double.tryParse(widget.price.replaceAll(RegExp(r'[^0-9]'), '')) ?? 0;
    return base + selectedTip + 49 + 22;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF09090B),
      appBar: AppBar(
        backgroundColor: const Color(0xFF09090B),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white, size: 18),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Confirm Order",
          style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w900, letterSpacing: -0.5),
        ),
      ),
      body: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            children: [
              _buildAddressSection(),
              const SizedBox(height: 24),
              _buildSlotSummary(),
              const SizedBox(height: 24),

              // Payment Method Selection
              _buildSectionHeader("SELECT PAYMENT METHOD"),
              const SizedBox(height: 12),
              _buildPaymentSelector(),
              const SizedBox(height: 24),

              // Instructions
              _buildSectionHeader("ADD INSTRUCTIONS"),
              const SizedBox(height: 12),
              _buildInstructionInput(),
              const SizedBox(height: 24),

              // Tipping
              _buildSectionHeader("TIP YOUR PROFESSIONAL"),
              const SizedBox(height: 12),
              _buildTipSelector(),
              const SizedBox(height: 24),

              _buildBillingBreakdown(),
              const SizedBox(height: 24),
              _buildSafetyBadge(),
              const SizedBox(height: 160), 
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: _buildStickyPaymentBar(context),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: const TextStyle(color: Color(0xFF52525B), fontSize: 10, fontWeight: FontWeight.w900, letterSpacing: 1.5),
    );
  }

  Widget _buildPaymentSelector() {
    return Column(
      children: [
        _paymentTile("UPI", "Google Pay, PhonePe, Paytm", Icons.account_balance_wallet_rounded),
        const SizedBox(height: 8),
        _paymentTile("Card", "Credit / Debit Cards", Icons.credit_card_rounded),
        const SizedBox(height: 8),
        _paymentTile("Cash", "Pay after service completion", Icons.payments_rounded),
      ],
    );
  }

  Widget _paymentTile(String title, String subtitle, IconData icon) {
    bool isSelected = selectedPaymentMethod == title;
    return GestureDetector(
      onTap: () => setState(() => selectedPaymentMethod = title),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF18181B),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: isSelected ? const Color(0xFFA78BFA) : const Color(0xFF27272A), width: 1.5),
        ),
        child: Row(
          children: [
            Icon(icon, color: isSelected ? const Color(0xFFA78BFA) : const Color(0xFF71717A), size: 20),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 14)),
                  Text(subtitle, style: const TextStyle(color: Color(0xFF71717A), fontSize: 11)),
                ],
              ),
            ),
            if (isSelected) const Icon(Icons.check_circle_rounded, color: Color(0xFFA78BFA), size: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildInstructionInput() {
    return TextField(
      controller: _instructionController,
      maxLines: 2,
      style: const TextStyle(color: Colors.white, fontSize: 14),
      decoration: InputDecoration(
        hintText: "e.g. Call before arrival...",
        hintStyle: const TextStyle(color: Color(0xFF3F3F46), fontSize: 13),
        filled: true,
        fillColor: const Color(0xFF18181B),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Color(0xFF27272A))),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Color(0xFFA78BFA))),
      ),
    );
  }

Widget _buildTipSelector() {
    List<int> tips = [10, 20, 30, 50];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: tips.map((tip) {
            bool isSelected = selectedTip == tip;
            return Expanded(
              child: GestureDetector(
                onTap: () => setState(() => selectedTip = isSelected ? 0 : tip),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  margin: EdgeInsets.only(right: tip == tips.last ? 0 : 8),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.white : const Color(0xFF111113),
                    border: Border.all(color: isSelected ? Colors.white : const Color(0xFF1C1C1E)),
                    borderRadius: BorderRadius.circular(50), // Modern border radius
                  ),
                  child: Center(
                    child: Text("₹$tip", 
                      style: TextStyle(color: isSelected ? Colors.black : Colors.white, fontSize: 13, fontWeight: FontWeight.w900)),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildAddressSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF18181B),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF27272A)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text("SERVICE ADDRESS", style: TextStyle(color: Color(0xFF71717A), fontSize: 10, fontWeight: FontWeight.w900)),
          SizedBox(height: 12),
          Text("Indiranagar, Bengaluru", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w800)),
          Text("Flat 402, 12th Main, Near Metro Station", style: TextStyle(color: Color(0xFF71717A), fontSize: 13)),
        ],
      ),
    );
  }

  Widget _buildSlotSummary() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF18181B),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF27272A)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("SCHEDULED FOR", style: TextStyle(color: Color(0xFF71717A), fontSize: 10, fontWeight: FontWeight.w900)),
          const SizedBox(height: 4),
          Text("${widget.selectedTime}, ${widget.selectedDate.day}nd April", 
            style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w800)),
        ],
      ),
    );
  }

  Widget _buildBillingBreakdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader("PAYMENT SUMMARY"),
        const SizedBox(height: 16),
        _buildBillRow("Item Total", widget.price),
        if (selectedTip > 0) _buildBillRow("Tip", "₹$selectedTip"),
        _buildBillRow("Service Fee", "₹49"),
        _buildBillRow("Taxes & Charges", "₹22"),
        const Divider(color: Color(0xFF27272A), height: 32),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Total Payable", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w900)),
            Text("₹${totalAmount.toStringAsFixed(0)}", style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w900)),
          ],
        ),
      ],
    );
  }

  Widget _buildBillRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Color(0xFF71717A), fontSize: 13, fontWeight: FontWeight.w600)),
          Text(value, style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w700)),
        ],
      ),
    );
  }

  Widget _buildSafetyBadge() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF064E3B).withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF064E3B)),
      ),
      child: const Text(
        "Our professionals follow strict safety protocols.",
        style: TextStyle(color: Color(0xFF34D399), fontSize: 12, fontWeight: FontWeight.w700),
      ),
    );
  }

  Widget _buildStickyPaymentBar(BuildContext context) {
    // Logic for dynamic button text based on selection
    String buttonText = selectedPaymentMethod == "Cash" ? "PLACE ORDER" : "PAY NOW";

    return Container(
      padding: const EdgeInsets.fromLTRB(24, 20, 24, 24),
      decoration: const BoxDecoration(
        color: Color(0xFF18181B),
        border: Border(top: BorderSide(color: Color(0xFF27272A))),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("PAYING VIA", style: TextStyle(color: Color(0xFF71717A), fontSize: 10, fontWeight: FontWeight.w900)),
              Text(selectedPaymentMethod, style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w800)),
            ],
          ),
          SizedBox(
            height: 54,
            width: 160,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BookingSuccessScreen(
                      serviceName: widget.serviceName,
                      price: "₹${totalAmount.toStringAsFixed(0)}",
                      selectedTime: widget.selectedTime,
                      selectedDate: widget.selectedDate,
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                elevation: 0,
              ),
              child: Text(buttonText, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w900, letterSpacing: 1.0)),
            ),
          ),
        ],
      ),
    );
  }
}