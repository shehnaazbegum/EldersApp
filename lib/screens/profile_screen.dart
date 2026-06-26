import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  final String userName;
  final String role; // "Elder" or "Family Member"
  final String phoneNumber;
  final String? avatarUrl;

  const ProfileScreen({
    super.key,
    this.userName = "Anjali Sharma",
    this.role = "Elder",
    this.phoneNumber = "+91 98765 43210",
    this.avatarUrl,
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final Color _primaryColor = const Color(0xFFEF4F5F); // Zomato-style brand red
  final Color _scaffoldColor = const Color(0xFFF8F8F8);

  bool _notificationsEnabled = true;
  bool _locationSharingEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _scaffoldColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        scrolledUnderElevation: 1,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black87, size: 18),
          onPressed: () => Navigator.maybePop(context),
        ),
        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w900),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.settings_outlined, color: Colors.grey.shade700),
            onPressed: () => _showComingSoon(context, "Settings"),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
        children: [
          _buildProfileHeader(),
          const SizedBox(height: 16),
          _buildHealthSnapshot(),
          const SizedBox(height: 16),
          _buildEmergencyCard(),
          const SizedBox(height: 24),

          _buildSectionLabel("Account"),
          _buildMenuCard([
            _MenuEntry(Icons.person_outline_rounded, "Personal Information", "Name, age, gender & more"),
            _MenuEntry(Icons.location_on_outlined, "Saved Addresses", "Home, hospital & others"),
            _MenuEntry(Icons.diversity_3_outlined, "Family Members", "Linked caregivers & relatives"),
          ]),
          const SizedBox(height: 24),

          _buildSectionLabel("Health & Care"),
          _buildMenuCard([
            _MenuEntry(Icons.medical_information_outlined, "Medical Records", "Reports & health history"),
            _MenuEntry(Icons.medication_outlined, "Prescriptions", "Active & past medicines"),
            _MenuEntry(Icons.favorite_border_rounded, "Care Plan", "Your assigned caregivers"),
          ]),
          const SizedBox(height: 24),

          _buildSectionLabel("Activity"),
          _buildMenuCard([
            _MenuEntry(Icons.receipt_long_outlined, "My Bookings", "Track & manage orders"),
            _MenuEntry(Icons.account_balance_wallet_outlined, "Payment Methods", "Cards, UPI & wallet"),
            _MenuEntry(Icons.bookmark_border_rounded, "Saved Items", "Pharmacies & services"),
          ]),
          const SizedBox(height: 24),

          _buildSectionLabel("Preferences"),
          _buildPreferencesCard(),
          const SizedBox(height: 24),

          _buildSectionLabel("Support"),
          _buildMenuCard([
            _MenuEntry(Icons.help_outline_rounded, "Help Center", "FAQs & contact us"),
            _MenuEntry(Icons.info_outline_rounded, "About Quidado", "Version & legal"),
            _MenuEntry(Icons.shield_outlined, "Privacy & Terms", "How we protect your data"),
          ]),
          const SizedBox(height: 24),

          _buildLogoutButton(),
          const SizedBox(height: 16),
          Center(
            child: Text(
              "Quidado • v1.0.0",
              style: TextStyle(color: Colors.grey.shade400, fontSize: 12, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }

  // --- Profile Header Card ---
  Widget _buildProfileHeader() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 12, offset: const Offset(0, 4))],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    radius: 34,
                    backgroundColor: const Color(0xFFFFF1F1),
                    backgroundImage: widget.avatarUrl != null ? NetworkImage(widget.avatarUrl!) : null,
                    child: widget.avatarUrl == null
                        ? Icon(Icons.person, color: _primaryColor, size: 36)
                        : null,
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: _primaryColor,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                      child: const Icon(Icons.camera_alt, color: Colors.white, size: 12),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.userName,
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w900, color: Colors.black87),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.phoneNumber,
                      style: TextStyle(fontSize: 13, color: Colors.grey.shade600, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 8),
                    _buildRoleChip(),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            height: 44,
            child: OutlinedButton.icon(
              onPressed: () => _showComingSoon(context, "Edit Profile"),
              icon: Icon(Icons.edit_outlined, size: 16, color: _primaryColor),
              label: Text(
                "Edit Profile",
                style: TextStyle(color: _primaryColor, fontWeight: FontWeight.bold),
              ),
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: _primaryColor.withOpacity(0.4)),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRoleChip() {
    final bool isElder = widget.role.toLowerCase().contains("elder");
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: isElder ? const Color(0xFFFFF1F1) : const Color(0xFFF1F7FF),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isElder ? Icons.elderly : Icons.family_restroom,
            size: 14,
            color: isElder ? _primaryColor : const Color(0xFF3B82F6),
          ),
          const SizedBox(width: 4),
          Text(
            widget.role,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
              color: isElder ? _primaryColor : const Color(0xFF3B82F6),
            ),
          ),
        ],
      ),
    );
  }

  // --- Health Snapshot Row ---
  Widget _buildHealthSnapshot() {
    return Row(
      children: [
        _buildStatCard(Icons.cake_outlined, "Age", "72 yrs"),
        const SizedBox(width: 12),
        _buildStatCard(Icons.bloodtype_outlined, "Blood", "B+"),
        const SizedBox(width: 12),
        _buildStatCard(Icons.monitor_heart_outlined, "Plan", "Premium"),
      ],
    );
  }

  Widget _buildStatCard(IconData icon, String label, String value) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 8)],
        ),
        child: Column(
          children: [
            Icon(icon, color: _primaryColor, size: 22),
            const SizedBox(height: 8),
            Text(value, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w900, color: Colors.black87)),
            const SizedBox(height: 2),
            Text(label, style: TextStyle(fontSize: 11, color: Colors.grey.shade500, fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }

  // --- Emergency / SOS Card ---
  Widget _buildEmergencyCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [_primaryColor, const Color(0xFFD63447)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(18),
        boxShadow: [BoxShadow(color: _primaryColor.withOpacity(0.3), blurRadius: 16, offset: const Offset(0, 6))],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(color: Colors.white.withOpacity(0.2), shape: BoxShape.circle),
            child: const Icon(Icons.emergency_outlined, color: Colors.white, size: 24),
          ),
          const SizedBox(width: 14),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Emergency Contact", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 15)),
                SizedBox(height: 2),
                Text("Ravi Sharma (Son) • +91 90000 11111",
                    style: TextStyle(color: Colors.white70, fontSize: 12)),
              ],
            ),
          ),
          GestureDetector(
            onTap: () => _showComingSoon(context, "SOS Alert"),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Text("SOS", style: TextStyle(color: _primaryColor, fontWeight: FontWeight.w900, fontSize: 13)),
            ),
          ),
        ],
      ),
    );
  }

  // --- Section Label ---
  Widget _buildSectionLabel(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, bottom: 10),
      child: Text(
        title,
        style: TextStyle(fontSize: 13, fontWeight: FontWeight.w800, color: Colors.grey.shade500, letterSpacing: 0.3),
      ),
    );
  }

  // --- Menu Card (group of list tiles) ---
  Widget _buildMenuCard(List<_MenuEntry> entries) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 8)],
      ),
      child: Column(
        children: [
          for (int i = 0; i < entries.length; i++) ...[
            _buildMenuTile(entries[i]),
            if (i != entries.length - 1)
              Divider(height: 1, thickness: 1, color: Colors.grey.shade100, indent: 60, endIndent: 16),
          ],
        ],
      ),
    );
  }

  Widget _buildMenuTile(_MenuEntry entry) {
    return InkWell(
      onTap: () => _showComingSoon(context, entry.title),
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(color: const Color(0xFFFFF1F1), borderRadius: BorderRadius.circular(10)),
              child: Icon(entry.icon, color: _primaryColor, size: 20),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(entry.title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.black87)),
                  const SizedBox(height: 2),
                  Text(entry.subtitle, style: TextStyle(fontSize: 11.5, color: Colors.grey.shade500)),
                ],
              ),
            ),
            Icon(Icons.chevron_right_rounded, color: Colors.grey.shade400, size: 22),
          ],
        ),
      ),
    );
  }

  // --- Preferences Card (with toggles) ---
  Widget _buildPreferencesCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 8)],
      ),
      child: Column(
        children: [
          _buildToggleTile(
            Icons.notifications_outlined,
            "Notifications",
            "Order & medication reminders",
            _notificationsEnabled,
            (v) => setState(() => _notificationsEnabled = v),
          ),
          Divider(height: 1, thickness: 1, color: Colors.grey.shade100, indent: 60, endIndent: 16),
          _buildToggleTile(
            Icons.my_location_outlined,
            "Location Sharing",
            "Let family track for safety",
            _locationSharingEnabled,
            (v) => setState(() => _locationSharingEnabled = v),
          ),
        ],
      ),
    );
  }

  Widget _buildToggleTile(IconData icon, String title, String subtitle, bool value, ValueChanged<bool> onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(color: const Color(0xFFFFF1F1), borderRadius: BorderRadius.circular(10)),
            child: Icon(icon, color: _primaryColor, size: 20),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.black87)),
                const SizedBox(height: 2),
                Text(subtitle, style: TextStyle(fontSize: 11.5, color: Colors.grey.shade500)),
              ],
            ),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: Colors.white,
            activeTrackColor: _primaryColor,
          ),
        ],
      ),
    );
  }

  // --- Logout Button ---
  Widget _buildLogoutButton() {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: OutlinedButton.icon(
        onPressed: () => _confirmLogout(context),
        icon: Icon(Icons.logout_rounded, color: _primaryColor, size: 18),
        label: Text("Log Out", style: TextStyle(color: _primaryColor, fontWeight: FontWeight.w800, fontSize: 15)),
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: _primaryColor.withOpacity(0.4)),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }

  // --- Helpers ---
  void _showComingSoon(BuildContext context, String feature) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("$feature coming soon"),
        backgroundColor: Colors.black87,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  void _confirmLogout(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text("Log Out?", style: TextStyle(fontWeight: FontWeight.w900, color: Colors.black87)),
        content: Text("You'll need to sign in again to access your account.",
            style: TextStyle(color: Colors.grey.shade600)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text("Cancel", style: TextStyle(color: Colors.grey.shade600, fontWeight: FontWeight.bold)),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(ctx),
            style: ElevatedButton.styleFrom(
              backgroundColor: _primaryColor,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            child: const Text("Log Out"),
          ),
        ],
      ),
    );
  }
}

class _MenuEntry {
  final IconData icon;
  final String title;
  final String subtitle;
  const _MenuEntry(this.icon, this.title, this.subtitle);
}
