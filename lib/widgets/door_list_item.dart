import 'package:flutter/material.dart';

import '../app/app_theme.dart';
import '../models/door_item.dart';
import 'garpit_badge.dart';

class DoorListItem extends StatelessWidget {
  const DoorListItem({super.key, required this.door, required this.onTap});

  final DoorItem door;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final isOpen = door.status == DoorStatus.open;

    return Material(
      color: GarpitColors.background,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(14, 12, 12, 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: door.selected ? GarpitColors.teal : GarpitColors.border,
              width: door.selected ? 2 : 1.5,
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: door.selected
                      ? const Color(0xFFE5FBF5)
                      : GarpitColors.surface,
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        door.title,
                        style: textTheme.titleLarge?.copyWith(
                          fontSize: 19,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      door.subtitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: textTheme.bodyMedium?.copyWith(fontSize: 13),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              GarpitBadge(
                label: door.statusLabel,
                variant: isOpen
                    ? GarpitBadgeVariant.success
                    : GarpitBadgeVariant.muted,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
