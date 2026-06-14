enum DoorStatus { locked, open }

class DoorItem {
  const DoorItem({
    required this.title,
    required this.subtitle,
    required this.status,
    this.selected = false,
  });

  final String title;
  final String subtitle;
  final DoorStatus status;
  final bool selected;

  String get statusLabel {
    return switch (status) {
      DoorStatus.locked => 'Terkunci',
      DoorStatus.open => 'Terbuka',
    };
  }
}
