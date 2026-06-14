import 'package:flutter/material.dart';

import '../app/garpit_app_frame.dart';
import '../app/app_theme.dart';
import '../models/door_item.dart';
import '../widgets/access_pass_card.dart';
import '../widgets/door_list_item.dart';
import '../widgets/garpit_bottom_nav.dart';
import 'door_detail_screen.dart';

class DoorsScreen extends StatelessWidget {
  const DoorsScreen({super.key});

  static const _doors = [
    DoorItem(
      title: 'Main Entrance',
      subtitle: 'Buka 24 jam sesuai izin',
      status: DoorStatus.locked,
      selected: true,
    ),
    DoorItem(
      title: 'Office Door',
      subtitle: 'Senin-Jumat, 08.00-18.00',
      status: DoorStatus.locked,
    ),
    DoorItem(
      title: 'Meeting Room',
      subtitle: 'Akses sampai 16.30',
      status: DoorStatus.open,
    ),
  ];

  void _showPlaceholder(BuildContext context, String label) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$label belum tersedia.'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _openDoorDetail(BuildContext context, DoorItem door) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (context) =>
            GarpitAppFrame(child: DoorDetailScreen(door: door)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GarpitBottomNav(
        onPlaceholderTap: (label) {
          _showPlaceholder(context, label);
        },
      ),
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 26, 24, 0),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Align(
                alignment: Alignment.topCenter,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    width: constraints.maxWidth,
                    child: _DoorsContent(
                      doors: _doors,
                      onAvatarTap: () => _showPlaceholder(context, 'Profile'),
                      onDoorTap: (door) => _openDoorDetail(context, door),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _DoorsContent extends StatelessWidget {
  const _DoorsContent({
    required this.doors,
    required this.onAvatarTap,
    required this.onDoorTap,
  });

  final List<DoorItem> doors;
  final VoidCallback onAvatarTap;
  final ValueChanged<DoorItem> onDoorTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Pintu Saya',
                    style: textTheme.headlineLarge?.copyWith(
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'Pilih pintu yang bisa Anda akses',
                    style: textTheme.bodyLarge?.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 18),
            GestureDetector(
              onTap: onAvatarTap,
              child: Container(
                width: 44,
                height: 44,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: GarpitColors.background,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x10061731),
                      blurRadius: 22,
                      offset: Offset(0, 10),
                    ),
                  ],
                ),
                child: Text(
                  'S',
                  style: textTheme.titleLarge?.copyWith(
                    fontSize: 19,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 18),
        const AccessPassCard(),
        const SizedBox(height: 18),
        Text(
          'Akses tersedia',
          style: textTheme.headlineMedium?.copyWith(
            fontSize: 24,
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 10),
        for (final door in doors) ...[
          DoorListItem(door: door, onTap: () => onDoorTap(door)),
          const SizedBox(height: 8),
        ],
      ],
    );
  }
}
