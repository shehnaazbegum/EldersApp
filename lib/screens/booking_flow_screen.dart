import 'package:flutter/material.dart';

// --- Design System ---
class LuminousUI {
  static const Color teal = Color(0xFF006D5B);
  static const Color amber = Color(0xFFFFB300);
  static const Color bg = Color(0xFFF6FAF8);
  static const Color surface = Colors.white;
  
  static const double outerPadding = 24.0;
  static const double cardRadius = 24.0;
  static const double sectionSpacing = 40.0;
}

class BookingFlowFinal extends StatelessWidget {
  const BookingFlowFinal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LuminousUI.bg,
      appBar: _buildAppBar(),
      body: Stack(
        children: [
          ListView(
            // Extra bottom padding to prevent content being hidden by the sticky bar
            padding: const EdgeInsets.fromLTRB(LuminousUI.outerPadding, 10, LuminousUI.outerPadding, 150),
            children: const [
              _ProgressTracker(),
              SizedBox(height: 32),
              _VoiceInstructionCard(),
              SizedBox(height: LuminousUI.sectionSpacing),
              _SectionTitle(title: 'Pick a Day', action: 'View Calendar'),
              SizedBox(height: 16),
              _HorizontalCalendar(),
              SizedBox(height: LuminousUI.sectionSpacing),
              _SectionTitle(title: 'Available Slots', icon: Icons.access_time_filled),
              SizedBox(height: 16),
              _TimeSlotSelector(),
              SizedBox(height: LuminousUI.sectionSpacing),
              _DurationPicker(),
              SizedBox(height: 24),
              _ServiceSummaryGrid(),
            ],
          ),
          const _FixedBottomBar(),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: false,
      leading: const Icon(Icons.arrow_back, color: LuminousUI.teal),
      title: const Text('Booking Flow', 
        style: TextStyle(color: LuminousUI.teal, fontWeight: FontWeight.w900, fontSize: 22)),
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 16),
          child: CircleAvatar(backgroundImage: NetworkImage('https://i.pravatar.cc/100?u=doc')),
        )
      ],
    );
  }
}

// --- Component: Progress Bar ---
class _ProgressTracker extends StatelessWidget {
  const _ProgressTracker();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('STEP 02 OF 04', 
          style: TextStyle(color: LuminousUI.teal, fontWeight: FontWeight.w900, fontSize: 13, letterSpacing: 1.1)),
        const SizedBox(height: 12),
        Row(
          children: List.generate(4, (i) => Expanded(
            child: Container(
              height: 5,
              margin: EdgeInsets.only(right: i == 3 ? 0 : 6),
              decoration: BoxDecoration(
                color: i < 2 ? LuminousUI.teal : Colors.black.withOpacity(0.08),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          )),
        ),
      ],
    );
  }
}

// --- Component: Voice Card ---
class _VoiceInstructionCard extends StatelessWidget {
  const _VoiceInstructionCard();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(color: const Color(0xFFF0F6F4), borderRadius: BorderRadius.circular(LuminousUI.cardRadius)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: LuminousUI.amber, borderRadius: BorderRadius.circular(14)),
            child: const Icon(Icons.mic, color: LuminousUI.teal, size: 28),
          ),
          const SizedBox(width: 16),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Select your preferred window', 
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.w900, height: 1.2)),
                SizedBox(height: 8),
                Text('Tap the microphone to tell us your schedule, or manually pick a time below.',
                  style: TextStyle(color: Colors.black54, fontSize: 14, fontWeight: FontWeight.w500, height: 1.4)),
              ],
            ),
          )
        ],
      ),
    );
  }
}

// --- Component: Horizontal Calendar ---
class _HorizontalCalendar extends StatelessWidget {
  const _HorizontalCalendar();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildDate('14', 'MON', true),
        _buildDate('15', 'TUE', false),
        _buildDate('16', 'WED', false),
        _buildDate('17', 'THU', false),
      ],
    );
  }

  Widget _buildDate(String day, String wk, bool selected) {
    return Container(
      width: 78,
      padding: const EdgeInsets.symmetric(vertical: 22),
      decoration: BoxDecoration(
        color: selected ? LuminousUI.teal : LuminousUI.surface,
        borderRadius: BorderRadius.circular(20),
        boxShadow: selected ? [BoxShadow(color: LuminousUI.teal.withOpacity(0.2), blurRadius: 15, offset: const Offset(0, 8))] : null,
      ),
      child: Column(
        children: [
          Text('OCT', style: TextStyle(color: selected ? Colors.white70 : Colors.black38, fontWeight: FontWeight.w900, fontSize: 12)),
          const SizedBox(height: 4),
          Text(day, style: TextStyle(color: selected ? Colors.white : Colors.black87, fontSize: 28, fontWeight: FontWeight.w900)),
          const SizedBox(height: 4),
          Text(wk, style: TextStyle(color: selected ? Colors.white70 : Colors.black38, fontWeight: FontWeight.w900, fontSize: 12)),
        ],
      ),
    );
  }
}

