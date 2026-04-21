import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: LuminousChatScreen()));

class LuminousChatScreen extends StatelessWidget {
  const LuminousChatScreen({super.key});

  // Theme Colors
  static const Color tealPrimary = Color(0xFF006D5B);
  static const Color amberNurse = Color(0xFFFFB300);
  static const Color bgMint = Color(0xFFF6FAF8);
  static const Color navInactive = Color(0xFF63807B);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgMint,
      appBar: _buildAppBar(),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                const SizedBox(height: 20),
                _buildDateDivider('TODAY'),
                const SizedBox(height: 30),
                _buildMessage(
                  name: 'Nurse Elena',
                  time: '10:15 AM',
                  text: "Good morning! I've scheduled your afternoon stroll for 2:00 PM today. Would you like me to bring the lighter sweater or the cardigan?",
                  isNurse: true,
                ),
                _buildMessage(
                  time: '10:18 AM',
                  text: "The cardigan please, Elena. It feels a bit breezy today. Also, did my medication arrive?",
                  isNurse: false,
                ),
                _buildMessage(
                  name: 'Nurse Elena',
                  time: '10:20 AM',
                  text: "Yes, it's right here at the station. I'll bring it by during our walk. Are you feeling up for the longer path by the koi pond?",
                  isNurse: true,
                ),
                const SizedBox(height: 20),
                _buildQuickReplies(['Great, thanks', 'Where are you?']),
                const SizedBox(height: 10),
                _buildQuickReplies(['Maybe later']),
              ],
            ),
          ),
          _buildInputArea(),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Badge(
          alignment: Alignment.bottomRight,
          backgroundColor: Colors.green,
          padding: EdgeInsets.all(2),
          child: CircleAvatar(backgroundImage: NetworkImage('https://i.pravatar.cc/100?u=nurse')),
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Elders App Sanctuary', style: TextStyle(color: tealPrimary, fontWeight: FontWeight.w900, fontSize: 18)),
          Text('Care Team Online', style: TextStyle(color: tealPrimary.withValues(alpha: 0.6), fontSize: 12, fontWeight: FontWeight.bold)),
        ],
      ),
      actions: [
        IconButton(icon: const Icon(Icons.notifications, color: tealPrimary), onPressed: () {}),
      ],
    );
  }

  Widget _buildDateDivider(String label) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        decoration: BoxDecoration(color: const Color(0xFFE2E9E2), borderRadius: BorderRadius.circular(12)),
        child: Text(label, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w900, color: Colors.black38, letterSpacing: 1)),
      ),
    );
  }

  Widget _buildMessage({String? name, required String time, required String text, required bool isNurse}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: isNurse ? CrossAxisAlignment.start : CrossAxisAlignment.end,
        children: [
          Text('${name ?? ""} $time ${!isNurse ? "Me" : ""}'.trim(), 
            style: const TextStyle(fontSize: 11, color: Colors.black45, fontWeight: FontWeight.w600)),
          const SizedBox(height: 6),
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: isNurse ? amberNurse : tealPrimary,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(20),
                topRight: const Radius.circular(20),
                bottomLeft: Radius.circular(isNurse ? 0 : 20),
                bottomRight: Radius.circular(isNurse ? 20 : 0),
              ),
            ),
            child: Text(text, style: TextStyle(color: isNurse ? Colors.black : Colors.white, fontSize: 15, fontWeight: FontWeight.w500, height: 1.3)),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickReplies(List<String> replies) {
    return Row(
      children: replies.map((r) => Container(
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        decoration: BoxDecoration(color: const Color(0xFFE2E9E2), borderRadius: BorderRadius.circular(20)),
        child: Text(r, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 14)),
      )).toList(),
    );
  }

  Widget _buildInputArea() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(30),
                boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10)]),
              child: const Row(
                children: [
                  Icon(Icons.sentiment_satisfied_alt_outlined, color: Colors.black38),
                  SizedBox(width: 10),
                  Expanded(child: TextField(decoration: InputDecoration(hintText: 'Type a message...', border: InputBorder.none))),
                  Icon(Icons.attach_file, color: tealPrimary),
                ],
              ),
            ),
          ),
          const SizedBox(width: 10),
          const CircleAvatar(radius: 25, backgroundColor: tealPrimary, child: Icon(Icons.mic, color: Colors.white)),
        ],
      ),
    );
  }

  Widget _buildBottomNav() {
    return Container(
      height: 90,
      decoration: BoxDecoration(color: Colors.white, border: Border(top: BorderSide(color: Colors.black.withValues(alpha: 0.05)))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _navItem(Icons.home_filled, 'Home', false),
          _navItem(Icons.medical_services, 'Services', false),
          _navItem(Icons.group_rounded, 'Community', true),
          _navItem(Icons.person, 'Profile', false),
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
              child: const Icon(Icons.group_rounded, color: Color(0xFF334D48)),
            )
          : Icon(icon, color: navInactive, size: 26),
        const SizedBox(height: 4),
        Text(label, style: TextStyle(color: isActive ? tealPrimary : navInactive, fontWeight: isActive ? FontWeight.w900 : FontWeight.w700, fontSize: 12)),
      ],
    );
  }
}