import 'package:flutter/material.dart';

import '../app/app_theme.dart';
import '../models/door_item.dart';
import '../widgets/garpit_badge.dart';
import '../widgets/garpit_button.dart';

class DoorDetailScreen extends StatefulWidget {
  const DoorDetailScreen({super.key, required this.door});

  final DoorItem door;

  @override
  State<DoorDetailScreen> createState() => _DoorDetailScreenState();
}

class _DoorDetailScreenState extends State<DoorDetailScreen> {
  late bool _isLocked;
  String _selectedDuration = '5m';

  @override
  void initState() {
    super.initState();
    _isLocked = widget.door.status == DoorStatus.locked;
  }

  void _openDoor() {
    setState(() {
      _isLocked = false;
    });
  }

  void _lockDoor() {
    setState(() {
      _isLocked = true;
    });
  }

  void _selectDuration(String duration) {
    setState(() {
      _selectedDuration = duration;
    });

    if (duration == 'Custom') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Durasi custom akan disiapkan nanti.'),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(24, 28, 24, 24),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight - 52,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _BackButton(onTap: () => Navigator.of(context).pop()),
                        const SizedBox(width: 18),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  widget.door.title,
                                  style: textTheme.headlineLarge?.copyWith(
                                    fontSize: 32,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Anda punya akses ke pintu ini',
                                style: textTheme.bodyLarge?.copyWith(
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 28),
                    _DoorStatusCard(isLocked: _isLocked),
                    const SizedBox(height: 24),
                    Text(
                      'Aksi cepat',
                      style: textTheme.headlineMedium?.copyWith(
                        fontSize: 26,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 14),
                    GarpitButton(label: 'Open Door', onPressed: _openDoor),
                    const SizedBox(height: 14),
                    GarpitButton(
                      label: 'Lock Door',
                      variant: GarpitButtonVariant.secondary,
                      onPressed: _lockDoor,
                    ),
                    const SizedBox(height: 22),
                    _TemporaryOpenCard(
                      selectedDuration: _selectedDuration,
                      onSelect: _selectDuration,
                    ),
                    const SizedBox(height: 18),
                    const _AccessPermissionCard(),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _BackButton extends StatelessWidget {
  const _BackButton({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: GarpitColors.background,
      shape: const CircleBorder(
        side: BorderSide(color: GarpitColors.border, width: 1.5),
      ),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: const SizedBox(
          width: 44,
          height: 44,
          child: Icon(Icons.chevron_left, size: 30),
        ),
      ),
    );
  }
}

class _DoorStatusCard extends StatelessWidget {
  const _DoorStatusCard({required this.isLocked});

  final bool isLocked;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final statusText = isLocked ? 'Terkunci' : 'Terbuka';
    final badgeText = isLocked ? 'Ready to open' : 'Open';

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(26, 26, 26, 24),
      decoration: BoxDecoration(
        color: GarpitColors.surface,
        borderRadius: BorderRadius.circular(30),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0A061731),
            blurRadius: 18,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.asset(
              'assets/images/rfid_reader.png',
              width: 94,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Status pintu',
            style: textTheme.titleMedium?.copyWith(
              color: GarpitColors.textSecondary,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  statusText,
                  style: textTheme.displayLarge?.copyWith(
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              GarpitBadge(
                label: badgeText,
                variant: GarpitBadgeVariant.success,
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            'Terakhir dibuka 5 menit lalu oleh Anda',
            style: textTheme.bodyMedium?.copyWith(fontSize: 15),
          ),
        ],
      ),
    );
  }
}

class _TemporaryOpenCard extends StatelessWidget {
  const _TemporaryOpenCard({
    required this.selectedDuration,
    required this.onSelect,
  });

  final String selectedDuration;
  final ValueChanged<String> onSelect;

  static const _durations = ['5m', '15m', '30m', 'Custom'];

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(22, 20, 22, 18),
      decoration: BoxDecoration(
        color: GarpitColors.background,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: GarpitColors.border, width: 1.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Buka sementara',
            style: textTheme.titleLarge?.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Biarkan pintu terbuka dalam durasi tertentu.',
            style: textTheme.bodyMedium?.copyWith(fontSize: 15),
          ),
          const SizedBox(height: 14),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (final duration in _durations)
                _DurationChip(
                  label: duration,
                  selected: selectedDuration == duration,
                  onTap: () => onSelect(duration),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class _DurationChip extends StatelessWidget {
  const _DurationChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: onTap,
      radius: 28,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          color: selected ? GarpitColors.successBackground : Colors.transparent,
          borderRadius: BorderRadius.circular(999),
        ),
        child: Text(
          label,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
            color: selected
                ? const Color(0xFF05A77E)
                : GarpitColors.textSecondary,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}

class _AccessPermissionCard extends StatelessWidget {
  const _AccessPermissionCard();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(22, 20, 22, 20),
      decoration: BoxDecoration(
        color: GarpitColors.background,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: GarpitColors.border, width: 1.5),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Izin akses Anda',
                  style: textTheme.titleLarge?.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'Akses aktif sampai 18.00 hari ini',
                  style: textTheme.bodyMedium?.copyWith(fontSize: 15),
                ),
              ],
            ),
          ),
          const GarpitBadge(
            label: 'Active',
            variant: GarpitBadgeVariant.success,
          ),
        ],
      ),
    );
  }
}