// --- Component: Time Slots ---
class _TimeSlotSelector extends StatelessWidget {
  const _TimeSlotSelector();
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: ['09:00 AM', '10:30 AM', '11:15 AM', '01:45 PM', '03:00 PM', '04:30 PM']
          .asMap()
          .entries
          .map((e) => _slot(e.value, e.key == 0))
          .toList(),
    );
  }

  Widget _slot(String time, bool selected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
      decoration: BoxDecoration(
        color: selected ? const Color(0xFFE1EFEC) : const Color(0xFFF1F5F4),
        borderRadius: BorderRadius.circular(30),
        border: selected ? Border.all(color: LuminousUI.teal, width: 2) : null,
      ),
      child: Text(time, style: TextStyle(color: selected ? LuminousUI.teal : Colors.black87, fontWeight: FontWeight.w900)),
    );
  }
}

// --- Component: Duration Card ---
class _DurationPicker extends StatelessWidget {
  const _DurationPicker();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(color: LuminousUI.surface, borderRadius: BorderRadius.circular(LuminousUI.cardRadius)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Duration', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900)),
                  Text('How much time do you need?', style: TextStyle(color: Colors.black45, fontWeight: FontWeight.w600)),
                ],
              ),
              RichText(text: const TextSpan(children: [
                TextSpan(text: '60', style: TextStyle(color: Colors.black, fontSize: 32, fontWeight: FontWeight.w900)),
                TextSpan(text: ' mins', style: TextStyle(color: Colors.black45, fontSize: 14, fontWeight: FontWeight.w900)),
              ])),
            ],
          ),
          const SizedBox(height: 24),
          SliderTheme(
            data: SliderThemeData(activeTrackColor: LuminousUI.teal, thumbColor: LuminousUI.teal, overlayColor: LuminousUI.teal.withOpacity(0.1)),
            child: Slider(value: 60, min: 30, max: 180, onChanged: (v) {}),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, 
              children: [Text('30m'), Text('60m'), Text('90m'), Text('120m'), Text('150m'), Text('180m')]),
          ),
          const SizedBox(height: 24),
          _infoNote(),
        ],
      ),
    );
  }

  Widget _infoNote() => Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(color: const Color(0xFFF0FBF8), borderRadius: BorderRadius.circular(14)),
    child: const Row(children: [
      Icon(Icons.info_outline, color: LuminousUI.teal, size: 20),
      SizedBox(width: 12),
      Expanded(child: Text('Standard sessions are 60 mins. Premium members get 15% extra time.', 
        style: TextStyle(color: LuminousUI.teal, fontSize: 13, fontWeight: FontWeight.w600))),
    ]),
  );
}

// --- Component: Sticky Footer ---
class _FixedBottomBar extends StatelessWidget {
  const _FixedBottomBar();
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: const EdgeInsets.fromLTRB(24, 20, 24, 40),
        decoration: BoxDecoration(color: LuminousUI.surface, border: Border(top: BorderSide(color: Colors.black.withOpacity(0.05)))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('TOTAL PRICE', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w900, color: Colors.black45)),
                Text('\$85.00', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900)),
              ],
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: LuminousUI.teal,
                padding: const EdgeInsets.symmetric(horizontal: 44, vertical: 18),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                elevation: 0,
              ),
              child: const Row(children: [
                Text('Continue', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 17)),
                SizedBox(width: 12),
                Icon(Icons.arrow_forward, color: Colors.white, size: 20),
              ]),
            )
          ],
        ),
      ),
    );
  }
}

// --- Shared Utilities ---
class _SectionTitle extends StatelessWidget {
  final String title;
  final String? action;
  final IconData? icon;
  const _SectionTitle({required this.title, this.action, this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(children: [
          if (icon != null) ...[Icon(icon, color: LuminousUI.teal, size: 22), const SizedBox(width: 10)],
          Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w900)),
        ]),
        if (action != null) Text(action!, style: const TextStyle(color: LuminousUI.teal, fontWeight: FontWeight.w900)),
      ],
    );
  }
}

class _ServiceSummaryGrid extends StatelessWidget {
  const _ServiceSummaryGrid();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _smallCard('Therapeutic\nMassage', 'Aromatherapy\nincluded', Icons.eco, const Color(0xFFE8F1EF)),
        const SizedBox(width: 16),
        _smallCard('Dr. Elena\nThorne', 'PRACTITIONER', Icons.star, const Color(0xFFF9F4E4), isStar: true),
      ],
    );
  }

  Widget _smallCard(String t, String s, IconData i, Color b, {bool isStar = false}) => Expanded(
    child: Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: b, borderRadius: BorderRadius.circular(LuminousUI.cardRadius)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(i, color: isStar ? LuminousUI.amber : LuminousUI.teal, size: 28),
          const SizedBox(height: 16),
          if (isStar) const Text('Top Rated', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 12)),
          Text(t, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w900, height: 1.2)),
          const SizedBox(height: 4),
          Text(s, style: const TextStyle(color: Colors.black38, fontWeight: FontWeight.w900, fontSize: 11, letterSpacing: 0.2)),
        ],
      ),
    ),
  );
}